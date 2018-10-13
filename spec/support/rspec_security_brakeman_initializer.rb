# frozen_string_literal: true

require 'rspec_security/brakeman'

RSpec.configure do |config|
  config.after(:suite) do
    RSpecSecurity::Brakeman.new.call
  end
end
