require './lib/passenger'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'exists' do
    expect(@charlie).to be_instance_of(Passenger)
  end

  it 'has attributes' do
    expect(@charlie.name).to eq("Charlie")
    expect(@charlie.age).to eq(18)
  end

  it 'adult if 18 or older' do
    expect(@charlie.adult?).to eq(true)
    expect(@taylor.adult?).to eq(false)
  end
  it 'defines driver' do
    expect(@charlie.driver?).to eq(false)

    @charlie.drive

    expect(@charlie.driver?).to eq(true)
  end
end
