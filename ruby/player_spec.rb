require 'pp'
require_relative "Player.rb"


describe Monopoly, "play turn" do
  it "when play turn player move status must advance" do
    monopoly = Monopoly.new
    monopoly.play_turn
    monopoly.status.should eq("square 1") 
  end

  it "when play turn and player's position is 39, new position sould be 'go'" do 
    monopoly = Monopoly.new(39)
    monopoly.play_turn
    monopoly.status.should eq("go") 
  end
end
