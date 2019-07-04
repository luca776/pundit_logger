require_relative 'log_unauthorized_policies'
require_relative 'log_controller_policy_summary'

module Pundit::Logger
  module ControllerExtensions
    def add_controller_unauthorized_logger
      base_controller.include LogUnauthorizedPolicies
    end

    def add_controller_policy_summary
      base_controller.include LogControllerPolicySummary
    end
  end
end
