# frozen_string_literal: true

class Card
  attr_reader :value, :suit
  CARD_VALUE = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'].freeze
  CARD_SUIT = ['♢', '♣', '♡', '♠'].freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  class << self
    def card_value
      CARD_VALUE
    end

    def card_suit
      CARD_SUIT
    end
  end
end
