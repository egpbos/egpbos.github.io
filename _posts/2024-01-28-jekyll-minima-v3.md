---
layout: post
title:  "Moving to Jekyll part 4: Minima v3 theme"
date:   2024-01-28
categories:
    - blog
    - tech
tags:
    - jekyll
    - minima
---

After my [previous Jekyll favicon hackery]({% link _posts/2024-01-02-jekyll-favicon.md %}), I found out last week there was a better way.

I was actually looking for a nicer theme (didn't find one), but while doing so I also saw that the theme I'm using currently, Minima, didn't look the same in the official demo as the one I was using.
It turns out that this theme has been developing quite a lot on GitHub, but all that development has not been released officially (unofficially it's referred to as v3), so we cannot use it through the regular channel of installing it as a Gem.

Luckily, it seems there is a way around this.
A "remote theme", activated through the `jekyll-remote-theme` plugin (add it to your plugins list in `_config.yml`), is the solution.
Instead of specifying the `theme` in `_config.yml`, I now have a line saying `remote_theme: jekyll/minima`.
This may look the same, but apparently now it is using the master branch GitHub version.

This theme has a bunch of extra social link icons in the footer, among which Google Scholar and StackOverflow, very nice.

But, of course, the reason I came here was favicons.
Who the hell needs any of that social stuff.
I just want an awesome favicon and I want it with minimum hassle!
And that's exactly what I get, because now instead of having to maintain a full `head` template, now there is a `custom_head` include which is empty and just gets in included in the `head` part of the HTML.
Excellent!
I just add a line there to add my favicon to all the pages and there's no need to keep the rest of the file up to date when the template updates things in the default `head` include.

In the meantime, I also added back to the site some final permalinks to GIFs that I served from my previous site for [my 2019 paper on Barcode](https://academic.oup.com/mnras/article/488/2/2573/5530784) (I guess GIPHY might have been a good place for those; oh well).
However, it turns out that Minima by default adds links to all "miscellaneous" pages (i.e. everything other than blog posts, I guess) in the header, so all of a sudden I had three weird links with acronyms that nobody understands except those 4 others in the particular scientific niche the paper is about.
Luckily, Minima also has a way to shut itself up: we can add a
```yml
header_pages:
  - about.markdown
```
section to `_config.yml` to make the list explicit.

I think this concludes my move to Jekyll!
I'll probably be tweaking things still in the future, but at least all the files I kept after the export are now used somewhere.

Overall, so far, I like the whole Jekyll experience.
Especially writing blogposts in markdown is ideal, although I would like a quick post-generator that autofills dates and title and some other default header stuff, but just copy-pasting the last one works for now.
Publishing changes takes a few minutes, because GitHub Actions needs to regenerate the site on every push.
Let's hope I never post my private keys in a blogpost by accident, I guess.