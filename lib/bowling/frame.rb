module Bowling
  class Frame
    attr_accessor :throws, :score_type

    def initialize
      @score_type = nil
      @throws = []
    end

    def strike?
      throw = throws.first
      throw && throw.length == 1 && throw.score == 10
    end

    def push_throw(new_throw)
      throws.push(new_throw)
    end

    def score
      current_score = 0
      throws.each_with_index do |throw, index|
        score = case throw.character
                when 'X'
                  10
                when '-'
                  0
                when '/'
                  10 - ((throws.reject.each_with_index { |t, i| i == index }).map(&:score).reduce(:+) || 0)
                when /[0-9]/
                  throw.character.to_i
                else
                  0
                end
        current_score += score
      end
      current_score
    end

  end
end