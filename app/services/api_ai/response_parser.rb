module ApiAi
  class ResponseParser
     def initialize(response)
      @response = JSON.parse(response)
     end

     def call 
      {
        output: @response.dig('result','fulfillment','speech'),
        psid: @response['sessionId'],
        parameters: @response['result']['parameters'],
        action: @response.dig('result', 'action').to_sym,
        actionIncomplete: @response.dig('result', 'actionIncomplete')
      }
     end
  end
end