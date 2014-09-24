gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_time'

class GameTimeTest < Minitest::Test
  def setup
    @game_time = GameTime.new
  end

  def test_start_time
    assert @game_time.respond_to?(:start)
  end

  def test_stop_time
    assert @game_time.respond_to?(:stop)
  end

  def test_total_time
    assert @game_time.respond_to?(:total)
  end

  def test_total_time_works
    @game_time.start
    @game_time.stop
    total = @game_time.total
    assert total.include?"seconds"
  end
end
