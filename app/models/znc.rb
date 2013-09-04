require 'znc/admin/bot'
require 'znc/admin/list_users'
require 'znc/admin/add_user'

module ZNC
  CONTROL_NICK = "*controlpanel"

  class << self
    include Admin::Bot
    include Admin::ListUsers
    include Admin::AddUser

    def admin
      @admin ||= @bot.user_list.find_ensured(CONTROL_NICK)
    end

    def users
      #@bot.channels.first.msg "listusers minus myself"
      users = self.list_users
      
      binding.pry
    end
  end
end

