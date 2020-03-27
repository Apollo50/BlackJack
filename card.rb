# frozen_string_literal: true

class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end
