require 'test/unit'
require_relative '../src/bank'

class BankTest < Test::Unit::TestCase

  def setup
    @bank = Bank.new
  end

  def test_mount
    @bank.make_bet
    assert_equal 90, @bank.amount
  end

  def test_enough
    assert_equal true, @bank.enough_bank?
    10.times { @bank.make_bet }
    assert_equal false, @bank.enough_bank?
  end
end
