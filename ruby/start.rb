require 'pp'
require 'yaml'
require_relative 'monopoly'

# loading test players...
monopoly = Monopoly.new
config = YAML::load(File.open('config.yml'))
config['test']['players'].each do |p|
  monopoly.add_player(p['name'])
  puts "#{p['name']} enters the game"
end

# playing the game
puts "\nPress return to play turn..."
while s = gets
  status = monopoly.play_turn
  puts "#{status}\n"
  #map
  puts "-" * Monopoly::SIZE + "|"
  monopoly.players.each do |p|
    puts "#{' ' * p.position}[#{p.position}] #{p.name}"
  end
  puts "-" * Monopoly::SIZE + "|"
end 