require('bowling/constants')
require('bowling/throw')
require('bowling/frame')
require('bowling/helpers/validator_game_helper')
require('bowling/helpers/frame_service_helper')
require('bowling/services/game_service')
module Bowling
  class Game
    include Bowling::Helpers::ValidatorGameHelper

    attr_reader :status, :errors, :rolls
    def initialize
      @status = nil
      @errors = []
      @response = nil
    end

    def run(string_rolls)
      @rolls = string_rolls.split('') || []
      validate_params
      if status == Bowling::Constants::GameState::STARTING
        # create service
        service_game = Bowling::Services::GameService.new(self)
        service_game.run
        service_game.score
      else
        errors
      end
    end
  end
end