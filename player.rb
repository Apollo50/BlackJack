# frozen_string_literal: true

class Player < User
  def show_hand
    print 'Your hand: '
    @hand.each do |card|
      print card.value
      print card.suit
      print ' '
    end
    count_points
    puts ''
    puts "Your total points: #{@points}"
    puts ''
  end
end
