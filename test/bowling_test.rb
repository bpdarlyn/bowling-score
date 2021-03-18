lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib)
require "bowling/game"

game = Bowling::Game.new('XXXXXXXXX32')
p game.run
