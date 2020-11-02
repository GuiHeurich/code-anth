source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem "pry", "~> 0.13.1"
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem "database_cleaner-sequel", "~> 1.8"
end

group :production do
  # gem 'puma'
end
ruby '2.6.4'

gem "bcrypt", "~> 3.1"
