require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  before (:each) do
    @joshua_tree = Park.new("Joshua Tree", 35)
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2004", "Toyota", "Tacoma")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @robin = Passenger.new({"name" => "Robin", "age" => 27})
  end

  it 'exists' do
    expect(@joshua_tree).to be_instance_of(Park)
  end

  it 'has attributes' do
    expect(@joshua_tree.name).to eq("Joshua Tree")
    expect(@joshua_tree.admission_price).to eq(35)
  end

  it 'has vehicles' do
    expect(@joshua_tree.vehicles).to eq([])

    @joshua_tree.add_vehicle(@vehicle1)

    expect(@joshua_tree.vehicles).to eq([@vehicle1])
  end

  it 'lists passengers' do
    expect(@joshua_tree.people_in_park).to eq([])

    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle1.add_passenger(@taylor)

    @joshua_tree.add_vehicle(@vehicle1)

    expect(@joshua_tree.people_in_park).to eq([@charlie, @jude, @taylor])
  end

  it 'calculates revenue generated' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle1.add_passenger(@taylor)

    @joshua_tree.add_vehicle(@vehicle1)

    expect(@joshua_tree.revenue_generated).to eq(70)

    @vehicle2.add_passenger(@robin)

    @joshua_tree.add_vehicle(@vehicle2)

    expect(@joshua_tree.revenue_generated).to eq(105)
  end
end
