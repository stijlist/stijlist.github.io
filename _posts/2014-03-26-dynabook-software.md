---
title: dynabook software
layout: post
---
I saw [David Nolen's wonderful Clojure West talk today][1], and it inspired me immensely.  Specifically, the two demos he showed towards the end: [zenrise, an
interface builder][2] by [@sgrove][3], and [session, a Mathematica-like
notebook][4] by [@kovasb][5], both written in [ClojureScript](https://github.com/clojure/clojurescript) using [Om][6].  

Imagine this. You boot up your Nexus 7 or (I wish) iPad, and instead of iOS or
Android, you see a system like [Firefox OS][7], built on HTML web components.
On top of the core system apps, there are two more applications: Editor, and
Notebook. 

Editor is a touch IDE, designed to allow you to [model your problem with
reusable components][8]. Notebook is a medium to quickly sketch out and simulate
ideas, like Mathematica. I'll focus on Editor:

It's an IDE that allows programs to be built out of Om components, through
which data flows via [clojurescript core.async channels][9]. We use something
that looks a lot like Interface Builder to layout our component-based UIs with
declarative constraints (enforced with Cassowary) instead of markup and
stylesheets, and we can see through the interface to the data flowing between
our components.The flow of data is detected using [clojure tools.analyser][10]
and then [visualized for the user][11], enabling them to pipe together
components like unix shell scripts, but in more than one dimension and with
direct manipulation. Even better: these components don't need to have any
knowledge of each others' CPIs.  I say "CPI" and not "API" because these
*component* programming interfaces attempt to solve the ["communicating with
aliens"][12] problem: components send messages to each other to figure out what
*shape* the shared interface they can satisfy is using Prismatic's
[schema][13], and pattern match on those using [core.logic][14] to offer
capabilities to each other.

 It can get better. When we need a component we haven't built yet or isn't
 provided by the system, we look it up in a global repository of components,
 which *also* communicate via discoverable, loosely-coupled CPIs. When we're
 satisfied with our program, we serialize the data structure describing its UI
 to storage, and it's immediately ready to run on our tablet. We've designed and
 implemented it from the ground up with direct manipulation, and its interface
 can scale to different devices because we designed it using constraints
 instead of hardcoding values. We used *touch* to wire together components, to
 directly manipulate flowing data, and saw the results rendered in real-time!
 We solved the code reuse problem by using components designed to dynamically
 discover each others' capabilities and degrade gracefully when data they are
 provided doesn't exactly meet the specified shape.

[1]: https://www.youtube.com/watch?v=DMtwq3QtddY 
[2]: http://youtu.be/DMtwq3QtddY?t=24m17s 
[3]: http://twitter.com/sgrove 
[4]: http://youtu.be/DMtwq3QtddY?t=25m37s 
[5]: http://twitter.com/kovasb 
[6]: http://swannodette.github.io/2013/12/17/the-future-of-javascript-mvcs/ 
[7]: http://www.mozilla.org/en-US/firefox/os/ 
[8]: http://blog.securemacprogramming.com/2013/12/standing-at-the-crossroads/ 
[9]: http://swannodette.github.io/2013/08/17/comparative/ 
[10]: https://github.com/clojure/tools.analyzer 
[11]: http://worrydream.com/MediaForThinkingTheUnthinkable/ 
[12]: http://web.media.mit.edu/~minsky/papers/AlienIntelligence.html 
[13]: http://blog.getprismatic.com/blog/2013/9/4/schema-for-clojurescript-data-shape-declaration-and-validation
[14]: http://swannodette.github.io/2013/03/09/logic-programming-is-underrated/
[15]: http://en.wikipedia.org/wiki/Dynabook
