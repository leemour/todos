source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'

# Server
gem 'puma', '~> 3.11'

# DB
gem 'pg', "~> 0.18"

# Assets, JS
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap'
gem 'font-awesome-sass', '~> 4.2'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'momentjs-rails'

# Views
gem 'slim-rails'
gem 'twitter-bootstrap-rails', require: false
gem 'active_link_to'

# UI
gem 'chosen-rails'
gem 'kaminari'

# Auth
gem 'devise'

# API
gem 'fast_jsonapi'
gem 'oj'

# Misc
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
  gem 'jazz_fingers'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rack-livereload'

  group :deploy do
    gem 'capistrano-rails', require: false
    gem 'capistrano-rbenv', require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma', require: false
  end

  # Notifications
  group :darwin do
    gem 'terminal-notifier-guard'
    gem 'rb-fsevent', require: false
    gem 'rb-fchange', require: false
  end
  group :linux do
    gem 'rb-inotify', require: false
    gem 'libnotify', require: false
  end
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'launchy'
end
