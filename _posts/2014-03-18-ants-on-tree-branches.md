---
layout: post
---
Bret Victor, in his [links for 2013][1], uses the metaphor of ants on a tree
branch to talk about how we as an industry
might be moving forward in the little picture, but be moving towards a dead end
in the big picture. He's implying that at times, the question "how can I do a
better job today?" and the question "how can we make a better tomorrow?" are at
odds. I've noticed that my programming projects and ideas for future projects
are also subject to this dichotomy. 

I think about the effects of software from a utilitarian perspective, where
ubiquity and potential audience are both a multiplier of overall usefulness.
My current list of projects has beeen migrating rather quickly to be less
command-line and web oriented and more iOS oriented, because I've become very
aware of the fact that more people can benefit from my work if it's packaged on
iOS than if it's built for the command line or even as a modern webapp. iOS is
the place that I can help the most people, today.

However, I don't believe that iOS and the App Store are a branch we ants can
continue down for the long haul, at least as they're currently constituted.
I think the [Dynabook][2] or something like it is most optimistic future I can
imagine, because I believe humans need the ability to extend their devices to
work for them. Even though some like [Greg Pierce][3],
[Federico
Viticci][4],
and [Ole Zorn][5], have done great work with
URL schemes and iOS workflow automation, Apple has not yet shown that they are ready to open the iPad as
a platform to Dynabook-style extensibility. [Graham Lee][6] put it beautifully in [Standing At the Crossroads][7]: 

> There are many visions that have combined to produce the iPad, but
> interestingly the one that I think is clearest is John Scully’s Knowledge
> Navigator. In the concept videos for Knowledge Navigator, a tablet computer
> with natural language speech comprehension and a multi-touch screen is able
> to use the many hyperlinked documents available on the Web to answer a wide
> range of questions, make information available to its users and even help
> them to plan their schedules.

> This is what we have now. This is the iPad, with Siri and a host of third-party
> applications. Apple even used to use the slogan “there’s an app for that”. Do
> you have a problem? You can probably solve it with iOS and a trip to the app
> store.
> 
> OK, what do you do if your problem isn’t solved on the app store, or the
> available solutions aren’t satisfactory?
> 
> Well first, you’d better get yourself another computer because while the iPad
> is generally designed for solving problems it isn’t designed for solving
> general problems. You might be able to find some code editors on the iPad, but
> you sure aren’t going to use them to write an iPad app without external
> assistance.
> 
> OK, so you’ve got your computer, and you’ve learned how to do the stuff that
> makes iPad apps. Now you just pay a recurring fee to be allowed to put that
> stuff onto your iPad. And what if you want to share that with your friends?
> Only if it meets Apple’s approval.
> 
> If the iPad is the Knowledge Navigator, it is not the Dynabook. A Dynabook is
> a computer that you can use to solve your problems on, but it’s also one on
> which you can create solutions to your own problems.

The Dynabook is an incredible dream, and I think we may not be too far off.
It could be an extension and refinement of the web platform, implemented in
a [safety-minded language][8], an iOS webapp-styled installation process ("just
cache this page on my device, please"), a universal standard for cloud storage,
whether user-provided *or* centralized ([Michael Dejong's remoteStorage
implementation][9], perhaps?), the reasonable expectation of privacy messaging
providers, and an [Om][10] -like UI toolkit paradigm. Something like Firefox OS
running [Servo][11] as the layout engine, on open silicon and an open radio
stack. I recognize that I need to simultaneously be contributing to this future
branch, and I think a simple way to do that well, for now, is to contribute to
Servo, remoteStorage, Om, and related projects. Working on both in parallel
might be difficult, but it's the least I can do to further progress toward
a better tomorrow while using well the leverage afforded to me today.


[1]: worrydream.com/Links2013
[2]: http://en.wikipedia.org/wiki/Dynabook
[3]: http://x-callback-url.com
[4]: http://www.macstories.net/stories/automating-ios-how-pythonista-changed-my-workflow/
[5]: http://omz-software.com/editorial/
[6]: twitter.com/secboffin
[7]: http://blog.securemacprogramming.com/2013/12/standing-at-the-crossroads/
[8]: rust-lang.org
[9]: https://michielbdejong.com/blog/8.html
[10]: http://swannodette.github.io/2013/12/17/the-future-of-javascript-mvcs/
[11]: github.com/mozilla/servo
