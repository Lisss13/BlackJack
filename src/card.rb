# Карта
class Card
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  SIGNS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  VALUES = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }.freeze
  SIGN_FORMAT = /^([2-9]|10|[JQKA])([♠♥♣♦]|<>)$/

  attr_reader :value, :sign

  def initialize(sign, suit)
    @sign = sign.to_s + suit
    @value = VALUES[sign] || sign
    validate!
  end

  private

  def validate!
    raise 'Wrong format for card sign' if sign !~ SIGN_FORMAT
  end
end
