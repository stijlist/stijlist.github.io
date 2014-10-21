---
title: dotfiles and navel gazing
layout: post
---
SO I borked my system on Wednesday (damn you, Yosemite installer!) and spent the majority of Thursday and Friday yak-shaving, but by the end, I'd actually ended up doing some valuable work. This blog post is just a set of notes on the process.

## reducing the number of programs I use

I decided to be far more ruthless about the software that I would allow to be a part of my workflow. The list of packages I have installed from Homebrew dropped from 111 to 18 (!), and my vim configuration dropped from 18 plugins to 9 plugins. I also fired myself from the job of manually managing my Vim plugins (with Pathogen) and started using Vundle, which is working smoothly so far. If it stays that way, I won't have to type `git submodule update --init --recursive` again for some time :D
 
## improving my typing habits 

I tend to get pangs of pain in my right pinkie finger, because it's overloaded in terms of typing responsibility: *all* punctuation, enter, backspace, and the arrow keys. I developed some good habits to shift work away from it in the terminal. In particular:

- using ctrl-m as a replacement for enter 
- using ctrl-w (backward-kill-word) instead of backspace
- using the ctrl-n / ctrl-p bindings for next/previous command in the Fish shell instead of typing `!!` (reexecute previous command) and its relatives

After reinstalling OS X, I finally spent some serious time figuring out that some of the habits that had helped me to avoid RSI pains in the terminal could be replicated system-wide. The two keys to this are a lovely program called [Karabiner](https://pqrs.org/osx/karabiner/), written by Takayama Fumihiko, and the Mac's Cocoa Text System (knowledge of which was obtained through [Jacob Rus's lovely overview](https://www.hcs.harvard.edu/~jrus/site/cocoa-text.html)).

The ctrl-m -> enter remapping is available out of the box in Karabiner. It's
filed away under "Emacs mode," but it works like a dream system-wide, even on
the login screen. Also relevant: I remap caps lock to ctrl through OS X's
keyboard preferences, but then use Karabiner to map ctrl with no modifiers
pressed to escape. To my great surprise, the emacs / readline-like keybindings
for up/down/left/right arrow (ctrl-n/p/f/b) worked in all text areas out of the
box, including safari's address bar(!). This meant the only other
keybinding I needed to implement myself was ctrl-w for backward-kill-word,
which was [relatively
trivial](https://github.com/stijlist/dotfiles/blob/master/DefaultKeyBinding.dict).

Using OS X now is a dream. I don't have to fight my muscle memory anywhere,
especially because Safari's address bar and my fish command line now have
identical behavior. The best part is that I only needed to change the system in
two places to achieve it.

## automating my setup and install process

I also wrote a simple script to automate symlinking my dotfiles, and moved my terminal preferences and OS X key bindings into Git. I have a sketch for a script that automates the entire build process now, but I'm going to avoid publishing it
until I've been able to test it a few times, probably this coming weekend. Ideally, such a script would be idempotent, also, which is another property that will take some effort to engineer. Nonetheless, in spite of the frustration of breaking my OS X install, I am extraordinarily happy with my new environment and happy that I got the chance for a fresh start. I don't anticipate having to make any changes for the foreseeable future. 
