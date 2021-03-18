module Bowling
  module Services
    class GameService
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

      private

      def last_frame?
        @index_frame == 9
      end

      def score_game
        if last_frame?
        else
          evaluate_frame_type
        end
      end

      def evaluate_frame_type
        strike?
        open_or_spare?
        evaluate_score_frame_type
      end

      def strike?
        current_throw = throws.last
        if @throw_counter == 1 && current_throw.character == 'X'
          @current_frame.score_type = :strike
        end
      end

      def open_or_spare?
        if @throw_counter == 2
          if @current_frame.throws.map(&:character).include?('/')
            @current_frame.score_type = :spare
          else
            @current_frame.score_type = :open
          end
        end
      end

      def get_frame_by_position(position)
        return nil if position < 0
        frames[position]
      end

      def next_frame
        if @throw_counter == 1 && throws.last.character == 'X'
          @throw_counter = 0
          @index_frame += 1
        elsif @throw_counter == 2
          @throw_counter = 0
          @index_frame += 1
        end
      end

      def evaluate_score_frame_type
        frame2 = get_frame_by_position(@index_frame - 2)
        frame1 = get_frame_by_position(@index_frame - 1)
        strike_score(frame2, frame1)
        strike_spare_or_open_score(frame1)
        spare_strike_score(frame1)
        open_score
        next_frame
      end

      def open_score
        frame_score = @current_frame.score
        if @current_frame.score_type == :open && frame_score < 10
          @score += frame_score
        end
      end

      def spare_strike_score(frame1)
        if frame1 && frame1.score_type == :spare && @current_frame.score_type == :strike # X9-
          @score += frame1.score + @current_frame.score
        elsif frame1 && frame1.score_type == :spare && !@current_frame.score_type
          # 7/
          pin = throws.last
          @score += 20 + pin.score
        end
      end

      def strike_spare_or_open_score(frame1)
        if frame1 && frame1.score_type == :strike && %i[spare open].include?(@current_frame.score_type) # X9-
          @score += 10 + @current_frame.score
        end
      end

      def strike_score(frame2, frame1)
        has_two_before = frame1 && frame2
        if has_two_before && frame1.score_type == :strike && frame2.score_type == :strike # XXX
          if @current_frame.score_type == :strike
            @score += 30
          elsif has_two_before && !@current_frame.score_type
            # XX8
            pin = throws.last
            @score += 20 + pin.score
          end
        end
      end
    end
  end
end