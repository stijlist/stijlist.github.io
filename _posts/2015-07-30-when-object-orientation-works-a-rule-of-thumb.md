---
title: when object-orientation works: a rule of thumb
layout: post
---
The Swift community has recently had an interesting discussion about "when to
use classes vs when to use structs." The conclusion I think has been most widely
accepted is ["use classes when you need reference semantics, and use structs when
you need value semantics."](https://www.mikeash.com/pyblog/friday-qa-2015-07-17-when-to-use-swift-structs-and-classes.html). 

"Classes for references, structs for values" is just a small part of a bigger
picture, though. I'd argue that when you need reference semantics for something
(the database, the GPU, the server), object-oriented design principles best
inform how to interact with it, and when you need value semantics for something
(a user record, a UI scenegraph, a transaction), functional programming
principles best inform how to transform it.

The lovely thing about this is that it takes "when do I use FP vs OO?" - which
used to be a very involved decision for me - and boils it down to one concrete
rule of thumb: 

* If something must be modeled as a singleton, use OO design principles to code for it. If it's not, use FP.

This has clarified some things immensely for me, like "why does the IO monad seem
like such a friction point in Haskell?" (sockets and files are singletons!) or 
"why does the Actor model seem to work so well for programming distributed systems in Erlang?"
(each machine & message sink is a singleton). It also helped me understand why
we gain so much from going 100% functional/immutable in spite of the fact that the
paradigm isn't usually a perfect fit for our entire domain - there are many fewer
singleton concepts in most problems than non-singleton concepts.

You can see an example of object-oriented approach sneaking into a functional language in Clojure's [component](https://github.com/stuartsierra/component) 
state-management library. Dependencies are injected, components have constructors and destructors
(the `start` and `stop` protocol methods), and the examples are singletons: databases, schedulers,
and the like. Conversely, you can see a really functional approach to business logic sneaking into 
high-performance object-oriented systems like [LMAX](http://martinfowler.com/articles/lmax.html)
and seminal books like [Java Concurrency in Practice](http://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601).

The value/reference dichotomy also corresponds really nicely to ["functional core, imperative shell"](https://www.destroyallsoftware.com/screencasts/catalog/functional-core-imperative-shell), 
a principle for architecting programs [invented by Gary Bernhardt](https://www.destroyallsoftware.com/talks/boundaries). To
paraphrase him loosely: The things at the boundary of your system (taking input
from the user, drawing output on the screen, talking to the network) are part
of the "imperative shell" of your program, an area in which very few decisions
need to be made, but many processes need to be integrated. The computations at
the core of your system (making decisions about your domain that determine what
is input and output) comprise the "functional core": here your domain can be
modeled immutably, unit tested in isolation, and be manipulated with pure
functions.  When one "imperative shell" needs to talk to another, it can do so
by sending it messages that are just immutable values from the functional core - either
on an explicit queue as in CSP or an implicit one as in the Actor model.

The part of your program that you use value semantics and functional programming
to model (the "functional core") is well served by applying FP dogma: use
immutable values, transform them with pure functions, maintain as little state
as possible, and unit test.

The part of your program that you use reference semantics and object-oriented
programming to model (the "imperative shell") is well served by applying
OO dogma: tell, don't ask, encapsulate state, separate commands and queries,
invert dependencies, minimize API surface area, and integration test.

I have a theory that value semantics are an indicator of the parts of your program
that are [trivially parallel](https://vimeo.com/6624203), but [not concurrent](https://www.youtube.com/watch?v=cN_DpYBzKso),
and reference semantics indicate
the inverse, but I'm far from an expert in the area and not bold enough to make
the claim outright without further investigation. It seems like a good sign that
[the parallel Haskell runtime uses purity as a criterion for work-stealing 
parallelism](http://community.haskell.org/~simonmar/slides/cadarache2012/1%20-%20parallel%20haskell.pdf). 

The final thing I'd like to note: We gain immense power from taking a concept
that we only knew how to handle with reference semantics and figure out how to
model it with value semantics. Think about the hype that React.js is getting
now, not as a JavaScript framework, but _a way to [model user interface as a
value](http://swannodette.github.io/2013/12/17/the-future-of-javascript-mvcs/)_ - it's changing the way people think about user interface programming
because of the [power value semantics give us](https://www.youtube.com/watch?v=xsSnOQynTHs).
If you've already drank [the Datomic kool-aid](http://www.infoq.com/presentations/Deconstructing-Database),
you can see that it's doing the same thing - taking the database, something
that used to be modeled as a reference, and enabling us to [model it as a value](http://www.infoq.com/presentations/Datomic-Database-Value) &sup1;. 

In short: 

Use object-oriented programming / reference semantics / mutability / concurrent
abstractions / integration testing for concepts that are best modeled as
singletons.

Use functional programming / value semantics / immutability / parallel abstractions
/ unit testing for everything else.

<br>
<br>

--- 

&sup1; React and Datomic hint at a general strategy for doing this: take a snapshot of the thing
you have a reference to, transform the snapshot as if it's a value, then atomically sync your
snapshot with the real thing. The tricky part is providing performant implementations for 
snapshotting & syncing back.

<br>
<br>

_Huge thanks to [Justin](https://twitter.com/modernserf), [Tim](https://twitter.com/shelfuu), [Max](https://github.com/cowpig), Noam, Feivel and [Samer](https://samertm.com) for reading drafts of this and providing feedback, to [Julia](https://twitter.com/b0rk) for convincing me to write this up, and to Gary Bernhardt, Rich Hickey, and Rob Pike for their excellent pedagogy._
