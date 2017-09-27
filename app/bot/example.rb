include Facebook::Messenger

Bot.on :message do |input|
  input.mark_seen
  input.typing_on

  # query = message.text.split(' ')
  # #x, *y = query
  # if query[0] == 'gif'
  #   message.reply(GifService.find_gif(query[1]))
  # elsif query[0] == 'number'
  #   if query[1].nil?
  #     message.reply(text: 'Give me a number pliss')
  #   else
  #     message.reply(text: NumberService.find_fact(query[1]))
  #   end
  # else
  #   message.reply(text: message.text)
  # end

  User.create(psid: input.sender['id'])

  api_ai_response = ApiAi::RequestSender.new(session_id: input.sender['id'], message: input.text).call
  parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  output          = ApiAi::OutputGenerator.new(parsed_response).call

  input.reply(output)
end