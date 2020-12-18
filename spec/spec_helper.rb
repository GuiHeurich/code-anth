# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require 'database_cleaner/active_record'
require_relative '../config/environment'

Hanami.boot
Hanami::Utils.require!("#{__dir__}/support")

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'guilhermeorlandiniheurich',
  password: 'secret',
  database: 'code_anth_test'
)

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
