require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A refrigerator' do
  let(:chiller) { Chiller.new }
  let(:freezer) { Freezer.new }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }

  let(:refrigerator) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it "has chiller" do
    expect(refrigerator.chiller).to eq(chiller)
  end

  it "has freezer" do
    expect(refrigerator.freezer).to eq(freezer)
  end

  it "has water dispenser" do
    expect(refrigerator.water_dispenser).to eq(dispenser)
  end

  it "has water reservoir" do
    expect(refrigerator.water_reservoir).to eq(reservoir)
  end

  it "has no power at first" do 
    expect(refrigerator.power).to eq(:off)
  end

  it "adds item to chiller" do
    item = Item.new("apple", 10)
    refrigerator.chill(item)
    expect(chiller.contents).to include(item)
  end

  it "adds item to freezer" do
    item = Item.new("apple", 10)
    refrigerator.freeze(item)
    expect(freezer.contents).to include(item)
  end

  it "checks total capacity" do
    expect(refrigerator.total_capacity).to eq(200)
  end

  it "checks remaining capacity" do
    item1 = Item.new("apple", 10)
    item2 = Item.new("pizza", 30)
    refrigerator.chill(item1)
    refrigerator.freeze(item2)
    expect(refrigerator.remaining_capacity).to eq(160)
  end

  it "plugs in" do
    refrigerator.plug_in
    expect(refrigerator.power).to eq(:on)
    expect(chiller.power).to eq(:on)
    expect(freezer.power).to eq(:on)
  end

  it "unplugs" do
    refrigerator.unplug
    expect(refrigerator.power).to eq(:off)
    expect(chiller.power).to eq(:off)
    expect(freezer.power).to eq(:off)
  end

  it "sets chillers level" do
    refrigerator.set_chiller_level(3)
    expect(chiller.temperature).to eq(55)
  end

  it "sets freezer level" do
    refrigerator.set_freezer_level(3)
    expect(freezer.temperature).to eq(40)
  end

  it "displays info" do
    item1 = Item.new("apple", 10)
    item2 = Item.new("pizza", 30)
    refrigerator.chill(item1)
    refrigerator.freeze(item2)
    refrigerator.plug_in
    reservoir.fill

    expect(refrigerator.to_s).to include("Power: on")
    expect(refrigerator.to_s).to include("Storage: 160 of 200 available")
    expect(refrigerator.to_s).to include("Temps: Chiller is 70, Freezer is 70")
    expect(refrigerator.to_s).to include("Water: Reservoir has 10 remaining.")
  end
end