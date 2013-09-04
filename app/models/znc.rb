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
      binding.pry
    end

    def users
      users = self.list_users
    end

    def last_user
      users[3].message.gsub('|', '').split(' ').first 
    end
  end
end

