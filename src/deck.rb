require_relative './card'

# Колода
class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  # Создание колоды
  def create_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::SIGNS.each { |sign| deck << Card.new(sign, suit) }
    end
    deck.shuffle
  end

  # Карта из колоды
  def deal_card
    deck.pop
  end

  # Есть ли карта
  def enough_cards?
    deck.any?
  end
end
