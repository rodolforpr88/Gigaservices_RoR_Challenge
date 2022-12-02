source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "dotenv-rails", "~> 2.8", ">= 2.8.1"
gem "image_processing", "~> 1.2"
gem "ffi", "~> 1.15", ">= 1.15.5"
gem "pry-byebug", "~> 3.10", ">= 3.10.1"
gem "pagy", "~> 5.10", ">= 5.10.1"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.0"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
