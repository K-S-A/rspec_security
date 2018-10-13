# frozen_string_literal: true

require 'rspec_security/concerns/callable'
require 'rspec_security/concerns/runnable'

require 'brakeman'
require 'rspec'

module RSpecSecurity
  class Brakeman
    include Callable
    include Runnable

    private

    def example_group
      @example_group ||= RSpec.describe('Brakeman issues').tap do |group|
        @example = group.example('must have zero security issues and errors', :aggregate_failures, :supress_stdout) do
          result = ::Brakeman.run(app_path: Gem::Specification.find_by_name('rspec_security').gem_dir, output_files: ['brakeman.html'])
          errors = result.errors.count
          warnings = result.warnings.count

          expect(errors).to(eq(0), "expected zero errors, got #{errors}")
          expect(warnings).to(eq(0), "expected zero warnings, got #{warnings}")
        end
      end
    end
  end
end
