# frozen_string_literal: true

module RSpecSecurity
  module Callable
    def call
      run_and_report_example
      mark_contexts_as_finished
    end
  end
end
