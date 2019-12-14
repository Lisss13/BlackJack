require_relative './game_rules'
require_relative './bank'
require_relative './hand'

# User
class User
  attr_accessor :bank, :hand
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

end
