require 'bundler/setup'
require 'rails/all'
require 'pundit_logger'
require 'rspec-rails'
require 'rspec/rails'
require 'pry'

require 'support/dummy_app/config/application'
Dir['./spec/support/shared_examples/*.rb'].each {|file| require file }

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.order = :random

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:each) do
    reset_configuration
  end
end

def configure(logging_setting, value)
  Pundit::Logger.configure do |config|
    config.send "#{logging_setting}=", value
  end
end

def reset_ivar(logging_setting)
  ivar_name = "@#{logging_setting}".to_sym
  return unless Pundit::Logger
                  .instance_variable_defined?(ivar_name)
  Pundit::Logger.remove_instance_variable ivar_name
end

def reset_configuration
 reset_ivar :base_controller
 reset_ivar :logger
 reset_ivar :logger_tag
 reset_ivar :log_level
 reset_ivar :log_scope_instantiation
 reset_ivar :log_unauthorized_policies
 reset_ivar :log_controller_policy_summary
end
