---
layout: post
title:  "Moving to Jekyll"
date:   2023-12-27 13:45:25 +0100
categories: blog tech
---

Using Jekyll for this website was a chore. At least, installing it was. At least, installing Ruby was. Python package management haters: eat your heart out.

In all honesty, perhaps it was my own fault? Not really sure...

In the end, what fixed my issues (thanks to a hint here: https://www.moncefbelyamani.com/the-definitive-guide-to-installing-ruby-gems-on-a-mac/#keep-using-the-system-ruby-by-changing-the-installation-path-not-recommended) was to remove the .gemrc file that contained --user-install as a default option. This broke my stuff subtly, because it doesn't play nice with ruby-install? Or at least not the way https://jekyllrb.com/docs/installation/macos/ suggests you use it? I think the point is that --user-install tries to install to .gem, but actually ruby-install expects things under .rubies/[your ruby version]/gems or something like that, so that doth not jive.

No matter how I try, installing Jekyll that way using gem doesn't give me a runnable executable. If I follow the instructions blindly, I simply get a command not found. If I pay a bit more attention to the warning the gem installation process gives me ("WARNING:  You don't have /Users/patrick/.gem/ruby/3.2.0/bin in your PATH,
	  gem executables will not run.") and add that to my PATH (even though I'm actually using Ruby 3.2.2... suspicious) then I get an even more obscure error:

```
/Users/patrick/.rubies/ruby-3.2.2/lib/ruby/site_ruby/3.2.0/rubygems.rb:259:in `find_spec_for_exe': can't find gem jekyll (>= 0.a) with executable jekyll (Gem::GemNotFoundException)
	from /Users/patrick/.rubies/ruby-3.2.2/lib/ruby/site_ruby/3.2.0/rubygems.rb:278:in `activate_bin_path'
	from /Users/patrick/.gem/ruby/3.2.0/bin/jekyll:25:in `<main>'
```

Bizarre. Of course, the mismatch there in versions is a big red flag, but what is a complete Ruby noob to do?

After finding the aforementioned link, I ended up deleting .gemrc, the entire .gem and .rubies folders (.rubies is where ruby-install installs ruby (btw, why the hell does it have to completely compile the things?! conda ftw)). Then reinstalled ruby with ruby-install... update the chruby command in .zshrc (because the version changed from the previous time), and then redo the jekyll install.

There's no need for "user-install" this way, because ruby-install is already in your home dir, so a "system-install" is also a user install.

Now stuff worked, finally!

... that is, I could run Jekyll to create a, but serving the site didn't. Neither the command Jekyll itself suggests (`bundle exec jekyll serve`) nor the command suggested [here](https://github.com/jekyll/jekyll/issues/9451) (`jekyll serve -l`, also without `-l`) worked.

Let's try `ruby-install 3.2` then? 3.3 was only 2 days old at this point, a day after Christmas, so perhaps some bugs still had to be ironed out.

Another day later due to lack of patience to wait for the compilation to finish...

... it works! Had to regenerate the site with `jekyll new egpbos.nl`, because it complained about missing dependencies when I wouldn't, but then it all works and `jekyll serve -l` serves the fresh site on localhost:4000.
