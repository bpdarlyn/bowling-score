module Bowling
  class Frame
    SCORE_TYPES = %i[strike spare open].freeze
    STATES = %i[pending,open, close]

    attr_reader :frame_number, :score, :pins_knock_down,
                :throws, :score_type, :status

    def initialize(frame_number)
      @frame_number = frame_number
      @score = 0
      @score_type = nil
      @pins_knock_down = 0
      @throws = []
      @status = :pending
    end

    def set_score(score)
      @score = score
    end

    # throw_character: X | / | - | [0-9]
    def calculate_score(throw_character)
      case throw_character
      when 'X'
        10
      when '/'
        #todo calculate score for current frame
        10 - throws.map(&:score).reduce(:+)
      when '-'
        0
      when /[0-9]/
        throw_character.to_i
      else
        0
      end
    end

    def push_throw(throw_score, throw_number)
      throw = Bowling::Throw.new(throw_score, throw_number)
      throws << throw
    end

    def build_throw(throw_character)
      score_throw = calculate_score(throw_character)
      if last_frame?
        push_throw(score_throw, throws.length + 1)
        # todo calculate bonus here
        if throws.length == 3
          @status = :close
        end
      else
        push_throw(score_throw, throws.length + 1)
        # check if fill all throws inside this frame
        if strike?
          @status = :close
        elsif throws.length == 2
          @status = :close
        end
      end
    end

    def last_frame?
      @frame_number == 10
    end

    def is_first_throw?
      throws.length == 1
    end

    def strike?
      # current frame is strike ?
      # has a throw and his score is 10 ?
      is_first_throw? && score_strike?(throws.map(&:score).reduce(:+))
    end

    def score_strike?(score)
      score == 10
    end

  end
end