# lib/bowling/game.rb
require('bowling/frame')
module Bowling
  class Line
    attr_reader :frames, :rolls_number, :score
    def initialize
      reset_line
    end

    private

    def reset_line
      initialize_frames
      @rolls_number = 0
      @score = 0
    end

    def initialize_frames
      @frames = []
      @frames = (1..10).to_a.map{|frame_number| Frame.new(frame_number) }
    end
  end
end