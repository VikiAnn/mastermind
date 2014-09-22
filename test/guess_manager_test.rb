gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_manager'

class GuessManagerTest < Minitest::Test
  def test_can_receive_guess

    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yrbg')
    assert_equal 'yrbg', guess_manager.guesses[0]
  end

  def test_keeps_count_of_guesses

    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yyrg')
    guess_manager.guess('byrg')
    assert_equal 2, guess_manager.count
  end

  def test_has_max_of_8_guesses

    guess_manager = GuessManager.new('yrbg')
    guess_manager.guess('yyyy')
    guess_manager.guess('bbbb')
    guess_manager.guess('gggg')
    guess_manager.guess('rrrr')
    guess_manager.guess('yybb')
    guess_manager.guess('byrg')
    guess_manager.guess('brgy')
    guess_manager.guess('rbyg')

    assert_equal "Sorry, you've run out of guesses", guess_manager.guess('yrbg')
  end

  def test_can_identify_a_correct_guess

    guess_manager = GuessManager.new('yrbg')
    assert_equal "You've guessed the correct sequence!", guess_manager.guess('yrbg')
  end

  def test_can_take_guess_and_return_response
    guess_manager = GuessManager.new('yyrb')
    guess = 'rrbg'
    assert_equal [2, 0], guess_manager.guess(guess)
  end

  def test_another_guess
    guess_manager = GuessManager.new('yyrb')
    guess = 'yrbg'
    assert_equal [3, 1], guess_manager.guess(guess)
  end

  def test_yet_another_guess
    guess_manager = GuessManager.new('yyrb')
    guess = 'yyyy'
    assert_equal [2, 2], guess_manager.guess(guess)
  end
end
