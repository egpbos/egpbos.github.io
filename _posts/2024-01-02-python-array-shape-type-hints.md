---
layout: post
title:  "Fixing machine learning in Python: type hints for array shapes"
date:   "2024-01-02T22:09+01:00"
categories:
    - tech
tags:
    - machine learning
    - python
---

While working on machine learning projects (right now I'm working with [Chris](https://github.com/cwmeijer) on [explainable embeddings](https://research-software-directory.org/software/explainable-embeddings), before I worked on ["Spoken Language"](https://research-software-directory.org/projects/understanding-visually-grounded-spoken-language-via-multi-tasking) and [DIANNA](https://research-software-directory.org/projects/dianna)), there is one major pain in the ass that I'm quite sure costs millions of hours of debugging time daily worldwide: *array shapes*.

It makes sense, because people try to build software generically. Nobody wants an image recognition tool that only works on images of 224 by 224 pixels. But, GODDAMNIT, if you do build a tool like that, I want it to fail IMMEDIATELY when I shove my mongrel of an array into its input face. *Please, for the love of all that is holy*, fail early, so that I know that I am an idiot, do not let me dive into your tool's (and, usually, your dependencies') code to figure this out all on my own over a full hour or two. It should be banned under some kind of international convention.

Now, of course, if only things were so simple. Usually, tools don't hardcode shapes. What could happen instead, for instance, is that generic tools (without fixed shape constraints) basically get configured by one piece of input (the first, a reference item, whatever) and then that determines the kind of input you can feed the code from then on. To get type checking to work on such a code, you would probably have to use some kind of functional programming language or framework. The usual suspects in Python ML world are not that. They do their magic inside their bowels, as befits proper object oriented code. Worry not about my bowel-work, mortal, it doth not concern thine puny brains.

Nevertheless, after having sketched the urgency of the matter (at least to my puny brain), let's say there are cases where it is possible to specify at the interface side of some function the desired shape. There are then several ways to do so:

1. One could write it in a docstring, but this can become quite tedious when another function in turn needs to copy this information in their docstring and so on. Someone at some point will neglect to include it and gone is your info.
2. One could simply check the input data's shape dynamically inside the function. In performance critical applications, this is definitely out of the question; a check at every call would be too costly if the call is done a million times in a row. Also, an explicit check in code is kinda ugly and detracts from the actual business code.
3. One could use a language that does have built-in static type checks, hahaha no just kidding.
4. One could try to use type hints...

But do type hints allow for shape definition?

This is the question we asked ourselves in our final project session of the year. Since I'm now on holiday, and apparently I'm a workaholic, I went ahead and started looking into whether there's already something out there on this front.

Of course, the first go-to stop is to check out [what Numpy, the grandparent (a fit kind of grandparent, the kind that just keeps on living actively into their 90s, blatantly defying the laws of aging that ravage normal people, possibly some kind of alien?) of Python arrays, has to offer](https://numpy.org/devdocs/reference/typing.html).
Unfortunately, that turns out to be too little for shape typing purposes. Numpy can only say "this is an array of type `x`", but nothing about shape or even number of dimensions. (It also has an `ArrayLike` type, which is nice, but totally irrelevant here.)

Despite this first slight but not unexpected disappointment, the Numpy page did offer one useful hint: they are waiting for everyone to have moved to Python 3.11 (I guess?), because that contains [PEP 646: Variadic Generics](https://peps.python.org/pep-0646/).

This PEP is literally made for the exact usecase we're talking about here!

However, it only provides the **very** basic constructs necessary for making this dream a reality. With this, someone could define a type of array with explicitly named dimensions and even with explicitly sized dimensions, i.e. a fully specified shape. But did someone do this already? And if not, what would it take? Probably defining the type alone is not enough for `mypy` to be able to check for its usage? For editors to parse it and provide useful hints while editing? Or is it? This is new territory for me.

I'll be looking into this some more, because it's sure as hell promising! The pain that a type like this could prevent... Autocompletion and helpful hints inside my editor powered by this, oh man, I can't wait.