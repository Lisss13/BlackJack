require 'test/unit'
require_relative '../src/player'

class PlayerTest < Test::Unit::TestCase

  def setup
    @player = Player.new('Ars')
  end

  def test_name
    assert_equal 'Ars', @player.name
    assert_raise('Name can`be null or empty') { Player.new }
    assert_raise('Name can`be null or empty') { Player.new(nil) }
  end

end
