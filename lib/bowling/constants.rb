module Bowling
  module Constants
    module GameState
      # ready for play
      STARTING = :starting
      # something was wrong
      ERROR = :error
      # the play was finished successfully
      FINISHED = :finished
    end
    PATTERN_SYMBOL_FOR_INPUT = %r{[0-9]|-|/}.freeze
  end
end