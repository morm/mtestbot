fs = require 'fs'

TelegramBot = require 'node-telegram-bot-api'
token = '229246242:AAECL1CXSzgWE46yMLpHmPx4PE5coM1YUbA'

bot = null
if process.env.NODE_ENV == 'production'
  bot = new TelegramBot token
  bot.setWebHook "https://mtestbot.herokuapp.com/#{token}"
else
  bot = new TelegramBot token, polling: true

# Matches /echo [whatever]
bot.onText /\/echo (.+)/, (msg, match) ->
  fromId = msg.from.id
  resp = match[1]
  bot.sendMessage fromId, resp
  return
# Any kind of message
bot.on 'message', (msg) ->
  chatId = msg.chat.id
  # photo can be: a file path, a stream or a Telegram file_id
  photo = 'resources/imgs/Koala.png'
  bot.sendPhoto chatId, photo, caption: 'Hello from Down Under'
  return