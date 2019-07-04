module Pundit
  module Logger
    module Configuration
      # Used to configure Pundit:Logger in your application.
      #
      # @example
      #   # config/initializers/pundit_logger.rb
      #
      #   Pundit::Logger.configure do |config|
      #     config.log_level = :warn
      #   end
      def configure
        yield self if block_given?
      end

      # @param [String] ('ActionController::Base')
      #        Name of the controller to add logging to.
      attr_writer :base_controller
      def base_controller
        (
          @base_controller || 'ActionController::Base'
        ).constantize
      end

      # @param [Symbol] (:debug) The method to call on the defined
      #   logger, or the standard Rails logger methods
      #   If using the Rails.logger, options include
      #     :debug, :warn: :info, :error
      attr_writer :log_level
      def log_level
        @log_level ||= :debug
      end

      # @param [#deug] (Rails.logger) The logger which the
      #   gem will write to. Must respond to whatever the
      #   configuration for #log_level is. (:debug by default)
      #
      #   If the logger responds to #tagged, tagged logging
      #   will be utilized. You can disable tagged logging
      #   with #logger_tag:
      #     config.logger_tag = false
      attr_writer :logger
      def logger
        @logger ||= Rails.logger
      end

      # @param [String, false, nil] ('PUNDIT') The tag to use for
      #   tagged_logging. This prefixes any output to your logs
      #   from this gem.
      #   If nil or false, tagged logging will not be used.
      attr_writer :logger_tag
      def logger_tag
        if instance_variable_defined?(:@logger_tag)
          @logger_tag
        else
          'PUNDIT'
        end
      end

      # Enable logging when a Scope is instantiated. This can help
      # identify the source of SQL queries following in the logs.
      #
      # @param [String, false, nil] (true) logging enabled when,
      #   truthy, disabled when falsey
      attr_writer :log_scope_instantiation
      def log_scope_instantiation?
        if instance_variable_defined?(:@log_scope_instantiation)
          @log_scope_instantiation
        else
          true
        end
      end

      # Enable logging when a policy returns unauthorized
      # (a Pundit::NotAuthorizedError), and that error is
      # unhandled, bubbling up to the controller).
      #
      # This logging includes the policy and the arguments,
      # to help debug why the action was unauthorized.
      #
      # @param [Boolean] (true) logging enabled when truthy,
      #   disabled when falsey
      attr_writer :log_unauthorized_policies
      def log_unauthorized_policies?
        if instance_variable_defined?(:@log_unauthorized_policies)
          @log_unauthorized_policies
        else
          true
        end
      end

      # Enable logging a summary of all policies and scopes used
      # in a controller request, after the action completes.
      #
      # Note that policies invoked by serializers are not
      # logged at this time.
      #
      # @param [Boolean] (true) logging enabled when truthy,
      #   disabled when falsey
      attr_writer :log_controller_policy_summary
      def log_controller_policy_summary?
        if instance_variable_defined?(:@log_controller_policy_summary)
          @log_controller_policy_summary
        else
          true
        end
      end
    end
  end
end
