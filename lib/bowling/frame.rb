module Bowling
  class Frame
    SCORE_TYPES = %i[strike spare open].freeze

    attr_reader :frame_number, :score, :pins_knock_down, :throws, :score_type

    def initialize(frame_number)
      @frame_number = frame_number
      @score = 0
      @score_type = nil
      @pins_knock_down = 0
      @throws = []
    end
  end
end