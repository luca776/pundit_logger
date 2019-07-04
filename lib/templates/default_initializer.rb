require 'pundit'
require 'pundit_logger'

Pundit::Logger.configure do |config|

  # CONTROLLER CONFIGURATION
  #
  # Name of the controller to add logging to.
  # For a standard Rails app, the default configuration
  # will add logging to all controllers.
  #
  # config.base_controller = 'ActionController::Base'

  # LOGGER CONFIGURATION
  #
  # Modify the log_level, for instance to :info or :debug
  # config.log_level = :debug
  #
  # Specify a different logger. The logger may or may not
  # implement tagged logging, but must implement :debug,
  # or whatever you set log_level to.
  # config.logger = Rails.logger
  #
  # For tagged logging, the tag to use for logs generated
  # by Pundit::Logger
  # config.logger_tag = 'PUNDIT'

  # OUTPUT CONFIGURATION
  #
  # Logs whenever a Pundit Scope is instantiated. This
  # can be helpful when observing which SQL is logged
  # immediately afterwards.
  # config.log_scope_instantiation = true
  #
  # Logs details about the policy, current_user, and other
  # arguments whenever an pundit `authorized` method in
  # a controller is not authorized.
  # config.log_unauthorized_policies = true
  #
  # Logs a summary of all policies used for scopes and
  # authorization in a controller action.
  # config.log_controller_policy_summary = true
end
