module ApiAi
  class OutputGenerator 

    ACTION_PERFORMERS = { create_to_do: ApiAi::Actions::CreateTodo}
    def initialize(response)
      @response = response
      @action = @response[:action]
    end

    def call 
      return { text: @response.dig(:output) } if ACTION_PERFORMERS[@action].nil?
      ACTION_PERFORMERS[@action].new(@response).call
    end

  end
end