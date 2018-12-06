require_relative 'rails_helper'
require 'capybara/poltergeist'

Dir[Rails.root.join("spec/support/features/*.rb")].each { |f| require f }

I18n.default_locale = :en

RSpec.configure do |config|

  Capybara.javascript_driver = :poltergeist

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      timeout: 90, js_errors: true,
      phantomjs_logger: Logger.new(STDOUT),
      phantomjs_options: ['--ssl-protocol=TLSv1.2'],
      window_size: [1020, 740]
    )
  end

  Capybara.configure do |config|
    config.always_include_port = true
  end

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
