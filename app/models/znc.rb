require 'stringio'

module ZNC
  class << self
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

    def admin
      @admin ||= @bot.user_list.find_ensured("*admin")
    end

    def list_users
      messages = []
      @@handler = @bot.on(:private) do |m|
        if m.user.nick == "*admin"
          messages << m
        end
      end
      admin.privmsg("ListUsers")
      loop do 
        if messages.count > 2 && 
          messages[0].message.strip.match(/\+-+/) &&
          messages[2].message.strip.match(/\+-+/) &&
          messages.last.message.strip.match(/\+-+/)
            break
        end
      end
      @@handler.unregister
      return messages
    end

    def add_user user 
      messages = []
      @@handler = @bot.on(:private) do |m|
        if m.user.nick == "*admin"
          messages << m
        end
      end
      admin.privmsg("AddUser #{user.znc_username} #{user.znc_username.reverse}")
      loop do 
        if messages.count > 0 &&
          messages.first.message.match(/User(.*)added!/)
            break
        end
      end
      @@handler.unregister
      return messages
    end

    def users
      #@bot.channels.first.msg "listusers minus myself"
      return [User.last.znc_username]
    end
  end
end

