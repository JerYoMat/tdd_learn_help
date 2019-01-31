source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'


gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

#----secure password----S
gem 'bcrypt', '~> 3.1.7'
#----secure password----E

#----Testing and Test Data ----S
gem 'faker'
gem 'pry'
#----Testing and Test Data ----E

#----OAuth----S 
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'dotenv-rails'
#----OAuth----E


#----OAUTH Button STYLING----S
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'
#----OAUTH Button STYLING----E


group :development do
  #----Moved----S
  gem 'sqlite3'
  #----Moved----E
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
#----Heroku uses PG for DB----
  gem 'pg', '0.18.4'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
