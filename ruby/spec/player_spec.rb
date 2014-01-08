require 'pp'
require_relative "../monopoly.rb"


describe Player, "play turn" do

  before do 
    @player_name = "Mr. Black"
  end

  it "when player is created must be on 'go' position" do
    player = Player.new(@player_name)
    player.status.should eq('go') 
  end

  it "when play turn and player's position is the last (#{Monopoly::SIZE}), new position sould be 'go'" do 
    player = Player.new(@player_name, Monopoly::SIZE-1)
    player.advance(1)
    player.status.should eq("go") 
  end

  it "goto take the player to the new position" do
    player = Player.new(@player_name ,6)
    player.advance(5)
    player.status.should eq("square 11")
  end

end
