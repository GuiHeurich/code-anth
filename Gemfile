source 'https://rubygems.org'

ruby '2.6.4'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'irb'
gem 'nokogiri', '~> 1.11.1'
gem 'pg'
gem "pry", "~> 0.13.1"

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'database_cleaner-active_record'
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'activesupport'
  gem 'puma'
end
