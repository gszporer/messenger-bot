module ApiAi
  module Actions
    class CreateTodo

      def initialize(response)
        @response = response
      end

      def call
        return { text: @response[:output] } if @response[:actionIncomplete]
        ToDo.create(item: @response[:parameters]["item"] )
        { text: ToDo.all }
      end

    end
  end
end