module Ircfog
  module Bot
    class << self
      def start_in_thread bot
        return false if @thread
        @bot = bot
        @thread = Thread.new do
          puts "Starting irc bot ... "
          @bot.start
          puts "Bot started"
        end
        at_exit do
          puts "Waiting for irc bot to terminate ... "
          @thread.terminate
          puts "Bot terminated"
        end
        return true
      end
    end
  end
end

