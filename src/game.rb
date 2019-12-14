require_relative './dealer'
require_relative './deck'
require_relative './player'

# Логика игры
class Game

  attr_reader :dealer, :player

  def initialize(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def game_continue?
    @player.bank.enough_bank? && @dealer.bank.enough_bank? && @deck.enough_cards?
  end

  def round_continue?
    @player.hand.number_cards == 3 ? false : true
  end

  def first_round
    @player.take_cart(@deck.deal_card, @deck.deal_card)
    @player.bank.make_bet
    @dealer.take_cart(@deck.deal_card, @deck.deal_card)
    @dealer.bank.make_bet
  end

  def dealer_move
    if @dealer.hand.score < 17
      @dealer.hand.add_card(@deck.deal_card)
      true
    else
      false
    end
  end

  def player_move
    @player.hand.add_card(@deck.deal_card)
  end

  def result
    if @player.hand.score == @dealer.hand.score
      @dealer.bank.add_chips(10)
      @player.bank.add_chips(10)
      nil
    elsif @player.hand.score <= 21 && @dealer.hand.score <= 21
      if @player.hand.score > @dealer.hand.score
        @player.bank.add_chips(20)
        @player
      else
        @dealer.bank.add_chips(20)
        @dealer
      end
    elsif @player.hand.score <= 21 && @dealer.hand.score > 21
      @player.bank.add_chips(20)
      @player
    elsif @player.hand.score > 21 && @dealer.hand.score <= 21
      @dealer.bank.add_chips(20)
      @dealer
    end
  end

end
