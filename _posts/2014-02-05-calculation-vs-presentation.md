---
title: calculation vs presentation
layout: post
---
I’m working on an app for the iPhone right now called “set the bar,” which is designed to facilitate quickly entering weighted grades. I think it’s interesting that I have the option of writing the core math routines (averaging, weighting) in raw C or writing them in objective C, and I’m evaluating the trade offs of both. From what I can tell, writing in C would be more succinct and simpler conceptually, but slightly more bug-prone. Writing such a simple set of primitives in objective-C trades simplicity for safety, I think, and right now I don’t feel like wrapping all my numerical methods in casts and `[NSNumber numberWithFloat: float]` calls. C it is.

This begs the question of when, exactly, it’s appropriate to use raw C in my iOS projects. I think one good criterion is whether most of your computation is going to be done on the stack; if your code is simple enough that you don’t need to heap-allocate any objects, maybe there’s no problem with just using the simplest tool for the job. In this app, then, I’ll likely use C for all of the *calculation* and objective-C for all of the *presentation*. It seems like an interesting way to separate the layers of my application.
