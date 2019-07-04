module DummyApp
  class Application < Rails::Application
    config.autoload_paths = []
    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = 'utf-8'
    config.eager_load = false
  end
end
Rails.application.initialize!(__dir__)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', database: ':memory:'
)

require_relative '../app/models/models'
require_relative '../app/controllers/controllers'
require_relative '../app/policies/policies'
require_relative '../db/schema'

Rails.application.routes.draw do
  root to: 'application#root'
  resources :widgets, only: [:index, :show]
end

Rails.application.configure do
  config.secret_key_base = SecureRandom.hex(64)
  config.cache_classes = false
  config.eager_load = false
end
