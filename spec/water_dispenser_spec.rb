require_relative '../lib/water_dispenser'
require_relative '../lib/vessel'

class FakeWaterReservoir
  attr_reader :drained_by
  def drain(volume)
    @drained_by = volume
  end
end

describe 'A water dispenser' do
  let(:reservoir) { FakeWaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }

  it "has a resevoir" do
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it "despenses liquid" do
    vessel = Vessel.new('cup', 12)
    dispenser.dispense(vessel)
    expect(reservoir.drained_by).to eq(12)
  end

  it "dispenses liquid and fills vessel" do
    vessel = Vessel.new('cup', 12)
    dispenser.dispense(vessel)

    expect(reservoir.drained_by).to eq(12)
    expect(vessel).not_to be_empty
  end
end
