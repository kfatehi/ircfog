module ZNC
  module Admin
    module AddUser
      def add_user user 
        messages = []
        @@handler = @bot.on(:private) do |m|
          if m.user.nick == CONTROL_NICK
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
    end
  end
end
