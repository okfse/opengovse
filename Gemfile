source "https://rubygems.org"

# CI pins Ruby 3.3.4 in GitHub Actions; Ruby 4.x works for local dev (e.g. Ubuntu 26.04).
ruby ">= 3.3.0"

gem "jekyll", "~> 4.4"
gem "webrick", "~> 1.8"

group :jekyll_plugins do
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-feed"
  gem "jekyll-redirect-from"
end

group :development, :test do
  gem "html-proofer"
end