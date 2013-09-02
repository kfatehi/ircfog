require 'ircfog/bot'
bot = ZNC.bot
# level (:debug, :info, :warn, :error, :fatal) (defaults to: event) — The level of the message
bot.loggers.level = :error
Ircfog::Bot.start_in_thread bot
