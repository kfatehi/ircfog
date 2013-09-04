module ZNC
  module Admin
    module ListUsers
      def list_users
        messages = []
        @@handler = @bot.on(:private) do |m|
          if m.user.nick == CONTROL_NICK
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
    end
  end
end
