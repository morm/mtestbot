'use strict'
fs = require('fs')
Bot = require('node-telegram-bot')

###*
# this sample helps understand how the bot works, can also be used for integration tests ;)
###

bot = new Bot(token: '229246242:AAECL1CXSzgWE46yMLpHmPx4PE5coM1YUbA').on('message', (message) ->
  switch message.text
    when '/sendMessage'
      bot.sendMessage
        chat_id: message.chat.id
        text: 'echo : ' + message.text
    when '/sendPhoto'
      bot.sendPhoto
        chat_id: message.chat.id
        caption: 'trololo'
        files: photo: './logo.png'
    when '/sendDocument'
      bot.sendDocument {
        chat_id: message.chat.id
        files:
          filename: 'scream'
          contentType: 'audio/ogg'
          stream: fs.createReadStream('./0477.ogg')
      }, console.error
    when '/sendLocation'
      bot.sendLocation
        chat_id: message.chat.id
        latitude: -27.121192
        longitude: -109.366424
        reply_to_message_id: message.message_id
  return
).on('message', (message) ->
  console.log message
  return
).on('test', (message) ->
  bot.sendMessage
    chat_id: message.chat.id
    text: 'You\'ve send command: ' + command
  return
).on('arg', (args, message) ->
  bot.sendMessage
    chat_id: message.chat.id
    text: 'You\'ve send command with arguments: ' + args
  return
).start()