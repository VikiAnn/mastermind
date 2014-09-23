gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require_relative '../lib/message_printer'

class CLITest < Minitest::Test
  def test_has_a_command
    cli = CLI.new
    assert cli.respond_to?(:command)
  end

  def test_command_starts_out_empty
    cli = CLI.new
    assert_equal "", cli.command
  end

  def test_cli_can_start
    cli = CLI.new
    assert cli.respond_to?(:start)
  end

  def test_can_quit
    cli = CLI.new
    assert cli.respond_to?(:quit?)
  end

  def test_can_ask_for_instructions
    cli = CLI.new
    assert cli.respond_to?(:instructions?)
  end

  def test_can_play_game
    cli = CLI.new
    assert cli.respond_to?(:play?)
  end

  def test_can_check_if_game_is_won
    cli = CLI.new
    assert cli.respond_to?(:won?)
  end

  def test_can_check_if_game_is_lost
    cli = CLI.new
    assert cli.respond_to?(:lost?)
  end
end
