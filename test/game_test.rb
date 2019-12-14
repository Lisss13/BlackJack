require 'test/unit'
require_relative '../src/game'
require_relative '../src/card'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new('Ars')
    @cart_fist = Card.new(4, Card::SUITS[0])
    @cart_second = Card.new('K', Card::SUITS[0])
    @cart_third = Card.new('A', Card::SUITS[0])
    @cart_fourth = Card.new('K', Card::SUITS[0])
  end

  def test_continue
    assert_equal true, @game.game_continue?
  end

  def test_first_round
    @game.first_round
    assert_equal 2, @game.player.hand.card_list.size
    assert_equal 2, @game.dealer.hand.card_list.size
    assert_equal 90, @game.player.bank.amount
    assert_equal 90, @game.dealer.bank.amount

    many = @game.dealer.hand.score
    if many < 17
      assert_boolean true, @game.dealer_move
      assert_equal 3, @game.dealer.hand.card_list.size
    else
      assert_boolean false, @game.dealer_move
      assert_equal 2, @game.dealer.hand.card_list.size
    end

    @game.player_move
    assert_equal 3, @game.player.hand.card_list.size
  end

  def test_result_fist
    @game.player.take_cart(@cart_fist, @cart_second)
    @game.dealer.take_cart(@cart_fist, @cart_second)
    assert_equal nil, @game.result
  end

  def test_result_second
    @game.player.take_cart(@cart_fist, @cart_third)
    @game.dealer.take_cart(@cart_fist, @cart_second)
    assert_equal @game.player, @game.result
  end

  def test_result_third
    @game.dealer.take_cart(@cart_fist, @cart_third)
    @game.player.take_cart(@cart_fist, @cart_second)
    assert_equal @game.dealer, @game.result
  end

  def test_result_fourth
    @game.dealer.take_cart(@cart_fist, @cart_third)
    @game.player.take_cart(@cart_fist, @cart_second)
    @game.player.hand.add_card(@cart_fourth)
    assert_equal @game.dealer, @game.result
  end

  def test_result_fifth
    @game.player.take_cart(@cart_fist, @cart_third)
    @game.dealer.take_cart(@cart_fist, @cart_second)
    @game.dealer.hand.add_card(@cart_fourth)
    assert_equal @game.player, @game.result
  end

end
