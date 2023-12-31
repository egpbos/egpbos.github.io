---
layout: post
title:  "Moving to Jekyll part 2: importing Wordpress content and going live"
date:   2023-12-31
categories: blog tech
---

After getting Jekyll going (see [previous post]({% link _posts/2023-12-26-bootstrap.md %}), next step is getting everything out of my previous website in here. That was a Wordpress site with some static pages and a couple of blog posts.

First question is of course whether we can automate this... The amount of content is so low that SURELY this will not pay off. Such is programmer life.

One annoying part of this is that my previous site was bilingual: it had both Dutch and English version pages. I'd still like that, but I think it's also causing me to write less often than I'd like, so perhaps I should not make this a top priority for now.

A quick Google shows that indeed there's a convenient [Jekyll exporter](https://wordpress.org/plugins/jekyll-exporter/) plugin. Let's go!

Logging in to my Wordpress admin page, showing me that again there's a Wordpress update, I'm again strengthened in my resolve for this move. Why complicate a simple website with junk like a database and regular security updates? Who needs security anyway?! I just want to put a few simple pages online... Static files ftw!

Anyway, back to the exporter. It works as advertised (at least on my poorly maintained Wordpress v6.1.1 site) and outputs everything: both Dutch and English page variants, but also some uploaded files and figures I put on the site over the years. Blog posts are already put in a `_posts` folder and have the proper internal structure for Jekyll to immediately use it in my site's `_posts` folder. Neat!

Since I only had a few posts and pages, I manually checked all the files to make sure there's no nasty stuff in there, and it all seems pretty straightforward. Nice feature: permalinks from the previous website are also kept; they are put into the markdown header. That's really excellent.

Trying to then step by step adding in the files, starting with

```zsh
cp ~/Downloads/jekyll-export/_posts/2012-08-28-hoe-wordt-de-rente-op-studieschuld-bepaald.md egpbos.nl/_posts
```

The link Jekyll generates indeed is domain + permalink, very nice! The image I had in this post is still missing. We get that back in using

```zsh
cp -r ~/Downloads/jekyll-export/wp-content egpbos.nl/
```

Unfortunately, this doesn't fix everything completely. The URL to the image itself is not converted correctly, even though link URLs are. Fixing those manually (just `grep -r '!\['` to find all images in the Jekyll export directory) involves just taking off the hardcoded domain names.

Also, since I am a dinosaur, my blogposts used `<tt>` occasionally instead of backticks, so replaced those here and there.

To keep things clean, you might want to remove empty directories, which the `wp-content` directory contains a lot of: `find wp-content -type d -empty -delete`. Also the weird `wp-content/uploads/wpcode` directory can be removed. And Wordpress generated a lot of thumbnail versions of images that I won't be needing anymore either: `find wp-content -type f -name '*x*' -delete`.

The default Jekyll site only gives you a blog frontpage that shows a list of posts. I want to add some content as well, as I had on my previous website. This is as easy as adding content to `index.markdown`. For now, I'm just dumping both my English and Dutch texts and my portrait there. Can always polish later.

The last remaining pieces of content from my previous website are my CV and publications pages; sort of my portfolio. I'm just going to dump all that stuff in the about page that also conveniently was added in the default Jekyll site. I can't seem to get the thumbnail image widths adjusted, so it'll be messy.

---

Having imported everything, the final steps to get the site online are described well in the [GitHub documentation](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll). Done, here we are!