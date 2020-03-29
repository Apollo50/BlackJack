# frozen_string_literal: true

require_relative './card.rb'
require_relative './deck.rb'
require_relative './validation.rb'
require_relative './user.rb'
require_relative './interface.rb'
require_relative './gameplay.rb'

game = GamePlay.new
game.play
