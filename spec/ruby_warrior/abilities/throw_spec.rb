require File.dirname(__FILE__) + '/../../spec_helper'

describe RubyWarrior::Abilities::Throw do
  before(:each) do
    @floor = RubyWarrior::Floor.new
    @floor.width = 2
    @floor.height = 3
    @warrior = RubyWarrior::Units::Warrior.new
    @floor.add(@warrior, 0, 0, :south)
    @throw = RubyWarrior::Abilities::Throw.new(@warrior)
  end
  
  it "should subtract 10 from units tow spaces away and 1 from units surrounding that space" do
    target_unit = RubyWarrior::Units::Base.new
    target_unit.health = 15
    second_unit = RubyWarrior::Units::Base.new
    second_unit.health = 15
    @floor.add(target_unit, 0, 2)
    @floor.add(second_unit, 1, 2)
    @throw.perform
    target_unit.health.should == 5
    second_unit.health.should == 14
  end
end
