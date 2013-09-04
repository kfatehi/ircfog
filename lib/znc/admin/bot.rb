module ZNC
  module Admin
    module Bot
      def bot
        @bot ||= Cinch::Bot.new do
          configure do |c|
            c.server = ENV['ZNC_HOST']
            if ENV['ZNC_SSL'] == "true"
              c.ssl = Struct.new(:use).new(true)
            end
            c.port = ENV['ZNC_PORT']
            c.password = ENV['ZNC_ADMIN_PASS']
          end
        end
      end
    end
  end
end
