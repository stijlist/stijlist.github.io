

My most used vim trick is pretty simple.

    nnoremap <leader>r q:?^!<CR><CR> 

The core feedback loop of the unix programming environment always* involves running an external command.
_Which_ command varies greatly depending on the type of activity - are you running your code?
Your tests?
Your linter?
A program written to debug something tricky?
A self-contained example to ask a question?
Composing a shell pipeline?

This maps leader-r to:

    q:   " open the Ex commmand window
    ?^!  " reverse incremental search for the last command that started with "!"
    <CR> " hit Enter to select that line and exit incremental search mode
    <CR> " hit Enter to run that command again

This means that no matter what you're doing, you can "focus" your feedback loop to a different command quickly:

    :!go test

And then hit leader-r to rerun it.

If the feedback loop you want changes:

    :!go test -race

leader-r runs that command now instead.

If it changes again:

    :!go test -race -run "TestRacyFunc"

leader-r still does the right thing.

It might be worth updating this post at some point with GIFs so it's clear how fast and universal this is.
This was inspired a few years ago by watching Gary Bernhardt remap commands at the beginning of each programming session as what he was working on changed.
