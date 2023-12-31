---
id: 190
title: 'Dropbox syncing between OS X and Linux'
date: '2014-11-07T16:06:47+01:00'
author: Patrick
layout: post
guid: 'http://egpbos.nl/?p=190'
permalink: /computing/dropbox-syncing-between-os-x-and-linux/
categories:
    - Computing
tags:
    - Dropbox
    - 'extended attributes'
    - linux
    - 'OS X'
---

Troubles arise when dealing with this situation. Too often now, at some point I noticed that a file had gone missing on my Linux system. In blind panic I would check my Mac and find that luckily the file was safely where I left it. Also, the file would appear just fine on the Dropbox website. What’s up?

In my case, this seems to be caused by not having extended attributes support on my Linux system. In general, this could be caused by either simply not having enabled it at mount time (there’s a flag for that) or by using NFS which does not support them at all. In my case, it was both and since I’m not root I can’t change either.

If, like me, you’re stuck with such a system and still want to use Dropbox to synchronize from your OS X (which at any moment could strike upon your files with some metadata voodoo) you will need to manually tear out the metadata. The following steps will remedy your syncing issues, at the cost of losing OS X’s precious metadata. Use your Terminal to give the commands (where `file` is Schrödinger’s file in question):

```
<pre class="brush: plain; light: true; title: ; notranslate" title="">
mv file file_tmp
xattr -c file_tmp
mv file_tmp file
```

The `xattr -c` command removes all extended attributes. The moving might seem useless at first. However, without it, you might find (like I did) that the file still doesn’t sync, despite it having no more metadata. Even when you edit the file itself (e.g. if it’s a text file, add some text) Dropbox doesn’t sync the file to Linux anymore. Perhaps once a file’s “tainted”, Dropbox flags it as forever unusable for unsuitable file systems.

In any case, a little moving around makes Dropbox forget all about it’s past transgressions and starts syncing it just fine again. That is, until OS X does its black magic again and you can start all over. Perhaps scripting the above would be a good idea, but we leave that as an exercise to the reader.