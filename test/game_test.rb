gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/game'
require_relative '../lib/message_printer'
require_relative '../lib/sequence'
require_relative '../lib/guess_manager'
require_relative '../lib/game_time'

class TestGame < Minitest::Test
  attr_reader :game, :fake_stdout

  def setup
    @fake_stdout = StringIO.new
    @game = Game.new(fake_stdout)
  end

  def test_game_can_be_initialized
    assert game.is_a?(Game)
  end

  def test_game_has_a_sequence
    assert game.respond_to?(:sequence)
  end

  def test_game_takes_a_guess
    skip
    # how the fuck do I test this?
  end

  def test_it_can_check_if_it_is_over
    assert game.respond_to?(:over?)
  end

  def test_it_can_check_to_see_if_game_was_won
    assert game.respond_to?(:won?)
  end

  def test_it_can_check_to_see_if_game_was_lost
    assert game.respond_to?(:lost?)
  end
end
