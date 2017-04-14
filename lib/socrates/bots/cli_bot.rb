module Socrates
  module Bots
    class CLIBot
      def initialize(state_factory:)
        @adapter    = ConsoleAdapter.new
        @storage    = Storage::MemoryStorage.new
        @dispatcher = Core::Dispatcher.new(storage: @storage, adapter: @adapter, state_factory: state_factory)
      end

      def start
        # Clear out any remnants from previous runs.
        @storage.clear(ConsoleAdapter::CLIENT_ID)

        while (input = gets.chomp)
          @dispatcher.dispatch(message: input)
        end
      end
    end
  end
end