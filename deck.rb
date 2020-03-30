# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create_deck
    @cards.shuffle!
  end

  def create_deck
    Card.card_value.each do |value|
      Card.card_suit.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end

  def get_card
    @cards.shuffle!
    card = @cards[0]
    @cards.delete_at(0)
    card
  end
end
