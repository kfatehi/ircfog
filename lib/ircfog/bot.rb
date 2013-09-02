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
        wait_until_connected
        puts "Bot connected"
        at_exit do
          puts "Waiting for irc bot to terminate ... "
          @thread.terminate
          puts "Bot terminated"
        end
        return true
      end

      def wait_until_connected
        count = 2
        loop do
          sleep count+=1
          break if @bot.irc.socket.state == "SSLOK "
          raise "Timeout" if count == 10
        end
      end
    end
  end
end

