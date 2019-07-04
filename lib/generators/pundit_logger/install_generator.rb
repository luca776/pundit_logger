require 'rails/generators'
module PunditLogger
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../templates", __FILE__)
      desc 'Creates Pundit::Logger initializer for your application'

      def copy_initializer
        template 'default_initializer.rb',
          'config/initializers/pundit_logger.rb'

        puts "View the created file for configuration options.\n" \
             "Now you know what Pundit\'s up to!"
      end
    end
  end
end
