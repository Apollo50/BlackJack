# frozen_string_literal: true

class Dealer < User
  def initialize(name = 'Dealer')
    super(name)
  end

  def show_hide_hand
    print "Dealer's hand:"
    @hand.length.times do
      print ' * '
    end
    count_points
    2.times { puts '' }
  end

  def show_hand
    print 'Dealer hand: '
    @hand.each do |card|
      print card.value
      print card.suit
      print ' '
    end
    count_points
    puts ''
    puts "Dealer's total points: #{@points}"
  end
end
