require('bowling/constants')
require('bowling/helpers/validator_game_helper')
module Bowling
  class Game
    include Bowling::Helpers::ValidatorGameHelper

    attr_reader :status, :errors
    def initialize(string_rolls)
      @status = nil
      @errors = []
      @response = nil
      validate_params(string_rolls)
    end

    def run
      status
    end
  end
end