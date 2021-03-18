require('bowling/constants')
require('bowling/throw')
require('bowling/frame')
require('bowling/line')
require('bowling/helpers/validator_game_helper')
require('bowling/services/game_service')
module Bowling
  class Game
    include Bowling::Helpers::ValidatorGameHelper

    attr_reader :status, :errors, :rolls
    def initialize(string_rolls)
      @status = nil
      @errors = []
      @response = nil
      @rolls = string_rolls.split('') || []
      validate_params
    end

    def run
      if status == Bowling::Constants::GameState::STARTING
        # create service
        service_game = Bowling::Services::GameService.new(self)
        service_game.run
        service_game.line.frames.each do |frame|
          p "====FRAME NRO: #{frame.frame_number}"
          frame.throws.each do |throw|
            p "THROW SCORE: #{throw.score}"
          end
        end
      end
    end
  end
end