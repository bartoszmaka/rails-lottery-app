source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_interaction', '~> 3.5'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'decent_decoration', '~> 0.1.0'
gem 'decent_exposure', '3.0.0'
gem 'devise'
gem 'draper', '3.0.0.pre1'
gem 'factory_girl'
gem 'factory_girl_rails'
gem 'ffaker'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'pg', '~> 0.18'
gem 'pry'
gem 'pry-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'rolify'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener_web'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
