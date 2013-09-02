require 'ircfog/bot'

module ZNC
  def self.bot
    @bot ||= Cinch::Bot.new do
      configure do |c|
        c.server = "ircfog.com"
        c.ssl = Struct.new(:use).new(true)
        c.port = 6660
        c.nicks = ["#{ENV['ZNC_ADMIN_NICK']}_#{Rails.env}"]
        c.password = ENV['ZNC_ADMIN_PASS']
      end
      on :message, /^!(.+)/ do |m, query|
        m.reply "What is #{query}?"
      end
    end
  end

end

