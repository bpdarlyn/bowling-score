module Bowling
  module Services
    class GameService
      include Bowling::Helpers::FrameServiceHelper
      attr_reader :game, :throws, :frames, :score

      def initialize(game)
        @game = game
        @score = 0
        @throws = []
        @index_frame = 0
        @throw_counter = 0
        @frames = 10.times.to_a.map { Bowling::Frame.new }
        @current_frame = @frames[@index_frame]
      end

      def create_stage
        rolls = game.rolls
        rolls.each do |throw_character|
          build_throw(throw_character)
        end
      end

      def build_throw(throw_character)
        @throw_counter += 1
        add_throw(Throw.new(throw_character, @frame))
      end

      def add_throw(new_throw)
        @current_frame = @frames[@index_frame]
        if @current_frame
          @current_frame.push_throw(new_throw)
          @throws << new_throw
          score_game
        end
      end

      def run
        create_stage
      end

      def score_game
        evaluate_frame_type
      end
    end
  end
end