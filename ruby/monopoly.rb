require_relative 'dice'
require_relative 'player'

class Monopoly
  attr_reader :player

  def initialize(dice = Dice.new)
    @dice = dice
  end

  def add_player (player)
    @player = player
  end

  def play_turn 
    @player.advance(@dice.roll)  
  end

  def status
    "player status #{@player.status}"
  end

  
end

