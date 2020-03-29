# frozen_string_literal: true

class Deck
  attr_reader :deck
  CARD_VALUE = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'].freeze
  CARD_SUIT = ['♢', '♣', '♡', '♠'].freeze

  def initialize
    @deck = []
    create_deck
    @deck.shuffle!
  end

  def create_deck
    CARD_VALUE.each do |value|
      CARD_SUIT.each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def get_card
    @deck.shuffle!
    card = @deck[0]
    @deck.delete_at(0)
    card
  end
end
