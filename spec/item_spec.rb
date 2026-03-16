require_relative '../lib/item'

describe 'An item of food or a beverage' do
  let(:item) { Item.new("FAKE", 10) }
  it "has a name" do
    expect(item.name).to eq('FAKE')
  end

  it "has a volume" do
    expect(item.volume).to eq(10)
  end
end
