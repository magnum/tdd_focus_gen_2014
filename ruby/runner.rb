require 'pp'
require 'yaml'
require_relative 'monopoly'


class Runner

  @debug = false
  attr_reader :monopoly

  def initialize
    @debug = true if ARGV && ARGV.index('debug')
    puts ARGV
    @turns = 0
    # loading test players...
    @monopoly = Monopoly.new
    config = YAML::load(File.open('config.yml'))
    config['test']['players'].shuffle.each do |p|
      @monopoly.add_player(p['name'])
      puts "#{p['name']} enters the game"
    end
    draw
  end

  def run
    # playing the game
    puts "\nPress return to play turn..."
    while s = STDIN.gets
      @turns += 1
      if @debug
        system("clear") #if @turns > 1 && (@turns % 2 == 0)
        puts "BEFORE" 
        draw
        status = monopoly.play_turn
        puts "THEN #{status}, SO... \n"
        draw #draw the monopoly status
      else 
        puts monopoly.play_turn
        draw
      end
    end 
  end

  def draw
    #draw...
    puts "-" * Monopoly::SIZE + "|"
    @monopoly.players.each do |p|
      puts "#{' ' * p.position}[#{p.status}] #{p.name}"
    end
    puts "-" * Monopoly::SIZE + "|"

  end

end


runner = Runner.new
runner.run



