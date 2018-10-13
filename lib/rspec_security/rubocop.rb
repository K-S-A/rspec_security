# frozen_string_literal: true

require 'rspec_security/concerns/callable'
require 'rspec_security/concerns/runnable'

require 'rubocop'
require 'rspec'

module RSpecSecurity
  class Rubocop
    include Callable
    include Runnable

    private

    def example_group
      @example_group ||= RSpec.describe('Rubocop issues', :supress_stdout).tap do |group|
        @example = group.example('must have zero issues and errors') do
          expect(RuboCop::CLI.new.run([Rails.root.to_s])).to eq(0)
        end
      end
    end
  end
end
