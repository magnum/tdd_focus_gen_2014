require 'pp'
require_relative "../monopoly.rb"

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
    @stubbed_dice.stub(:roll) {5}
    @monopoly.add_player Player.new
    @monopoly.play_turn

    @monopoly.player.status.should_not eq('go')
  end

  it "play turn random" do
    @stubbed_dice.stub(:roll) {5}
    @monopoly.add_player Player.new
    @monopoly.play_turn

    @monopoly.player.status.should eq('square 5')
  end

  it 'return status of the game' do
    @stubbed_dice.stub(:roll) {5}
    @monopoly.add_player Player.new
    @monopoly.play_turn
    @monopoly.status.should =~ /square \d{1,2}/
  end

end
