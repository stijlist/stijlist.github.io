---
layout: post
---
_(or, we need to build the Minix to WebKit's Linux, and here's why)_

**TL;DR**: Webkit is insanely complicated. We need an educational system like Minix
for the browser so we can teach, learn and build a faster and better web.

**961,221 lines of code.**

That's the barrier between me and understanding [WebCore][1], the HTML
and CSS rendering engine at the heart of [WebKit][2].
Again, that's just WebCore, only one of the components of WebKit proper.  

Is this necessary? I don't know. Necessary is a difficult word to define, but
here I'm getting at the notions of [essential complexity][3], or ["Kolmogorov complexity."][4]

Look at the difference between the [Linux][5] and [Minix][6] kernels. Linux
is [14,000,000 lines of code and growing][7], while Minix ostensibly accomplishes
the same goals in about [3800 lines of code][8]. This suggests that the essential complexity of a kernel might be two orders of magnitude less than the complexity of Linux. 

By analogy, **it seems as though WebCore's rendering engine might have a much smaller Kolmogorov complexity than its 75,000 lines of code would 
imply**. 
Another example, a programmer's editor: Vim vs Vi. [Vim is a million lines of 
code][9], while BSD [ex-vi is about 18,000][10], and most people still [don't even maximize 
the efficiency of vi][11]. 

In the past few months I've been fascinated by the complexity of the
systems I use every day and I'm trying to get an intuitive sense of their
"essential complexity" compared to their complexity as implemented. 

There are minimal "hackable" versions of [terminals][12], kernels, and text
editors, but **we don't have a browser built with [simplicity][13] or [teachability][14] in 
mind**. [Minix helped Linus learn how kernels work, and we got Linux out of it][15]. What could a smart student do given a browser designed with the same goals?

Because the web is so important to us, I think it's becoming extremely
important for us to understand its core technologies at a deeper level. One of the best ways we could move forward in pursuit of that goal would be **building a 
browser that aims to be the Minix to WebKit's Linux**. 

With a system like this, we'd make it possible for users to pop the hood and 
**tinker for learning or leisure**. 

We'd **lower one of the biggest barriers** that keep people from being able to 
contribute to the improvement of their computers. 

We'd facilitate **faster prototyping** and a **quicker response cycle for the W3C**, the 
web standards body, making the standards process better for all involved.  

We could **permanently move the needle on the rate at which we
improve the web.**

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


_(Edit: after reading some of the comments, I realize that I sacrificed too much of my argument in the pursuit of conciseness. Hopefully, this fills in some of the gaps.)_

To clarify: 

What I actually think the community would be capable of building in a reasonable amount of time is **a rendering and layout engine for HTML5/CSS3**, not a full-out reimplementation of WebKit in two orders of magnitude less code.

The HTML5 parser is extremely thoroughly specified, and so is Javascript, because specifying a parser and specifying a programming language/interpreter are both well-known solved problems, but doing layout and reflow of content like our browser engines do all the time is not very close to any well-understood problem in CS now.

As a student reading the source code, I want to know how we do this. What heuristics do we use that are most effective? In what places could they be made better? What portions of them are still implemented for legacy reasons?

The only thing I know how to relate this to is perhaps the bin-packing problem, which is known to be NP-hard.


Minix3 is two orders of magnitude smaller than Linux because it tightly controls the scope of the problem (memory management, device management, and system calls) in the interest of teachability and security. 

In the same way, I think we can build a teachable, well-engineered rendering/layout engine in &lt; 20,000 lines of code. By comparison, the rendering engine in NetSurf (an open-source browser designed for RISC OS) is about 5400 lines of code.

If you're interested and want to discuss this further, I'm [@_bolted][16] on Twitter. Let's talk.

_(I'm currently working on [checkit.co](www.checkit.co), a service that automates scheduling Google Calendar events.)_

[1]: https://en.wikipedia.org/wiki/WebKit#WebCore
[2]: https://en.wikipedia.org/wiki/WebKit
[3]: https://en.wikipedia.org/wiki/Essential_complexity
[4]: https://en.wikipedia.org/wiki/Kolmogorov_complexity
[5]: https://en.wikipedia.org/wiki/Linux_kernel
[6]: https://en.wikipedia.org/wiki/Minix
[7]: http://linuxcost.blogspot.com/2011/03/cost-of-linux.html
[8]: http://www.freesoftwaremagazine.com/articles/minix
[9]: https://github.com/b4winckler/vim/graphs/code-frequency
[10]: https://gist.github.com/bolted/5407677#file-ex-vi-cloc
[11]: http://blog.superuser.com/2012/03/06/understanding-the-improved-in-vim/
[12]: http://st.suckless.org/
[13]: http://www.infoq.com/presentations/Simple-Made-Easy
[14]: http://www.learnlinux.ie/content/linus-torvalds-original-announcement-usenet
[15]: http://www.learnlinux.ie/content/linus-torvalds-original-announcement-usenet
[16]: twitter.com/_bolted