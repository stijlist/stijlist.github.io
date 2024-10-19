---
title: complexity hotspots
layout: post
---

_note: this was mostly written in July 2015 and promptly forgotten about. I 
stumbled upon it over the weekend and enjoyed reading it, so I'm publishing
it now._

The worst feeling as a user of a general purpose computer is the sense that
the computer is getting away from you; the sense that you're no longer in
control of what's going on and don't even understand how you might regain it.

I want to be less susceptible to this feeling; I want to be empowered by
the technology I use and never get bogged down by breakage in something I can't
fix. I want to have a sense of mastery over and comfort in the tools that I
have to use to get my job done.

One of the tools I use frequently is Vim (a tremendously complex program, but
we'll get to that later. I still find the relative simplicity of my Vim setup
comforting compared to that of an IDE or more complex editor). In it, the
simplest and most general way to navigate the filesystem is by
"fuzzy-searching" files, often scoped to the directory that Vim was launched
in. This functionality isn't built in to Vim, but it's popular enough that
there are many plugins that purport to provide it. 

The other day, I launched Vim in one of my project directories and typed in
"layout.css" to open the eponymously named file in the root of the project.
Bafflingly, my fuzzy search plugin reported "no results." This wasn't
complicated substring matching spread across word and path boundaries; this
was a failed match of a literal text string. Okay, I'm a programmer, and this
program is misbehaving... let's fix it. I jumped to the source of the plugin,
opened it up to begin debugging, and... wow. I just remembered that a) I don't
know vimscript and b) vimscript is an ancient, often inscrutable language,
full of questionable abbreviations and syntax that seemingly grew by
accretion. To add insult to injury, the plugin is **three thousand lines** of
the stuff... even if I knew the language, could I track down the bug in a
reasonable amount of time?

Thoroughly daunted, I gave up, but this episode stuck with me.

After a few weeks of this frustration gnawing at me, I reset my dev
environment. When something breaks in my computer system, I want the freedom
to fix it as simply and painlessly as possible. I want to be able to read the
source to the tools I use day to day and fix bugs or inconsistencies in their
behavior.  

The more complicated a tool is, the less of a chance I give myself to
comprehend or repair it when it breaks.
What aspects of my toolchain would I be comfortable eliminating or "trading
down" in complexity for simpler tools?

Here's some software I rely on to build programs day-to-day:

- Mac OS X: closed-source, 87 million+ lines of code
- Terminal.app: closed-source, unknown complexity
- Safari: Webkit alone is 1.8 million lines of code
- vim: ~350kloc
- git: ~350kloc
- fish: ~50kloc
- ag: ~4kloc
- v8: ~520kloc
- node: ~28kloc
- scala: ~170kloc

Here's a hypothetical list of ways I could "trade down":

