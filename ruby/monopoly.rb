require_relative 'dice'
require_relative 'player'

class Monopoly
  SIZE = 40

  attr_reader :current_player
  attr_reader :players

  def initialize(dice = Dice.new)
    @players = []
    @dice = dice
  end

  def add_player (what)
    player = nil
    player = Player.new(what) if what.is_a?(String)
    player = what if what.respond_to?(:status) && what.respond_to?(:advance)
    @current_player = player if @players.empty?
    @players << player
    @players.last
  end

  def play_turn 
    status = @current_player.advance(@dice.roll)  
    current_player_index = @players.index(current_player)
    next_player_index = current_player_index < @players.length-1 ? @current_player = current_player_index+1 : 0
    @current_player = @players[next_player_index]
    status
  end

  
end

