require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  let (:freezer) { Freezer.new }

  it "has initiial capacity of 100" do
    expect(freezer.capacity).to eq(100)
  end

  it "has no power at first" do
    expect(freezer.power).to eq(:off)
  end

  it "is initialy at room temperature" do
    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
  end

  it "is empty" do
    expect(freezer.contents).to be_empty
  end

  it "turns on" do
    freezer.turn_on
    expect(freezer.power).to eq(:on)
  end

  it "turns off" do
    freezer.turn_on
    freezer.turn_off
    expect(freezer.power).to eq(:off)
  end

  it "adds new item" do
    item = "apple"
    freezer.add(item)
    expect(freezer.contents).to include(item)
  end

  it "checks remaining capacity" do
    item = Item.new("apple", 10)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(90)
  end

  it "sets level" do
    freezer.set_level(3)
    expect(freezer.temperature).to eq(40)
  end
end
