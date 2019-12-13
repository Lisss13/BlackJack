require_relative './dealer'
require_relative './deck'

# Логика игры
class Game

  attr_reader :dealer, :player

  def initialize(player)
    @player = player
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def game_continue?
    @player.enough_bank? && @dealer.enough_bank? && @deck.enough_cards?
  end

  def round_continue?
    @player.count_cards == 3 ? false : true
  end

  def first_round
    @player.take_cart(@deck.deal_card, @deck.deal_card)
    @player.make_bet
    @dealer.take_cart(@deck.deal_card, @deck.deal_card)
    @dealer.make_bet
  end

  def dealer_move
    if @dealer.score < 17
      @dealer.add_cart(@deck.deal_card) if @player.score < 3
      true
    else
      false
    end
  end

  def player_move
    @player.add_cart(@deck.deal_card) if @player.score < 3
  end

  def result
    if @player.score == @dealer.score
      @dealer.add_chips(10)
      @player.add_chips(10)
      nil
    elsif @player.score <= 21 && @dealer.score <= 21
      if @player.score > @dealer.score
        @player.add_chips(20)
        @player
      else
        @dealer.add_chips(20)
        @dealer
      end
    elsif @player.score <= 21 && @dealer.score > 21
      @player.add_chips(20)
      @player
    elsif @player.score > 21 && @dealer.score <= 21
      @dealer.add_chips(20)
      @dealer
    end
  end

end
