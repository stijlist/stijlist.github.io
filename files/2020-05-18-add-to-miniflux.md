---
title: "iOS shortcut: add RSS feed to miniflux"
layout: post
---

_a short sojourn into smartphone "shortcuts"_

I tried an indie RSS reader called [miniflux][miniflux] the other week.
Most things work as you'd expect, and read state syncing between devices can be accomplished via a protocol called [Fever][fever], built by another indie RSS app maintainer (Fever's website is from a more innocent time).

On my iOS device, I use an app called [Reeder][reeder] for RSS, which happens to support Fever (hooray!).
However, the Fever protocol doesn't have support for adding or removing feeds, which means Reeder's add/remove feed functionality is disabled when syncing via Fever.

I hacked around this with an iOS ["Shortcut"][shortcuts] - Apple's end-user scripting system for iOS.

In theory, if this particular Apple vision of end-user computing is still intact at the time that you're reading this, you should be able to see my "Shortcut" at this URL:

https://www.icloud.com/shortcuts/df4e466c5f3f435ea06bd533ca0df45f

The privacy model on Shortcut sharing isn't obvious at first, but I clicked through the app to [Apple's user guide][shortcuts-user-guide], and that [clarified things][shortcuts-user-guide-import-questions]:

> If your shortcut includes steps that contain personal information, such as addresses, contacts, phone numbers, or the name of a playlist, you can add import questions to those specific fields of the shortcut. If an import question is present for a field, your personal information is not shared—that field is cleared when the shortcut is shared. When the recipient runs the shortcut, he or she is presented with the import questions. When the questions are answered, the shortcut is populated with the user’s own information.

The Shortcuts app should&sup1; ask you for your API key (which you can generate at https://miniflux.app/keys) and the default category_id to add the given feed to (I feel like this should be an optional parameter with a default, but you can find your list of categories at https://miniflux.app/categories).

"Add to Miniflux" should show up in the iOS share sheet after long-pressing any URL and pressing the "share" icon, and should&sup2; work correctly if the URL in question is an RSS feed.

My usual gripes about Apple's perspective on end-user computing still apply, but it's satisfying to see "Add to Miniflux" sitting in the system UI - I would never know it was a user extension.

If you find this useful and give it a shot, let me know how it works out - I'm curious what the experience is like (I certainly didn't find it straightforward :)).

<br>
<br>

---

&sup1; If it doesn't do this, there's a "Customize Shortcut" button that pulls up the import questions I added as well.

&sup2; Note that the shortcut won't work if used on a URL that merely _contains_ an RSS feed - this might be a fun exercise for the reader given the existence of the "Get URLs from input" action.

[miniflux]: https://miniflux.app/
[fever]: https://feedafever.com/
[reeder]: https://reederapp.com/
[workflow]: https://workflow.is/
[shortcuts]: https://support.apple.com/en-us/HT208309
[shortcuts-user-guide]: https://support.apple.com/guide/shortcuts/welcome/ios
[shortcuts-user-guide-import-questions]: https://support.apple.com/guide/shortcuts/add-import-questions-before-sharing-apdf330fd3a0/ios
