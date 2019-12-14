
# раунд игры
class Hand
  attr_reader :card_list

  def initialize(firs_card, second_card)
    @card_list = []
    @card_list << firs_card
    @card_list << second_card
  end

  def add_card(card)
    @card_list << card
  end

  def number_cards
    @card_list.size
  end

  def score
    sum = 0
    @card_list.each { |card| sum += card.value }
    if sum > 21
      sum = 0
      @card_list.each { |card| sum += card.value == 11 ? 1 : card.value }
    end
    sum
  end

end
