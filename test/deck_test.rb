require 'test/unit'
require_relative '../src/deck'

class DeckTest < Test::Unit::TestCase

  def setup
    @deck = Deck.new
    @deck_size = 52
    @amount = 380
  end

  def test_creat_deck
    assert_equal @deck_size, @deck.deck.length
  end

  def test_deal_cart
    cart = @deck.deal_card
    amount = @amount - cart.value
    current_amount = 0
    @deck.deck.each { |cart| current_amount += cart.value }
    assert_equal amount, current_amount
  end

  def test_deal_deck
    amount = @amount
    count = 0
    while @deck.enough_cards?
      count += 1
      cart = @deck.deal_card
      amount -= cart.value
      current_amount = 0
      @deck.deck.each { |cart| current_amount += cart.value }
      assert_equal amount, current_amount
    end
    assert_equal @deck_size, count
  end

end
