require 'pp'
require_relative "../monopoly.rb"


describe Player, "play turn" do

  before do 
    @player_name = "Mr. Black"
  end

  it "when player is created must be on 'go' status" do
    player = Player.new(@player_name)
    player.status.should eq('go') 
  end

  it "when play turn and player's position is the last (#{Monopoly::SIZE}), new status sould be 'go'" do 
    player = Player.new(@player_name, Monopoly::SIZE-1)
    player.advance(1)
    player.status.should eq("go") 
  end

  it "advance take the player to the new position" do
    player = Player.new(@player_name ,6)
    player.advance(5)
    player.position.should eq(11)
  end

  it "when not in go position, player status must be rendered as 'square [position]'" do
    100.times do
      player = Player.new(@player_name,1)
      positions = 1+rand(Monopoly::SIZE-2)
      player.advance(positions)
      #puts "#{positions} = #{player.status}"
      player.status.should eq("square #{positions+1}")  
    end
  end

end
