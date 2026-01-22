Developer setup

This project uses Ruby and Bundler to build the site with Jekyll.

Requirements
- Ruby 3.3.6 (see `.ruby-version`)
- Bundler (>= 2.4)

Recommended: use a Ruby version manager such as `rbenv`, `rvm` or `asdf`.

Local setup
1. Install Ruby 3.3.6 with your version manager and `cd` into the repo.
2. Install bundler: `gem install bundler -v 2.4.10`
3. Configure bundler to install to `vendor/bundle`: `bundle config set path vendor/bundle`
4. Install dependencies: `bundle install`
5. Build or serve locally: `bundle exec jekyll build` or `bundle exec jekyll serve`

CI
A GitHub Actions workflow is included at `.github/workflows/jekyll-build.yml` that runs `bundle install` and `bundle exec jekyll build` using Ruby 3.3.6.
