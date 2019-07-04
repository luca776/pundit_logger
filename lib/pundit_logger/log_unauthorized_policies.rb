module Pundit
  module Logger
    # If Pundit authorization fails, the policy name and associated
    # information is logged to the configured logger.
    #
    # Intended for mixing into Rails controllers
    #
    # Functionality controlled by
    # Pundit::Logger.log_unauthorized_policies; disable by setting
    # that to false.
    module LogUnauthorizedPolicies

      extend ActiveSupport::Concern

      included do
        around_action :log_unauthorized_policies,
          if: -> { Pundit::Logger.log_unauthorized_policies? }
      end

      private

      def log_unauthorized_policies
        yield
      rescue Pundit::NotAuthorizedError => e
        Pundit::Logger.log "Authorization Failed for "\
                           "#{e.policy.class.name}: #{e.message}"
        raise e
      end
    end
  end
end
