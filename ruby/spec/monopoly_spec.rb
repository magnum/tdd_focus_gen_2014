require 'yaml'
require 'pp'
require_relative "../monopoly.rb"

describe Monopoly, "new app" do
 
  before do
    @test_players = YAML::load(File.open('config.yml'))['test']['players'].shuffle
    @players = []
    @test_players.each_with_index do |p, index| 
        @players << instance_variable_set("@player#{index+1}", Player.new(p['name']))
    end
    @monopoly =  Monopoly.new(Dice.new)
  end

  it "creates a monopoly" do
    @monopoly.current_player.should be_nil
  end

  it "add new player to the game passing the string of the name" do
    name = @test_players.first['name']
    @monopoly.add_player name
    @monopoly.current_player.name.should  eq(name)
  end

  it "add new player to the game passing a string" do
    @monopoly.add_player(@player1)
    @monopoly.current_player.should  eq(@player1)
  end

  it "add 4 players to the game" do
    @players.each { |p| @monopoly.add_player(p) }
    @monopoly.players.length.should eq(4)
  end  


  it "play turn random" do
    dice_result = 5
    dice = double(dice)
    dice.stub(:roll) {dice_result}
    monopoly = Monopoly.new dice
    monopoly.add_player @player1
    status = monopoly.play_turn
    status.should eq("#{@player1.name} advances #{dice_result} and lands on square #{dice_result}")
  end


  # move

  it "add n players to the game and the current_player must be the 1st added" do
    @players.each { |p| @monopoly.add_player(p) }
    @monopoly.current_player.should eq(@players.first)
  end  

  it "added n players to the game, after the 1st play_turn, the current_player is the 2nd player" do
    @players.each { |p| @monopoly.add_player(p) }
    @monopoly.play_turn
    @monopoly.current_player.should eq(@players[1])
  end  


  it "added n players to the game, after all players have played 1 time, the current_player is the 1st player again" do
    @players.each { |p| @monopoly.add_player(p) }
    @players.length.times { @monopoly.play_turn }
    @monopoly.current_player.should eq(@players.first)
  end  


end
