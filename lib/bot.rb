require 'telegram/bot'
require_relative '../lib/health_tips'
require './token'

# rubocop: disable Layout/LineLength
# rubocop: disable Metrics/CyclomaticComplexity, Metrics/BlockLength
# rubocop: disable Metrics/AbcSize, Metrics/MethodLength

class Bot
  def initialize
    tips = Scrapper::Health.new
    tips_title = tips.tips_heading
    tips_content = tips.tips_content
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello #{message.from.first_name}, I am MySickleBot a bot that gives health tips on Sickle Cell Anaemia. How can I help you today? To see the list of commands run /commands.")

        when '/welcome'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello #{message.from.first_name}, To see the list of commands run /commands.")

        when '/helpful_things'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_title[1]} - List of ways to take care of yourself
            \n - #{tips_content[4]}
            \n - #{tips_content[5]}
            \n - #{tips_content[6]}
            \n - #{tips_content[7]}
            \n - #{tips_content[8]}
            \n - #{tips_content[9]}")

        when '/harmful_things'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_title[2]} - List of things to stay away from
            \n - #{tips_content[10]}
            \n - #{tips_content[11]}
            \n - #{tips_content[12]}
            \n - #{tips_content[13]}
            \n - #{tips_content[14]}
            \n - #{tips_content[15]}
            \n - #{tips_content[16]}")

        when '/dealing_with_pain'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_title[0]} - Good guidelines to follow when in pain
            \n - #{tips_content[0]}
            \n - #{tips_content[1]}
            \n - #{tips_content[2]}
            \n - #{tips_content[3]}")

        when '/how_to_help'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_title[3]} - List of ways you can provide support to a loved one
            \n - #{tips_content[17]}
            \n - #{tips_content[18]}
            \n - #{tips_content[19]}
            \n - #{tips_content[20]}
            \n - #{tips_content[21]}")

        when '/get_care'
          bot.api.send_message(chat_id: message.chat.id, text: "#{tips_title[5]} - Possible problems caused by SCD that needs medical attention right away
            \n - #{tips_content[22]}
            \n - #{tips_content[23]}
            \n - #{tips_content[24]}
            \n - #{tips_content[25]}
            \n - #{tips_content[26]}
            \n - #{tips_content[27]}
            \n - #{tips_content[28]}
            \n - #{tips_content[29]}
            \n - #{tips_content[30]}
            \n - #{tips_content[31]}")

        when '/commands'
          bot.api.send_message(chat_id: message.chat.id, text: "Here is the list of commands you can run:
            \n /welcome: Welcomes the user.
            \n /helpful_things: List of ways to take care of yourself.
            \n /harmful_things: List of things to stay away from.
            \n /dealing_with_pain: Good guidelines to follow when in pain.
            \n /how_to_help: List of ways you can provide support to a loved one.
            \n /get_care: Possible problems caused by SCD that needs medical attention right away.
            \n /commands: Displays the list of commands.
            \n /bye: Says goodbye
            \n /webmd: To get more info visit the website where the tips were gotten from")

        when '/bye'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name} and take care.")

        when '/webmd'
          bot.api.send_message(chat_id: message.chat.id, text: 'To get more info visit: https://www.webmd.com/a-to-z-guides/living-with-sickle-cell')
        end
      end
    end
  end
end

# rubocop: enable Layout/LineLength
# rubocop: enable Metrics/CyclomaticComplexity, Metrics/BlockLength
# rubocop: enable Metrics/AbcSize, Metrics/MethodLength
