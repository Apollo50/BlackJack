# frozen_string_literal: true

class GamePlay
  attr_reader :player, :dealer, :deck, :pot, :interface

  @@skip = 0
  @@turns = 0

  def initialize
    @interface = Interface.new
    interface.start_message
    player = interface.create_player
    @player = User.new(player)
    @dealer = User.new('Dealer')
    @pot = 0
    @deck = Deck.new
  rescue StandardError => e
    puts e
    initialize
  end

  def play
    @@turns += 1
    change_deck if @@turns == 7
    interface.message_lets_play
    first_round
    loop do
      interface.message_menu_first_round
      case interface.player_choice
      when 1
        @@skip += 1
        dealer_turn
      when 2
        player_turn
        dealer_turn
      when 3
        open_cards
        break
      end
      if (player.cards_count == 3 || dealer.cards_count == 3) || @@skip == 1
        open_cards
        break
      end
    end
    if player.cash != 0 && dealer.cash != 0
      exit if interface.message_play_again == 'exit'
      clear_hands
      play
    elsif player.cash.zero?
      interface.message_game_result(dealer, player)
    else
      interface.message_game_result(player, dealer)
    end
  end

  protected

  def first_round
    2.times { take_card(player) }
    2.times { take_card(dealer) }
    make_bet
    count_points
    show_hands
  end

  def make_bet
    player.make_bet
    dealer.make_bet
    @pot += 20
  end

  def give_bet_back
    player.replace_bet
    dealer.replace_bet
    @pot = 0
  end

  def take_card(user)
    user.take_card(deck.get_card)
  end

  def dealer_turn
    interface.message_turn(dealer)
    take_card(dealer) if dealer.points < 17
  end

  def change_deck
    @deck = Deck.new
    @@turns = 0
  end

  def player_turn
    interface.message_turn(player)
    take_card(player)
  end

  def show_hands
    interface.message_show_hand(player)
    interface.message_show_hide_hand(dealer)
  end

  def count_points
    player.count_points
    dealer.count_points
  end

  def clear_hands
    player.clear_hand
    dealer.clear_hand
    @@skip = 0
  end

  def win(winner)
    winner.get_win
    @pot = 0
  end

  def open_cards
    count_points
    interface.message_show_round_result(player, dealer)
    if (player.fail? && dealer.fail?) || (player.points == dealer.points)
      interface.message_nobody_won
      give_bet_back
    elsif ((player.points > dealer.points) && player.points < 22) || (dealer.fail? && player.points < 22)
      interface.message_user_won(player, dealer)
      win(player)
    else
      interface.message_user_won(dealer, player)
      win(dealer)
    end
    interface.message_show_balances(player, dealer)
  end
end
