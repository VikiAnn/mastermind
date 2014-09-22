gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class TestGame < Minitest::Test
  def test_game_can_be_initialized
    game = Game.new
    assert game.is_a?(Game)
  end

  def test_it_can_check_if_it_is_over
    game = Game.new
    assert game.respond_to?(:over?)
  end

  def test_it_can_check_to_see_if_game_was_won
    game = Game.new
    assert game.respond_to?(:won?)
  end

  def test_it_can_check_to_see_if_game_was_lost
    game = Game.new
    assert game.respond_to?(:lost?)
  end
end
