require 'securerandom'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create do
    self.znc_username = "U#{SecureRandom.uuid[0..7]}"
  end

  def znc_password
    self.znc_username.reverse
  end

  def networks
    ZNC.bot.get_networks(self.znc_username)
  end

end
