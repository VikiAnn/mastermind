gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/cli'
require_relative '../lib/message_printer'

class CLITest < Minitest::Test
  attr_reader :cli
  
  def setup
    fake_stdout = StringIO.new
    @cli = CLI.new(fake_stdout)
  end

  def test_has_a_command
    assert cli.respond_to?(:command)
  end

  def test_command_starts_out_empty
    assert_equal "", cli.command
  end

  def test_cli_can_start
    assert cli.respond_to?(:start)
  end

  def test_can_quit
    assert cli.respond_to?(:quit?)
  end

  def test_can_ask_for_instructions
    assert cli.respond_to?(:instructions?)
  end

  def test_can_play_game
    assert cli.respond_to?(:play?)
  end

  def test_can_check_if_game_is_won
    assert cli.respond_to?(:won?)
  end

  def test_can_check_if_game_is_lost
    assert cli.respond_to?(:lost?)
  end
end
