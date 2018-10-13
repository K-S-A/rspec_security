# frozen_string_literal: true

require 'rspec_security/concerns/callable'
require 'rspec_security/concerns/runnable'

require 'tasks/bundler/quiet_audit'
require 'rspec'

module RSpecSecurity
  class BundlerAudit
    include Callable
    include Runnable

    private

    def example_group
      @example_group ||= RSpec.describe('Bundler audit', :supress_stdout).tap do |group|
        @example = group.example('must have zero security issues and errors') do
          Bundler::Audit::QuietAudit.new
          expect { Rake::Task['bundle:quiet_audit'].invoke }.to_not raise_error
        end
      end
    end
  end
end
