source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem 'httparty'
gem 'dotenv-rails', groups: [:development, :test]

gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'activeadmin', '2.11'
gem 'devise'
gem 'bootstrap', '~> 5.1.0'
gem 'faker', '~> 2.18'
gem 'sassc-rails'
gem 'kaminari'
gem 'bootstrap5-kaminari-views'
gem 'stripe', '~> 10.2.0'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end