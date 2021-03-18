lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib)
require "bowling/game"

#all_strike = 'XXXXXXXXXXXX'
#all_strike = 'XXXXXXXXXXXX'
#all_strike = 'XX8/XXXXXXXXX'
#all_strike = 'XX8XXXXXXXXXX'
all_strike = '5/5/5/5/5/5/5/5/5/5/5'
#all_strike = '9-9-9-9-9-9-9-9-9-9-'
game = Bowling::Game.new(all_strike)
game.run
