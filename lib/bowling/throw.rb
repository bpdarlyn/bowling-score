module Bowling
  class Throw
    attr_reader :score, :frame, :character

    def initialize(character, frame)
      @character = character
      @frame = frame
    end

    def score
      case @character
      when 'X'
        10
      when '/'
        nil
      when '-'
        0
      when /[0-9]/
        @character.to_i
      else
        0
      end
    end
  end
end