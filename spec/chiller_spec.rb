require_relative '../lib/chiller'

require_relative '../lib/item'

describe 'A chiller' do
  let (:chiller) { Chiller.new }

  it "has initiial capacity of 100" do
    expect(chiller.capacity).to eq(100)
  end

  it "has no power at first" do
    expect(chiller.power).to eq(:off)
  end

  it "is initialy at room temperature" do
    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
  end

  it "is empty" do
    expect(chiller.contents).to be_empty
  end

  it "turns on" do
    chiller.turn_on
    expect(chiller.power).to eq(:on)
  end

  it "turns off" do
    chiller.turn_on
    chiller.turn_off
    expect(chiller.power).to eq(:off)
  end

  it "adds new item" do
    item = "apple"
    chiller.add(item)
    expect(chiller.contents).to include(item)
  end

  it "checks remaining capacity" do
    item = Item.new("apple", 10)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(90)
  end

  it "sets level" do
    chiller.set_level(3)
    expect(chiller.temperature).to eq(55)
  end
end