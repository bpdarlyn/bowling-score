module Bowling
  module Helpers
    module ValidatorGameHelper
      private

      def validate_params
        # transform to array
        # if the character is permitted?
        # check the length should be min = 12 and max  = 21
        # check if the number range is between 0 and 10
        #
        array_chars = rolls
        if array_chars.length >= 11 && array_chars.length <= 21
          no_matched = array_chars.reject { |c| c =~ Bowling::Constants::PATTERN_SYMBOL_FOR_INPUT }
          if no_matched.length > 0
            @status = Bowling::Constants::GameState::ERROR
            @errors << 'The input has invalid chars'
          else
            @status = Bowling::Constants::GameState::STARTING
            @errors = []
          end
        else
          @status = Bowling::Constants::GameState::ERROR
          @errors << 'The input has not a valid length'
        end
      end
    end
  end
end