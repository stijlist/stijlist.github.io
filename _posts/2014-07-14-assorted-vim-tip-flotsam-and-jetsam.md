---
layout: post
---
How does one get started with Vim? 

I've been asked this three separate times so far this Hacker School batch, so for anyone
who's interested, here is a simple Vim configuration that seems to encompass
the features I expect from any modern editor.

I'm assuming that you've already finished Vimtutor or are comfortable with Vim's
basic editing commands.

1. pathogen: manage your plugins with Git
2. vimrc: basic setup

        " disable compatibility with vi
        set nocompatible
        " enable filetype-specific plugins
        filetype plugin indent on
        " enable syntax highlighting
        syntax enable
        " enable line numbers
        set number
        " 4 space sized tabs
        set tabstop=4 shiftwidth=4 
        " expand tabs into spaces
        set expandtab
        " backspace through everything
        set backspace=indent,eol,start
        " sane indentation behavior 
        set autoindent
        set copyindent
        set smartindent

3. vim-airline: a simple statusbar that doesn't need much configuration
4. gundo: an incredible plugin that enables you to navigate vim's undo tree
5. ctrlp: a fast fuzzy file finder
6. syntastic: a syntax checker that works well for almost any language
7. fugitive: power tools for git
8. youcompleteme: intellisense-quality semantic autocompletion for c, c++, c#,
obj-c, and python that falls back to vim's native autocomplete
9. vim-surround: make pairwise things like "" and [] editable
together
10. vim-repeat: enable the . command for vim-surround

My favorite thing about all of these tools: it's not hard to remember to use
them! You do have to remember to call :Gundo when you have branching undos and
you want to get one back, there is some habit-building required to using git
from inside vim instead of on the command line, and you need to develop the
habit of hitting ctrl-p instead of typing `vim ~/path/i/want/to/edit` every
time you open a file, but... what I'm trying to say is that these things make
their use cases obvious. They do one job, they're orthogonal to each other,
and they work well together. These are all hallmarks of vim itself, and
that's why I feel these extensions fit so wonderfully with it.


## Using Vim daily:

Vim for me is not so much about maximizing speed as it is reducing the delay
between thinking and typing. Here are some habits I've built up over two years 
of Vim use:

1. Remap caps lock to be both escape and ctrl ["A Modern Space Cadet," by Steve Losh](http://stevelosh.com/blog/2012/10/a-modern-space-cadet/)
2. Use ctrl-m instead of hitting the enter key
3. Avoid hitting backspace in insert mode; instead, hit ctrl-w to delete
   backwards over whole words and retype them. ["Effective Emacs," by Steve
   Yegge](https://sites.google.com/site/steveyegge2/effective-emacs)
4. Avoid repetitively hitting j and k; instead, use search to get to where you
   need to go. ["Hard Mode," by Pat
   Brisbin](http://pbrisbin.com/posts/hard_mode/)
5. Understand Ex mode and when to use it. ["Hard Mode," by Pat
   Brisbin](http://pbrisbin.com/posts/hard_mode/)
5. Use commands that compose well with the dot command. For examples, see ["Practical Vim," by
   Drew Neil](http://pragprog.com/book/dnvim/practical-vim)
