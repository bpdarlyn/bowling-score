module Bowling
  class Throw
    attr_reader :score, :throw_number

    def initialize(score, throw_number)
      @score = score
      @throw_number = throw_number
    end
  end
end