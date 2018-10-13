# frozen_string_literal: true

require 'rake/tasklib'

module Bundler
  module Audit
    class QuietAudit < Rake::TaskLib
      #
      # Initializes the task.
      #
      def initialize
        define
      end

      protected

      #
      # Defines the `bundle:quiet_audit` task.
      #
      def define
        namespace :bundle do
          desc 'Updates the ruby-advisory-db then runs bundle-audit in quite mode'
          task :quiet_audit do
            require 'bundler/audit/cli'
            %w[update check].each do |command|
              Bundler::Audit::CLI.start([command, '--quiet'])
            end
          end
        end
      end
    end
  end
end
