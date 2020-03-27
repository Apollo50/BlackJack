# frozen_string_literal: true

class GamePlay
  include Messenger
  attr_reader :player, :dealer, :deck, :pot

  @@skip = 0
  @@turns = 0

  def initialize
    start_message
    player = create_player
    @player = Player.new(player)
    @dealer = Dealer.new
    @pot = 0
    @deck = Deck.new
    begin_game
  rescue StandardError => e
    puts e
    initialize
  end

  def play
    @@turns += 1
    change_deck if @@turns == 7
    message_lets_play
    first_round
    loop do
      message_menu_first_round
      case player_choice
      when 1
        @@skip += 1
        dealer_turn
      when 2
        player_turn
        dealer_turn
      when 3
        open_cards
        break
      else
        puts 'Choose one of options!'
      end
      if (player.cards_count == 3 || dealer.cards_count == 3) || @@skip == 1
        open_cards
        break
      end
    end
    if player.cash != 0 && dealer.cash != 0
      exit if message_play_again == 'exit'
      clear_hands
      play
    elsif player.cash.zero?
      message_game_result(dealer, player)
    else
      message_game_result(player, dealer)
    end
  end

  def first_round
    2.times { take_card(player) }
    2.times { take_card(dealer) }
    make_bet
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
    message_turn(dealer)
    take_card(dealer) if dealer.points < 17
  end

  def change_deck
    @deck = Deck.new
  end

  def player_turn
    message_turn(player)
    take_card(player)
  end

  def show_hands
    player.show_hand
    dealer.show_hide_hand
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
    message_show_round_result(player, dealer)
    if (player.fail? && dealer.fail?) || (player.points == dealer.points)
      message_nobody_won
      give_bet_back
    elsif (player.points > dealer.points) && (player.points < 22)
      message_user_won(player, dealer)
      win(player)
    else
      message_user_won(dealer, player)
      win(dealer)
    end
    message_show_balances(player, dealer)
  end
end
