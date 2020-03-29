# frozen_string_literal: true

class User
  attr_reader :points, :cash, :name, :hand
  include Validation

  def initialize(name)
    @name = name.to_s
    validation!
    @cash = 100
    @hand = []
    @points = 0
  end

  def make_bet
    @cash -= 10 unless @cash.zero?
  end

  def replace_bet
    @cash += 10
  end

  def get_win
    @cash += 20
  end

  def take_card(card)
    @hand << card unless @hand.length == 3
  end

  def cards_count
    @hand.length
  end

  def clear_hand
    @hand.clear
    @points = 0
  end

  def fail?
    @points > 21
  end

  def count_points
    first_count
    second_count if @current_points > 21 && @aces >= 1
    @points = @current_points
  end

  protected

  def validation!
    raise 'Enter correct name! Your current name is empty!' if @name.empty?
  end

  def first_count
    @current_points = 0
    @aces = 0
    @hand.each do |card|
      if card.value == 'A' && @aces.zero?
        @current_points += 11
        @aces += 1
      elsif card.value == 'A' && @aces != 0
        @current_points += 1
      end
      @current_points += 10 if 'JQK'.include? card.value.to_s
      @current_points += card.value unless 'AJQK'.include? card.value.to_s
    end
  end

  def second_count
    @current_points = 0
    @hand.each do |card|
      @current_points += 1 if card.value == 'A'
      @current_points += 10 if 'JQK'.include? card.value.to_s
      @current_points += card.value unless 'AJQK'.include? card.value.to_s
    end
  end
end
