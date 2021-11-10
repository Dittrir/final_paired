class Vehicle
  attr_reader :year, :make, :model, :speeding, :passengers
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
  end

  def speed
    @speeding = true
  end

  def speeding?
    @speeding
  end

  def add_passenger(passenger_arg)
    @passengers << passenger_arg
  end

  def num_adults
    adult_count = 0
    @passengers.each do |passenger|
      if passenger.adult? == true
        adult_count += 1
      end
    end
    adult_count
  end
end
