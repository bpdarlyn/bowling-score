# lib/bowling/game.rb
require('bowling/frame')
module Bowling
  class Line
    attr_reader :frames, :throw_numbers, :score
    def initialize
      reset_line
    end

    private

    def reset_line
      @throw_numbers = 0
      @score = 0
      initialize_frames
    end

    def initialize_frames
      @frames = []
      @frames = (1..10).to_a.map { |frame_number| Frame.new(frame_number) }
    end
  end
end