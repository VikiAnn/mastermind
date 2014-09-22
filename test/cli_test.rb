gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

class CLITest < Minitest::Test
  def test_has_a_command
    cli = CLI.new
    assert cli.respond_to?(:command)
  end

  def test_cli_can_start
    cli = CLI.new
    assert cli.respond_to?()

end
