require 'pp'
require_relative "../player.rb"


describe Player, "play turn" do
  it "when play turn player move status must advance" do
    player = Player.new
    player.advance(1)
    player.status.should eq("square 1") 
  end

  it "when play turn and player's position is 39, new position sould be 'go'" do 
    player = Player.new(39)
    player.advance(1)
    player.status.should eq("go") 
  end

  it "goto take the player to the new position" do
    player = Player.new(6)
    player.advance(5)
    player.status.should eq("square 11")
  end

end
