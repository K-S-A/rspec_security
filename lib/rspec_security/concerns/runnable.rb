# frozen_string_literal: true

module RSpecSecurity
  module Runnable
    private

    attr_reader :example

    def run_and_report_example
      RSpec.configuration.reporter.example_group_started(example_group)
      RSpec.configuration.reporter.example_started(example)

      example_group.run
      report_result
    end

    def report_result
      if example.execution_result.status == :passed
        RSpec.configuration.reporter.example_passed(example)
      else
        RSpec.configuration.reporter.example_failed(example)
      end
    end

    def mark_contexts_as_finished
      RSpec.configuration.reporter.example_group_finished example_group
    end
  end
end
