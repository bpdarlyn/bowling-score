lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib)
require "bowling/game"
require "test/unit"

class TestUnitBowling < Test::Unit::TestCase
  def setup
    @game = Bowling::Game.new
  end

  def test_exercise_one
    example = 'XXXXXXXXXXXX'
    assert_equal(300, @game.run(example))
  end

  def test_exercise_two
    example = '9-9-9-9-9-9-9-9-9-9-'
    assert_equal(90, @game.run(example))
  end

  def test_exercise_three
    example = '5/5/5/5/5/5/5/5/5/5/5'
    assert_equal(150, @game.run(example))
  end

  def test_all_zero
    example = '00000000000000000000'
    assert_equal(0, @game.run(example))
  end

end
