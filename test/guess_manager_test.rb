gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/guess_manager'
require_relative '../lib/message_printer'

class GuessManagerTest < Minitest::Test
  attr_reader :guess_manager, :fake_stdout

  def setup
    @fake_stdout = StringIO.new
    @guess_manager = GuessManager.new('yrbg', fake_stdout)
  end

  def test_can_receive_guesses
    guess_manager.add_guess('yyyy')
    guess_manager.add_guess('yrbg')
    assert_equal ['yyyy', 'yrbg'], guess_manager.guesses
  end

  def test_keeps_count_of_guesses
    guess_manager.add_guess('yyrg')
    guess_manager.add_guess('byrg')
    assert_equal 2, guess_manager.count
  end

  def test_has_max_of_10_guesses
    assert_equal 10, guess_manager.max_guesses
  end

  def test_can_return_correct_elements_number
    guess_manager = GuessManager.new('yyrb', fake_stdout)
    guess_manager.add_guess('rrbg')
    assert_equal 2, guess_manager.correct_elements
  end

  def test_can_return_correct_positions_number
    guess_manager = GuessManager.new('yyrb', fake_stdout)
    guess_manager.add_guess('yrbg')
    assert_equal 1, guess_manager.correct_positions
  end

  def test_can_return_both_correct_positions_and_correct_elements
    guess_manager = GuessManager.new('yyrb', fake_stdout)
    guess_manager.add_guess('yyyy')
    assert_equal 2, guess_manager.correct_positions
    assert_equal 2, guess_manager.correct_elements
  end
end
