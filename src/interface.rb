require_relative './player'
require_relative './game'

# Интерфейс игры
class Interface

  def initialize
    create_game
  end

  def create_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      puts 'Enter your name: '
      @game = Game.new(gets.chomp)
      start_game
    else
      puts 'You finished playing Black Jack'
    end
  end

  def start_game
    while @game.game_continue?
      puts '------------------------------------------------'
      puts 'Start new round'
      puts '------------------------------------------------'
      @game.first_round
      show_state(show_dealer: false)
      show_menu
      player_move
    end
    create_game
  end

  def player_move
    player_choice = gets.chomp.to_i
    case player_choice
    when 1
      dealer_move(@game.dealer_move)
      continue
    when 2
      @game.player_move
      puts '=================================='
      puts 'You take a card'
      dealer_move(@game.dealer_move)
      continue
    when 3
      show_state(show_dealer: true)
      show_winner(@game.result)
    end
  end

  # Продолжение игры
  def continue
    if @game.round_continue?
      show_menu
      player_move
    else
      show_state(show_dealer: true)
      show_winner(@game.result)
    end
  end

  # Показывает пошел ли диллер или нет
  def dealer_move(take_cart)
    puts '=================================='
    if take_cart
      puts 'Dealer take card'
    else
      puts 'Dealer skip'
    end
  end

  # состаяние игры
  def show_state(settings)
    puts '=================================='
    puts "Bank Player = #{@game.player.bank.amount} | Bank Dealer = #{@game.dealer.bank.amount}"
    if settings[:show_dealer]
      puts "Dealer card = #{@game.dealer.hand.card_list.map(&:sign).join(' ')} count = #{@game.dealer.hand.score}"
    else
      puts 'Dealer card = * *'
    end
    puts "Player card = #{@game.player.hand.card_list.map(&:sign).join(' ')} count = #{@game.player.hand.score}"
    puts '=================================='
  end

  def show_menu
    puts '=================================='
    puts 'make a choice'
    puts '1 - skip'
    puts '2 - add card'
    puts '3 - open cards'
    puts '=================================='
  end

  def show_winner(user)
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    if user.nil?
      puts 'Draw'
    else
      puts "Winner is #{user.name}"
    end
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end
end
