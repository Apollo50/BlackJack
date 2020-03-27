# frozen_string_literal: true

require_relative './card.rb'
require_relative './deck.rb'
require_relative './validation.rb'
require_relative './user.rb'
require_relative './player.rb'
require_relative './dealer.rb'
require_relative './messenger.rb'
require_relative './gameplay.rb'

game = GamePlay.new
game.play
