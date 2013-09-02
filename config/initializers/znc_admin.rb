require 'ircfog/bot'
# level (:debug, :info, :warn, :error, :fatal) (defaults to: event) — The level of the message
module ZNCAdmin
  class DoubleBotError < StandardError ; end
  def self.init
    if @bot.nil?
      @bot = ZNC.bot
      @bot.loggers.level = :error
      Ircfog::Bot.start_in_thread(@bot)
    else
      raise DoubleBotError
    end
  end
end
