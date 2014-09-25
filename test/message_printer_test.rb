gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/message_printer'

class MessagePrinterTest < Minitest::Test
  attr_reader :printer

  def setup
    fake_stdout = StringIO.new
    @printer = MessagePrinter.new(fake_stdout)
  end

  def test_welcome
    printer.welcome
    assert printer.current_message.include? "Welcome"
  end

  def test_initial_options
    printer.initial_options
    assert printer.current_message.include? "(p)lay, read the (i)nstructions, or (q)uit"
  end

  def test_start_game_message
    printer.start_game_message
    assert printer.current_message.include? "Starting a game"
  end

  def test_guess_prompt
    printer.guess_prompt
    assert printer.current_message.include? "Enter"
  end

  def test_at_max_guesses
    printer.at_max_guesses
    assert printer.current_message.include? "Sorry, you've run out"
  end

  def test_correct_guess
    printer.correct_guess
    assert printer.current_message.include? "You've guessed the correct"
  end
end
