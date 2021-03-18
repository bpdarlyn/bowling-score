module Bowling
  module Services
    class GameService
      attr_reader :game, :line
      def initialize(game)
        @game = game
      end

      def create_stage
        @line = Bowling::Line.new
        rolls = game.rolls
      end

      def run
        create_stage

      end

    end
  end
end