require 'rails/all'
require 'pundit_logger/version'
require 'pundit_logger/configuration'
require 'pundit_logger/controller_extensions'
require 'pundit_logger/logging'
require 'pundit_extensions/loggers'

module Pundit
  module Logger
    extend ControllerExtensions
    extend Logging
    extend Configuration

    # @return name of ActiveSupport hook to use when injecting
    #   controller loggers
    def self.pundit_controller_hook_name
      if Rails::VERSION::MAJOR > 5 ||
        (Rails::VERSION::MAJOR == 5 && Rails::VERSION::MINOR > 0)
        :action_controller_base
      else
        :action_controller
      end
    end
  end
end

ActiveSupport.on_load(Pundit::Logger.pundit_controller_hook_name) do
  Pundit::Logger.add_controller_unauthorized_logger
  Pundit::Logger.add_controller_policy_summary
end
