module Pundit
  module Logger
    # Once a controller action completes, the names of the
    # Pundit policies invoked are logged to the configured logger.
    #
    # Intended for mixing into Rails controllers
    #
    # Functionality controlled by
    # Pundit::Logger.log_controller_policy_summary; disable by setting
    # that to false.
    module LogControllerPolicySummary

      extend ActiveSupport::Concern

      included do
        after_action :log_policies_invoked,
          if: -> { Pundit::Logger.log_controller_policy_summary? }
      end

      private

      def log_policies_invoked
        policy_names = invoked_policy_names +
                         invoked_policy_scope_names
        message = if policy_names.empty?
                    'None'
                  else
                    policy_names.uniq.sort.join(', ')
                  end
        Pundit::Logger.log 'Controller Action Policies ' \
                           "Invoked: #{message}"
      end

      def invoked_policy_names
        return [] unless respond_to?(:policies)
        policies.map do |_, policy_obj|
          policy_obj.class.name
        end
      end

      def invoked_policy_scope_names
        Pundit.invoked_policy_scope_names.to_a
      end
    end
  end
end
