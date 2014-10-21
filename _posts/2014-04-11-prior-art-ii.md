---
title: prior art ii
layout: post
---
Remember the system I was daydreaming about in "[dynabook software](http://somethingdoneright.net/post/80773691482/dynabook-software)”? What's the real difference between it and the Lively Kernel? For one, the interfaces between objects in the Lively Kernel are traditional software interfaces (where data flow is concerned). Objects pass messages to each other, but I’d expect that users would have to be programmers to make a Squeak object capable of consuming any kind of meaningful data. In my daydream, by pattern matching on the shape of data received, we get structured data (EDN) that still adheres to a universal interface and enables dynamic pipelines of components, like Unix, without having to resort to unstructured text. 

What else? It would be designed for touch, which I think fosters direct manipulation and spatial representations of data in a way that designing for a mouse cursor can't (I'll have to elucidate my reasoning on this later). It should allow you to visualize data flow through the system and manipulate the connections between components without necessarily editing text.

It's more limited in scope: the Lively Kernel is an entire windowed Squeak image. My system would be designed to implement one application at a time. Note that I said “designed to implement”: you can reify the application you’re working on at any time, and keep a collection of those applications on your machine, but my system is designed to fit into other environments, and doesn’t need to subsume the entire computing experience. It could run as a web app on the iPad, and reify your applications as home screen shortcuts. On Windows 8 or Firefox OS, your apps would be first-class citizens.

Unlike the Lively Kernel, I think it might remain responsive under load because of the way React and Om work.  It’d be built in a language that was designed beautifully, unlike Javascript. 

I think it capitalizes on the zeitgeist in a way the Lively Kernel can’t. I’ll probably have to elucidate the thinking behind that later too. Does that justify starting a new project? I don't know. I have to think broadly about the problem before I can dive into work on any aspect of it.

Q: What problem are you trying to solve, anyway? 

A: Computers don't yet present their interfaces for extensibility in a way that adapts to the natural bent of the human mind.
