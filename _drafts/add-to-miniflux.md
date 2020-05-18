---
title: iOS shortcut: "add RSS feed to miniflux"
layout: post
---

_a short sojourn into smartphone "shortcuts"_

I tried an indie RSS reader called [miniflux][miniflux] the other week.
Most things work as you'd expect, and read state syncing between devices can be accomplished via a protocol called [Fever][fever], built by another indie RSS app maintainer (the website is from a more innocent time).

On my iOS device, I use an app called [Reeder][reeder] for RSS, which happens to support Fever (hooray!).
However, the Fever protocol doesn't have support for adding or removing feeds, which means Reeder's add/remove feed functionality is disabled when syncing via Fever.

I hacked around this with an iOS "Shortcut" - in short, Apple bought an app called [Workflow][workflow] and incorporated it into iOS as [Shortcuts][shortcuts].

In theory, if this particular Apple vision of end-user computing is still intact at the time that you're reading this, you should be able to see my "Shortcut" at this URL:

https://www.icloud.com/shortcuts/df4e466c5f3f435ea06bd533ca0df45f

It should ask you for your API key (which you can generate at https://miniflux.app/keys) and the default category_id to add the given feed to (I feel like this should be an optional parameter with a default, but you can find your list of categories at https://miniflux.app/categories), and in theory you should be able to then use it from the iOS share sheet after toggling "show in share sheet."

If you find this useful and give it a shot, let me know how it works out - I'm curious what the experience is like (I certainly didn't find it straightforward :)).

[miniflux]: https://miniflux.app/
[reeder]: https://reederapp.com/
[workflow]: https://workflow.is/
[shortcuts]: https://support.apple.com/en-us/HT208309
