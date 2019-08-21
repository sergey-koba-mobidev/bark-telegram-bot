require 'telegram/bot'

token = ENV['TELEGRAM_BOT_API_TOKEN']

puts "[INFO] Starting bot..."

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      reply_text = "Hello, #{message.from.first_name} your chat_id is #{message.chat.id}. Enter it in your Bark mobile app in Setting->Actions."
      puts "[INFO] #{reply_text}"
      bot.api.send_message(chat_id: message.chat.id, text: reply_text)
    when '/stop'
      reply_text = "Bye, #{message.from.first_name}"
      puts "[INFO] #{reply_text}"
      bot.api.send_message(chat_id: message.chat.id, text: reply_text)
    end
  end
end