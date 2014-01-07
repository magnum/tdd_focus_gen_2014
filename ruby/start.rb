require_relative 'monopoly'

monopoly = Monopoly.new
player = Player.new
monopoly.add_player player
while s = gets
  monopoly.play_turn
  print monopoly.status
end 