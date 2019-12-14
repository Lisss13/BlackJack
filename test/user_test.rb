require 'test/unit'
require_relative '../src/card'
require_relative '../src/user'

class UserTest < Test::Unit::TestCase

  def setup
    @user = User.new('Arseniy')
    @cart_fist = Card.new(4, Card::SUITS[0])
    @cart_second = Card.new('K', Card::SUITS[0])
    @cart_third = Card.new('A', Card::SUITS[0])
    @cart_fourth = Card.new('K', Card::SUITS[0])
  end

  def test_name
    assert_equal'Arseniy', @user.name
  end

  def test_bank
    assert_equal true, @user.bank.enough_bank?
    assert_equal 100, @user.bank.amount
    @user.bank.make_bet
    assert_equal 90, @user.bank.amount
    @user.bank.make_bet
    assert_equal 80, @user.bank.amount

    @user.bank.add_chips(20)
    assert_equal 100, @user.bank.amount
  end

  def test_hand
    @user.take_cart(@cart_fist, @cart_second)
    assert_equal [@cart_fist, @cart_second], @user.hand.card_list
    assert_equal 14, @user.hand.score
    @user.hand.add_card(@cart_third)
    assert_equal [@cart_fist, @cart_second, @cart_third], @user.hand.card_list
    assert_equal 15, @user.hand.score
  end

end
