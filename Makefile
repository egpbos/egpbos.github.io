# Simple helpers for building the site locally using Docker

.PHONY: build serve

# Builds the site using Ruby 3.2.2 in Docker
build:
	docker run --rm -v $(PWD):/srv/jekyll -w /srv/jekyll ruby:3.2-bullseye bash -lc "gem install bundler -v 2.4.10 && bundle config set path vendor/bundle && bundle install --jobs 4 --retry 3 && bundle exec jekyll build"

# Serves the site locally using Docker (port 4000)
serve:
	docker run --rm -p 4000:4000 -v $(PWD):/srv/jekyll -w /srv/jekyll ruby:3.2-bullseye bash -lc "gem install bundler -v 2.4.10 && bundle config set path vendor/bundle && bundle install --jobs 4 --retry 3 && bundle exec jekyll serve --host 0.0.0.0 --port 4000"
