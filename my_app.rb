require 'sinatra'

get '/' do
  redirect 'http://bot_url_from_BotFather', 303
end
