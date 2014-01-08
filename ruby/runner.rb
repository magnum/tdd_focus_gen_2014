require 'pp'
require 'yaml'
require_relative 'monopoly'


class Runner

  attr_reader :monopoly

  def initialize
    # loading test players...
    @monopoly = Monopoly.new
    config = YAML::load(File.open('config.yml'))
    config['test']['players'].each do |p|
      @monopoly.add_player(p['name'])
      puts "#{p['name']} enters the game"
    end
    draw
  end

  def run
    # playing the game
    puts "\nPress return to play turn..."
    while s = gets
      status = monopoly.play_turn
      #system("clear")
      puts "#{status}\n"
      draw #draw the monopoly status
    end 
  end

  def draw
    #draw...
    puts "-" * Monopoly::SIZE + "|"
    @monopoly.players.each do |p|
      puts "#{' ' * p.position}[#{p.position}] #{p.name}"
    end
    puts "-" * Monopoly::SIZE + "|"

  end

end


runner = Runner.new
runner.run



