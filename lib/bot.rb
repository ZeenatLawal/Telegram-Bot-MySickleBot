require 'telegram/bot'

class Bot
  def initialize
    token = '1812923032:AAGWtd5mUNtHH8f55M4Dj02Zk5QspiNTCK8'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'

          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , I am MySickleBot a telegram bot where you can get health tips on Sickle Cell Anaemia. You can get healthy living, harmful things, help a loved one and when to get medical care tips.")

          bot.api.send_message(chat_id: message.chat.id, text: "Here are the list of commands you can run:")

        when '/stop'

          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        when '/helpful things'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        end
      end
    end
  end
end