- OpenBSD: 11.5 million lines of code (this is for the whole system except X windows)
- "raw" WebKit: 1.8 million lines of code
- mesa: a million lines of code
- vis: 25kloc (a vim-like editor: "the goal could be summarized as 80% of vim's features implemented in roughly 1% of the code")
- mercurial: 110kloc
- btrfs: 86kloc 
- weston: 30kloc
- cljs: 24kloc (a replacement for scala and ruby, though I can't evade the cost of a javascript runtime)
- dash: 14kloc
- pacman: 20kloc
- grep: 2kloc
- st: 4kloc (a replacement terminal emulator. for comparison, xterm is around 90kloc)

note: some of the older C programs seem to also implement their own malloc and realloc.

Where are the hotspots in this profile?

- The kernel & the web browser are both on the order of 10^7
- the graphics system and programming vm => 10^6
- editing and version controlling files => 10^5
- the filesystem and window compositor => 10^4
- the programming language, shell, and package manager => a smaller 10^4
- fast file search, terminal emulator => 10^3

Here’s the thing: I don’t think editing and version controlling files should be
in that 10^5 tier. What’s a reasonable lower bound for the complexity of these
tasks?

The first self-host of git was written in four days - 853 lines of C, back in
the 10^3 range.  And as far as text editing is concerned, the simplest C text
editor that I know of is [kilo][kilo], antirez's toy editor: 1148 lines of C. Let's
slot these in as lower bounds. What does our profile look like now?

- The kernel and web browser => 10^7
- the graphics system and programming vm => 10^6
- the filesystem, window compositor, shell and programming language => 10^5
- search, terminal emulator, fuzzy selecting, editing, and version controlling text => 10^3

Wait a second, though: how are we ever going to compile all of this C?
Compiler infrastructure is a grim story. Clang and LLVM are the
state-of-the-art compiler and compiler infrastructure, but they're massive;
LLVM is 680000 lines of code and clang is another 600000 on top of that.
There's TinyCC for C which is 61103 lines of code, in that same 10^5 ballpark.
It seems like a reasonable size for an optimizing compiler and assembler, but
doesn't support C++. LLVM would be a requirement for Rust, too.  There's
something called Duktape, which is an embeddable JavaScript interpreter in
50kloc.

In the case of TinyCC and Duktape, their bigger sibling language
implementations are at least an order of magnitude bigger (Clang is 680k,
jsc-v8 are between 250 and 500k). Do optimizations of a language necessitate an
order of magnitude increase in codebase size?

A project that's exploring this is [qbe][qbe] - it aims to provide "70% of the
performance of advanced compilers [ed: think LLVM!] in 10% of the code" -
currently it's 10kloc.  The folks from the suckless project are working on a C
frontend for this called [scc][scc], which is a work in progress, but is
currently 12kloc.

So let's try and split these programs up into categories. Where is most of our
complexity budget spent? Does the distribution make sense to us?

- programmer interface:
  - dash: 14kloc (C)
  - pick: 1kloc (C)
  - ag: 4kloc (C)
  - find: 2kloc (C)
  - git: 1kloc (C)
  - kilo: 2kloc (C)
- programming system:
  - tinycc: 61kloc (C)
  - make: 12kloc
- user interface: 
  - st: 4kloc (C)
  - mesa: 1 million (C)
  - webkit: 2 million (C++)

Giant chunks of this are related to performant implementations of javascript
and the web. It's sobering to realize that part of the legacy of the web
could be this giant complexity burden from html, css, and javascript.

Anyway, moving on to the graphics stack:

There are two bigger monsters underlying the graphics stack: the drivers for
a particular graphics architecture (Intel's, for the sake of the conversation,
as it's fully open source), and Mesa, the linux graphics API.

The Intel graphics codebase contains support for many different wholly separate
codepaths for each graphics card. It would be interesting to try and see the
graph of dependencies within the driver to find out how big the codepath 
actually used by any one particular driver is; I have a hunch that this would
drop the codebase to a surmountable size that I could actually comprehend.

I have a hunch that a similar trick could be played with the Mesa codebase, but
haven't done the investigative work required to verify.

Maybe we're getting into tenable territory? Sans graphics and the web, we're at
a somewhat manageable 100,000 lines of code, not counting tests or docs for
those codebases that have them (eek). Graphics has seen many interesting
experiments (check out [nile][nile], from Alan Kay's lab, [tinygl][tinygl], and
the [tinyrenderer course][tinyrenderer]), and [Servo][servo], Mozilla's
research browser project, is the first fresh implementation of the Web platform
in 20 years (both Webkit and Blink came from khtml, which was forked from the
even earlier khtmlw in 1998), and is an order of magnitude smaller than Webkit
so far.

I see a lot of promise here. There's stranger complications (how are we going to
comprehend the web?) but perhaps this is a good place to stop and think.

_Thanks to Julia, Panashe, and Dan for their feedback on this post._

[qbe]: http://c9x.me/compile/
[scc]: http://git.suckless.org/scc/
[kilo]: https://github.com/antirez/kilo
[nile]: https://github.com/damelang/nile
[tinygl]: http://bellard.org/TinyGL/
[tinyrenderer]: https://github.com/ssloy/tinyrenderer/wiki
[servo]: https://github.com/servo/servo

