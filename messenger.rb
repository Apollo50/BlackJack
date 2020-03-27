# frozen_string_literal: true

module Messenger
  def start_message
    puts 'Glad to welcome you in our RubyCasino.'
  end

  def create_player
    puts 'Please, enter your name!'
    print '=>'
    gets.chomp
  end

  def begin_game
    puts "The rules: You have to dial a points as soon as close to 21.
           If you've got more than 21 points in the and of game, you get lose.
           Good luck!"
  end

  def message_lets_play
    puts '~~~~~~~~~~~'
    puts "Let's play!"
    puts '~~~~~~~~~~~'
  end

  def message_menu_first_round
    puts 'Make a choice!
          1 - Skip
          2 - Take a card
          3 - Open cards'
  end

  def player_choice
    gets.to_i
  end

  def message_turn(user)
    puts "#{user.name}'s turn:...."
    sleep 2
  end

  def message_user_won(winner, loser)
    puts '~~~~~~~~~~~~~~~~~~~~~~'
    puts "#{winner.name} - WIN!"
    puts "#{loser.name} - LOSE!"
    puts '~~~~~~~~~~~~~~~~~~~~~~'
  end

  def message_nobody_won
    puts '~~~~~~~~~~~~~~~~~~'
    puts '    No one won!'
    puts '~~~~~~~~~~~~~~~~~~'
  end

  def message_show_balances(player, dealer)
    puts "Your balance is #{player.cash} $."
    puts "Dealer's balance is #{dealer.cash} $."
  end

  def message_game_result(winner, loser)
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts "#{winner.name} - WINNER!"
    puts "#{loser.name} - LOSER!"
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  end

  def message_play_again
    puts "Press 'Enter' to continue!"
    puts "Enter 'exit' to finish the game!"
    gets.chomp
  end

  def message_show_round_result(player, dealer)
    puts '~~~~~~~~~~~~~~~~~~~~~'
    puts 'ROUND RESULT:'
    player.show_hand
    dealer.show_hand
  end
end
