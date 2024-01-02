---
layout: post
title:  "Moving to Jekyll part 3: favicons? And some local hiccups"
date:   "2024-01-02T22:30+01:00"
categories:
    - blog
    - tech
tags:
    - jekyll
---

My Jekyll site is online, as you, my dear reader, can see. The publishing process has been quite flawless and smooth, very nice.

There were some slight hiccups in between the [previous Jekyll post]({% link _posts/2023-12-31-importing_wordpress.md %}) and this one.
For some reason (I don't think I did anything stupid... perhaps it was due to switching out the Jekyll Gem dependency in the Gemfile with the GitHub Pages Gem, as instructed by GitHub... not sure), things broke a bit, and `jekyll serve` wouldn't run anymore.
I found out that there is a `jekyll doctor` command that's supposed to help out when things break, but apparently this was not such a case, because the good doctor sent me home with some aspirine and told me to come back in three months if my head still ached.
I also did do a stupid thing btw, which was to try fixing things in a terminal that still had Ruby 3.3 loaded from before I downgraded to 3.2 (see [previous post]({% link _posts/2023-12-26-bootstrap.md %}), so the error messages were allround confusing.

In the end (in a fresh, proper terminal), an apt error message told me that `<internal:/Users/patrick/.rubies/ruby-3.2.2/lib/ruby/3.2.0/rubygems/core_ext/kernel_require.rb>:37:in ``require': cannot load such file -- webrick (LoadError)`.
The fix, then, was to explicitly add webrick using `bundle add webrick`. Done! My `jekyll serve`ing needs could again be fulfilled.

From whence did such needs stem? Foresooth, from getting me a fancy favicon! The default one is unacceptable to a man of my fine tastes, and I'm sure to yours as well, dearest scholar of my humble works.

Unfortunately, I cannot seem to get it in by simply overriding the `head` include with a appropriate `link` tag, as [suggested here](https://medium.com/@xiang_zhou/how-to-add-a-favicon-to-your-jekyll-site-2ac2179cc2ed) and suggested by common sense as well. Perhaps, though, the issue is simply with `jekyll serve` and putting it on GitHub will fix things through the use of a proper HTTP server? Let's try it out, together with this post...

*Edit 5 minutes later:* nope, something else must be wrong, because as you can see, the favicon is still not being picked up... at least on the home page... But wait! It is in fact there on this very post! Did I add it to the wrong include? Is `head` not included in all pages? Nope, it does seem to be everywhere... Then what? The other older posts also don't have it, only this favicon page...

Ok, well, at least something is working. Just gotta find the gremlins later.

*Edit another 5 minutes later:* ah, it just seems to be a browser cache issue. Favicon up and running!