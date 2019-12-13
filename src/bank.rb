require_relative './game_rules'

class Bank

  attr_reader :amount

  def initialize
    @amount = GameRules::INITIAL_BANK
  end

  # сделать ставку
  def make_bet
    @amount -= 10
  end

  # добавить монеты в банк
  def add_chips(count)
    @amount += count
  end

  # достаточно ли денег для продолжении игры
  def enough_bank?
    @amount >= 10
  end
end