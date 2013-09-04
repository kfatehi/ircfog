require 'znc_admin/bot'
require 'znc_admin/list_users'
require 'znc_admin/add_user'

module ZNC
  class << self
    include Admin::Bot
    include Admin::ListUsers
    include Admin::AddUser

    def status
      @status ||= @bot.user_list.find_ensured("*status")
    end

    def admin
      @admin ||= @bot.user_list.find_ensured("*admin")
    end



    def users
      #@bot.channels.first.msg "listusers minus myself"
      users = self.list_users
      
      binding.pry
    end
  end
end

