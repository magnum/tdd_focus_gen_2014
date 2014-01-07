require 'pp'
require_relative "../dice.rb"

describe Dice, "new app" do
 
  before do
    @dice = Dice.new
  end

  it "rolls the dice" do
    @dice.roll.should_not be_nil
  end

  it "dice is rolled result shoul be between 1 and 6" do
    (1..6).should include(@dice.roll)
  end

  

end
