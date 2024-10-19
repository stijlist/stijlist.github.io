---
title: somewhat measurable tests of ability
layout: post
---
I had a great talk with Mel Chua (one of our wonderful hacker school residents) last week about learning styles, motivation, and goal-setting. It was illuminating in many ways, but I'll just talk here about one aspect I attempted to put into practice this weekend.

Mel talked about measurable goals as the basis for both deliberate practice and task-scoping, an idea I'd been exposed to before (through Malcolm Gladwell's "Outliers," among other things) and I decided to try and see how much of the work I'd put in to [my iPad IDE](https://www.youtube.com/watch?v=ck5ogFiWGpQ) had paid off in the form of useful iOS development skills. Or, in measurable terms, how quickly could I write an app?

To test this, I decided to write an app that logged what I was drinking and graphed estimates of my level of hydration throughout the day. In five hours' work (two roughly continuous 2.5 hour blocks) I built the domain model, the interface, and some basic persistence, and set up the infrastructure for doing the graph screen. When it came time to actually do the graph screen, though, I opted against drawing bezier paths in objective-c (yeah, it sounded uncomfortable to me, too) and decided to use d3.js, a tool I'd wanted to learn for a while anyway, so my experiment ended there. 

I came away from the experience with a renewed appreciation for Cocoa, Objective-C, and Xcode, and found at least one edge of my skills envelope (doing custom drawing using iOS graphics primitives and Core Animation). This is a perfect target for further study. Moreover, the knowledge that it's possible to enjoy working in a vanilla Cocoa environment is reassuring, especially as I approach the end of this Hacker School batch and the inevitable job search process. 

In short, I'd declare this experiment in (slightly) more deliberate practice a success. It's fascinating how something so simple as "writing down my expectations and what I'm measuring" before programming is enough make the entire process vastly more productive, both in terms of how efficiently I actually wrote code and how much knowledge I gained from the process. 
