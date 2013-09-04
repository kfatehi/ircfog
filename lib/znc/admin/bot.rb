module ZNC
  module Admin
    module Bot
      def bot
        @bot ||= Cinch::Bot.new do
          configure do |c|
            c.server = "ircfog.com"
            c.ssl = Struct.new(:use).new(true)
            c.port = 6660
            c.nicks = ["#{ENV['ZNC_ADMIN_NICK']}_#{Rails.env}"]
            c.password = ENV['ZNC_ADMIN_PASS']
          end
        end
      end
    end
  end
end
