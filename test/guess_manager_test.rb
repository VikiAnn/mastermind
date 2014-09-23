gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_manager'
require_relative '../lib/message_printer'

class GuessManagerTest < Minitest::Test
  def test_can_receive_guesses
    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yyyy')
    guess_manager.guess('yrbg')
    assert_equal ['yyyy', 'yrbg'], guess_manager.guesses
  end

  def test_keeps_count_of_guesses
    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yyrg')
    guess_manager.guess('byrg')
    assert_equal 2, guess_manager.count
  end

  def test_has_max_of_10_guesses
    guess_manager = GuessManager.new('yrbg')

    assert_equal 10, guess_manager.max_guesses
  end

  def test_can_identify_a_correct_guess
    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yrbg')
    assert_equal "You've guessed the correct sequence!", guess_manager.printer.current_message
  end

  def test_can_take_guess_and_return_response
    guess_manager = GuessManager.new('yyrb')
    guess_manager.guess('rrbg')
    assert_equal"You guessed 2 correct colors with 0 in the correct position. \nYou've made 1 guesses.", guess_manager.printer.current_message
  end

  def test_another_guess
    guess_manager = GuessManager.new('yyrb')
    guess_manager.guess('yrbg')
    assert_equal"You guessed 3 correct colors with 1 in the correct position. \nYou've made 1 guesses.", guess_manager.printer.current_message

  end

  def test_yet_another_guess
    guess_manager = GuessManager.new('yyrb')
    guess_manager.guess('yyyy')
    assert_equal"You guessed 2 correct colors with 2 in the correct position. \nYou've made 1 guesses.", guess_manager.printer.current_message
  end
end
