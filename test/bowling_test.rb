lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib)
require "bowling/game"

game = Bowling::Game.new('9-9-2-9-9-9-9-9-9-9-')
p game.run
