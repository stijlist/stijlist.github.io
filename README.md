# blogserver

a blog server with all static files embedded into the binary.
built with djb redo.

# rationale

none really, it just seemed fun!

# performance

on my M1 macbook it looks like 50k requests per second:

```
~/c/blogserver:main:> wrk --latency -t16 -c1000 -d30s http://127.0.0.1:8080
Running 30s test @ http://127.0.0.1:8080
  16 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     4.84ms    7.55ms 131.49ms   91.31%
    Req/Sec     3.92k     2.21k   12.43k    63.87%
  Latency Distribution
     50%    2.65ms
     75%    4.58ms
     90%   10.80ms
     99%   38.94ms
  1522321 requests in 30.10s, 13.67GB read
  Socket errors: connect 755, read 104, write 0, timeout 0
Requests/sec:  50583.38
Transfer/sec:    464.99MB
```

on a 1 VCPU DigitalOcean box in NYC it looks like 3.5k requests per second:

```
~/c/blogserver:main: (1)> wrk -t16 -c400 -d30s http://68.183.140.82:8080
Running 30s test @ http://68.183.140.82:8080
  16 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    74.56ms   91.39ms   2.00s    98.33%
    Req/Sec   222.61    119.94   475.00     59.42%
  104430 requests in 30.10s, 0.94GB read
  Socket errors: connect 163, read 0, write 0, timeout 35
Requests/sec:   3469.50
Transfer/sec:     31.89MB
```

# building

Ensure you have go, a djb redo implementation, and commonmark (to convert md -> html).
```
brew install cmark redo go
```

`redo blogserver` should build everything, but it doesn't - you'll have to manually run `redo index.html` as well.

# improvements

* We should probably separate the input and output files (currently all in
`files/*`) to different directories so the inputs don't end up in the binary.
* `redo blogserver` should re-run `redo index.html` if there are any new input files.

