require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) { WaterReservoir.new }

  it "has a capacity" do
    expect(reservoir.capacity).to eq(10)
  end

  it "starts empty" do
    expect(reservoir.current_water_volume).to eq(0)
  end

  it "is empty to start" do
    expect(reservoir).to be_empty
  end

  it "is not empty after fill" do
    reservoir.fill
    expect(reservoir).to_not be_empty
  end

  it "is empty after drain" do
    reservoir.fill
    reservoir.drain(reservoir.capacity)
    expect(reservoir).to be_empty
  end
    
  it "does not go below zero when over-drained" do
    reservoir.fill
    reservoir.drain(reservoir.capacity + 50)
    expect(reservoir.current_water_volume).to eq(0)
    expect(reservoir).to be_empty
  end

end
