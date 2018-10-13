# frozen_string_literal: true

require 'rspec_security/bundler_audit'

RSpec.configure do |config|
  config.after(:suite) do
    RSpecSecurity::BundlerAudit.new.call
  end
end
