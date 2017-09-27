# module ApiAi
#   class RequestSender

#     def initialize(*params)
#       @params = params[0].merge(lang: 'en', v: '20150910')
#     end

#     def call
#      response = HTTP.auth('Bearer ' + ENV["API_AI_CLIENT_ACCESS_TOKEN"]).get("#{ENV['API_AI_URL']}query", params: @params)
#     end
#   end
# end
module ApiAi
  class RequestSender

    def call
       response = HTTP.auth("Bearer #{ENV['API_AI_CLIENT_ACCESS_TOKEN']}").get(ENV['API_AI_URL'], params: api_ai_params)
       # JSON.parse(response)
    end

    private
    attr_reader :session_id, :message

    def initialize session_id:, message:
      @session_id = session_id
      @message = message
    end

    def api_ai_params
      {
        query: message,
        lang: 'en',
        sessionId: session_id,
        v: '20170926'
      }
    end
    
  end
end