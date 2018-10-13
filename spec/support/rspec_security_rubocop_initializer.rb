# frozen_string_literal: true

require 'rspec_security/rubocop'

RSpec.configure do |config|
  config.after(:suite) do
    RSpecSecurity::Rubocop.new.call
  end
end
