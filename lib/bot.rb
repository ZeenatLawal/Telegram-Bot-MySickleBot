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
  
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, I am MySickleBot a bot that gives health tips on Sickle Cell Anaemia. How can I help you today?")
  
          bot.api.send_message(chat_id: message.chat.id, text: "Here are the list of commands you can run:
            \n /helpful_things: List of ways to take care of yourself.
            \n /harmful_things: List of things to stay away from.
            \n /dealing_with_pain: Good guidelines to follow when in pain.
            \n /how_to_help: List of ways you can provide support to a loved one.
            \n /get_care: Possible problems caused by SCD that needs medical attention right away.
            \n /commands: Displays the list of commands.
            \n /bye: Says goodbye ")
  
        when '/helpful_things'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_content[2]}")
  
        when '/bye'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name} and take care.")
        end
      end
    end
  end  
end
