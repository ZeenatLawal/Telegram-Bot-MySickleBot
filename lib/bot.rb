require 'telegram/bot'
require_relative 'health_tips.rb'


class Bot
  def initialize
    token = '1812923032:AAGWtd5mUNtHH8f55M4Dj02Zk5QspiNTCK8'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'

        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , How are you today?")

      when '/stop'

        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
      when '/helpful things'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
      end
    end
  end
  end
end
