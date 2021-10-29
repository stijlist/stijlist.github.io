---
title: assessing python startup time (for potential speedups with io_uring)
layout: post
---

(trying the one-pass / no editing blog post style)

A few months ago I learned that python (and other interpreted languages') RPATH lookups involve a non-trivial amount of compute. For each invocation of the python interpreter, python makes ~hundreds of serial calls to `stat` and related functions before running user code (cf. ['What I've Learned About Optimizing Python'][0], [ENOENT caching in distri][1]). Each `stat` system call costs some amount of time (~200ns-5us) and also causes a [context switch][2] into and out of the kernel. There are many workloads which invoke the Python interpreter 100s of times.

I was curious whether it'd be worth using io_uring for reducing startup and module importing overhead. 

[Wesley](https://blog.wesleyac.com) and I looked at this this morning - our plan was roughly:

- strace python startup 
  - assess whether RPATH lookups are a meaningful part of python startup time
- write a c program that makes the same system calls as that strace log
- write that same program using io_uring and see if we see a speedup

    $ time python hello_world.py
    0.01s (0.07 user 0.01 system)
    $ rg 'stat' hello_world.py.log | wc -l
    252

Wes used a slick command line trick (["Quick and Dirty Syscall Profiling with strace and VisiData"](https://blog.wesleyac.com/posts/syscall-profiling-visidata) to get a histogram of system calls the python interpreter made.

The cost of stat from [this stackoverflow answer][3] is on the order of microseconds per system call.
250us is roughly the right order of magnitude for the amount of system time we see spent (I'm running on an M1 Mac so I expect my results will be faster than the ones in that stackoverflow answer).
I'd guess that 1-10% of python interpreter time is spent running `stat` and friends and context switching back.

Let's verify this with `perf` and a flamegraph.
We'll run perf sampling at 50khz:                                                    

    $ sudo perf record -F 50000 -a -g -e "raw_syscalls:*" -- python3 /tmp/hello.py

From the [output][4]:
  - 10% of 'python' time is spent in __fstat64
  - 10% of 'python' time is spent in __xstat64

If we're reading the flamegraph right, this matches our intuition - on the order of 10% of python interpreter time in hello_world is spent on stat and friends.

It seems like it might actually be worth trying to reduce the time RPATH lookups take.
This depends on the speedup we'd get from using io_uring (e.g. can we actually batch these `stat` calls) - we might look at this more in the future. 

[0]: https://gregoryszorc.com/blog/2019/01/10/what-i%27ve-learned-about-optimizing-python/
[1]: https://github.com/distr1/distri/commit/b6a0e43368d54d5ed0e03af687158dc3e2106e38
[2]: https://eli.thegreenplace.net/2018/measuring-context-switching-and-memory-overheads-for-linux-threads/
[3]: https://stackoverflow.com/questions/32748530/on-linux-is-access-faster-than-stat
[4]: https://gist.github.com/stijlist/399a6c6f26119df96838dfa543e115d7#file-perf-svg
