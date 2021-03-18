module Bowling
  module Services
    class GameService
      attr_reader :game, :line, :count, :score

      def initialize(game)
        @game = game
        @count = 0
        @score = 0
      end

      def create_stage
        @line = Bowling::Line.new
        rolls = game.rolls
        rolls.each do |throw_character|
          current_frame = fetch_pending_frame.first
          attach_throw_character(current_frame, throw_character) if current_frame
          #calculate_frame_score(current_frame) if current_frame
        end
      end

      def run
        create_stage
      end

      def fetch_pending_frame
        line.frames.select { |frame| frame.status == :pending }
      end

      def fetch_frame_by_number(frame_number)
        (line.frames.select { |f| f.frame_number == frame_number })
      end

      def attach_throw_character(frame, throw_character)
        frame.build_throw(throw_character)
      end

      def calculate_frame_score(current_frame)
        mark_as_strike(current_frame)
        #mark_as_spare(current_frame)
        #mark_as_open(current_frame)
      end

      def mark_as_strike(current_frame)
        frame_two_position_before = fetch_frame_by_number(current_frame.frame_number - 2).first
        frame_one_position_before = fetch_frame_by_number(current_frame.frame_number - 1).first
        if frame_two_position_before && frame_one_position_before &&
           frame_one_position_before.score_type == :strike && frame_two_position_before.score_type == :strike
          if current_frame.score_type == :strike && frame_two_position_before.score == 0
            score1 = frame_one_position_before.throws.map(&:score).reduce(:+)
            score2 = frame_two_position_before.throws.map(&:score).reduce(:+)
            score3 = current_frame.throws.map(&:score).reduce(:+)
            @score += score1 + score2 + score3
            frame_two_position_before.set_score(@score)
          end
        end
      end

    end
  end
end