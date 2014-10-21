---
layout: post
---
I'm working on designing a simple [ClojureScript basketball tournament bracket](github.com/stijlist/threev)
as my first project in Om. One of the interesting questions I've come across is
where it's best to define my CSS. When I'm calculating layout attributes in
code, should I add a new global CSS rule to the document, or should I define my
styles inline like the [Om
tutorial](https://github.com/swannodette/om/wiki/Basic-Tutorial) demonstrates? 

Global pros:

- decoupled from specific HTML elements
- one place for all layout code, all elements benefit

Global cons: 

- API to get/manipulate CSS rules is a little ugly (uses text strings, requires access to document's stylesheet object
    
    (goog.cssom/addCssRule stylesheet 
                          (str ".round {"
                                 "height:" height "px;"
                                 "width:" col-width "px;"
                                 "float:" "left;" 
                               "}")`

- decoupling from DOM might allow DOM classnames and CSS rules to fall "out of 
  sync" in code

Inline pros:

- obvious connections between DOM elements and CSS rules applied to them
- consistent with idioms of the Om tutorial
- CSS rules written as attributes in a javascript hashmap, not CSS text

Inline cons:

- generating dom element structure while computing layout properties adds complexity to layout code


I'm leaning towards doing it inline to start and switching to global if I find that I'm having trouble reasoning about or refactoring the code as it grows. 
I'm also going to read some more Om code; I skimmed through the [Session](http://github.com/kovasb/session) source the other day but I can go through it again looking for where and how CSS rules were declared, and whether I like the approach.