require 'test/unit'
require_relative '../src/dealer'

class DealerTest < Test::Unit::TestCase

  def setup
    @dealer = Dealer.new
  end

  def test_name
    assert_equal 'Dealer', @dealer.name
  end

end
