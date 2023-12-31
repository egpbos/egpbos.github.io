---
id: 178
title: 'Condor job with ncurses: add terminal variable'
date: '2014-11-07T10:35:17+01:00'
author: Patrick
layout: post
guid: 'http://egpbos.nl/?p=178'
permalink: /computing/condor-job-with-ncurses-add-terminal-variable/
categories:
    - Computing
tags:
    - c++
    - condor
    - linux
    - ncurses
    - terminal
---

Running a Condor (7.5.5) job for my c++ program which makes use of the ncurses library, I got an error:

```
Error opening terminal: unknown.
```

I found a [related question on Stack Overflow](http://stackoverflow.com/questions/16234620/error-opening-terminal-unknown-when-trying-to-run-a-program-inside-eclipse). Adding a <tt>TERM</tt> environment variable turned out to be the solution. To do this in Condor, add a line like this to your Condor script:

```
environment    = "TERM=xterm"
```

If you want to add more variables, just use a space to separate them inside the quotation marks.