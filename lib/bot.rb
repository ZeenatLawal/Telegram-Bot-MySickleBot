require 'telegram/bot'
require_relative '../lib/health_tips'
require './token'

class Bot
  
  def initialize
    tips = Scrapper::Health.new
    tips_title = tips.tips_heading
    tips_content = tips.tips_content
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
  
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , I am MySickleBot a telegram bot where you can get health tips on Sickle Cell Anaemia. You can get healthy living, harmful things, help a loved one and when to get medical care tips.")
  
          bot.api.send_message(chat_id: message.chat.id, text: 'Here are the list of commands you can run:')
  
        when '/helpful_things'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_content[2]}")
  
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        end
      end
    end  
  end  
end
