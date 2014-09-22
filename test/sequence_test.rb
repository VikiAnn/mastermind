gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence'

class TestSequenceGenerator < Minitest::Test
  def test_secret_has_four_characters
    sequence = Sequence.new
    assert sequence.secret.length == 4
  end

  def test_sequence_contains_letters
    sequence = Sequence.new
    assert sequence.secret[/[a-zA-Z]+/] == sequence.secret
  end
end
