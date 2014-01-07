require 'pp'
require_relative "Monopoly.rb"

describe Monopoly, "new app" do
 
  before do
    @stubbed_dice = double(:dice)
    @monopoly =  Monopoly.new(@stubbed_dice)
  end

  it "creates a monopoly" do
    @monopoly.player.should be_nil
  end

  it "add new player to the game" do
    @monopoly.add_player(Player.new)
    @monopoly.player.should_not be_nil
  end

  it "play turn" do
    @stubbed_dice.stub(:roll) {7}
    @monopoly.add_player Player.new
    @monopoly.play_turn

    @monopoly.player.status.should_not eq('go')
  end

    it "play turn random" do
      @stubbed_dice.stub(:roll) {7}
      @monopoly.add_player Player.new
      @monopoly.play_turn

      @monopoly.player.status.should eq('square 7')
  end
end
