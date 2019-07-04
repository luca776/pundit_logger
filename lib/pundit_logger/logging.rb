module Pundit
  module Logger
    module Logging
      # Logs a message to the logger configured in
      # Pundit::Logger.logger.
      #
      # Uses tagged logging, if configured using
      # Pundit::Logger.logger_tag
      #
      # @param [String] Message to write to the logger
      def log(message)
        if logger.respond_to?(:tagged) && logger_tag
          logger.tagged(logger_tag) do
            write_message message
          end
        else
          write_message message
        end
      end

      private

      def write_message(message)
        logger.public_send(
          log_level.to_sym,
          message
        )
      end
    end
  end
end
