source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'devise'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'rubocop', '>= 1.0', '< 2.0'

gem 'erb-formatter'
gem 'rexml'
gem 'cancancan'

gem 'childprocess'
gem 'ffi'

gem 'bootstrap', '~> 5.1.3'
gem 'pg', '~> 1.1'
gem 'sprockets-rails'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'
gem 'tzinfo-data'

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
  gem 'letter_opener'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
