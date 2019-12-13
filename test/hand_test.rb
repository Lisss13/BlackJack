require 'test/unit'
require_relative '../src/hand'
require_relative '../src/card'

class HandTest < Test::Unit::TestCase

  def setup
    @cart_fist = Card.new(4, Card::SUITS[0])
    @cart_second = Card.new('K', Card::SUITS[0])
    @cart_third = Card.new('A', Card::SUITS[0])
    @cart_fourth = Card.new('K', Card::SUITS[0])
  end

  def test_score
    hand = Hand.new(@cart_fist, @cart_second)
    assert_equal 14, hand.score
    hand = Hand.new(@cart_third, @cart_second)
    assert_equal 21, hand.score
    hand.add_card(@cart_fist)
    assert_equal 15, hand.score
    hand.add_card(@cart_fourth)
    assert_equal 25, hand.score
  end

end
