---
title: tree walking
layout: post
---
So I’ve been working on my basketball tournament bracket program in ClojureScript on and off for a few days and I’ve been struggling with how best to write the code that actually lays out the bracket on the page. More specifically, I feel like the layout code should be able to build up the entire tree of the bracket from just the initial state, and represent unrealized games as parent nodes of the realized child games, and I’m having trouble actually writing layout code that does this. 

For the uninitiated, here’s what a tournament bracket looks like. Imagine four teams, [:a :b :c :d], are matched up in a bracket, and we’d like the first round match-ups to be [:a :b] and [:c :d], with the winners playing each other in a championship game. That bracket would look like this:

    [:a :b]
           [? ?]
    [:c :d]

The question marks represent the fact that the teams playing in  a given game haven't been determined yet. To represent this in a data structure, I wrote some code to generate a tree from a list of competing teams. My tree, as I have it now, is a vector of pairs of vectors, with each vector representing a match-up of two teams. If a pair contains another child vector inside, the participants in that game have not been decided yet, and the child vectors are the match-ups that will decide who participates in that game. So the EDN representation of the bracket we had earlier looks like this: 

    [[:a :b] [:c :d]]

Ideally, the layout code would be able to traverse this tree depth-first, walk all the leaves to lay out the first round, then move up a level and walk all unrealized games in the second round, and so on until it gets to the final pair, which represents the championship game. I thought ClojureScript’s tree-seq would be perfect for this. If you’re not familiar with tree-seq, it’s a function that (in addition to a reference to the root of the tree) takes two functions: a function to distinguish branches from leaves, and a function to return the children of any branch. In my code initially, a branch was any vector where its children were also vectors, and the seq of children is basically calling flatten-once on the branch. 
However, if I called `tree-seq pair? flatten1 mytree` on a tree of match ups like this: 

    [[:a :b] [:c :d]]

I expected a sequence like this: 

    ([[:a :b] [:c :d]] [:a :b] [:c :d])

What I got, however, was a sequence like this: 

    ([[:a :b] [:c :d]] :a :b :c :d)

It should have been three match-ups: one unrealized match-up at the root, and two realized match-ups at the leaves. What was I doing wrong? 

_one day later_
 
Got it. 
I misunderstood flatten-once. When given `[[:a :b] [:c :d]]`, I expected it to return `[:a :b]` and `[:c :d]`, not realizing that the seq of `[:a :b]` and `[:c :d]` is actually `identity` of `[[:a :b] [:c :d]]`. Next iteration of my tree-seq function:

    (defn games-seq [bracket]
      (tree-seq pair? identity bracket))

which yielded: 

    (games-seq [[:a :b] [:c :d]]) 
    ;; => ([[:a :b] [:c :d]] [:a :b] :a :b [:c :d] :c :d)

Close, but tree-seq was walking the leaves of each match-up, which were just individual teams and not actually games. Luckily, there’s a simple solution for this:

    (defn games-seq [bracket]
      (tree-seq pair? (partial filter coll?) bracket))
    (games-seq [[:a :b] [:c :d]])
    ;; => ([[:a :b] [:c :d]] [:a :b] [:c :d])

Success! That feels really good. The solution is expressive, to boot. Now I need to actually use that sequence to lay out the bracket. To be continued! 
