# lib/bowling/game.rb
module Bowling
  class Line
    attr_reader :frames
    def initialize
      reset_line
    end

    def score
      frames.map(&:score).reduce(:+)
    end

    private

    def reset_line
      @score = 0
      initialize_frames
    end

    def initialize_frames
      @frames = []
      @frames = (1..10).to_a.map { |frame_number| Frame.new(frame_number) }
    end
  end
end