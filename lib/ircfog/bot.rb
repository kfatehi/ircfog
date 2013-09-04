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
        count = 1
        loop do
          sleep count+=1
          state = @bot.irc.socket.state
          break if state && state.match(/OK/)
          if count == 3
            puts "Bot was unable to connect! (#{3} seconds)"
            puts "Did you start ZNC?"
            binding.pry
            exit 1
          end
        end
      end
    end
  end
end

