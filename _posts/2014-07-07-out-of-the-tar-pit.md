---
layout: post
---
I was re-reading ["Out of the Tar Pit"](http://shaffner.us/cs/papers/tarpit.pdf) earlier last week. It's a paper written
by Ben Mosely and Peter Marks, discussing the complexity of software and
approaches to software engineering that attempt to reduce software to its essential
complexity. This is how I imagined their thought process:

1. Functional programming feels really great and seems to cut down the complexity
of our code!
2. *Why is this the case?*
3. Pure functions can't have side effects and are easy to reason about!
4. But you can trivially compose any program of pure functions just by passing
the state of the world into every function!
5. Wait, that can't be the silver bullet, then... what else do well-designed 
(read: simple) functional programs have in common?
5. OH! Good functional programs are explicit about their management of state!

This was something of a eureka moment for me, because it answered a lingering
question I've had about functional programming for some time: if functional
programming is the answer to the problem of software complexity, why have some 
of the best-written and simplest software systems I've seen (see plan 9) been 
written in simple imperative languages?

I'm going to posit that the effect of managing state well dominates the effect
of programming with pure functions as programs get bigger. 
