require_relative './game_rules'
require_relative './bank'
require_relative './hand'

# User
class User
  attr_reader :name

  def initialize(name)
    @name = name
    @bank = Bank.new
  end

  def enough_bank?
    @bank.enough_bank?
  end

  # Взять карту
  def take_cart(first_card, second_card)
    @hand = Hand.new(first_card, second_card)
  end

  # Дать карту пользователю
  def add_cart(card)
    @hand.add_card(card)
  end

  # Получить карту у пользователя
  def get_cards
    @hand.card_list
  end

  # Колличество карт
  def count_cards
    @hand.card_list.count
  end

  # Сумма карт
  def score
    @hand.score
  end

  # Колличество очкой у пользователя
  def money_amount
    @bank.amount
  end

  # Сделать ставку
  def make_bet
    @bank.make_bet
  end

  # добавить манеты
  def add_chips(count)
    @bank.add_chips(count)
  end

end
