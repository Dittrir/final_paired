class Park
  attr_reader :name, :admission_price, :vehicles
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle_info)
    @vehicles << vehicle_info
  end

  def people_in_park
    # park_visitors = []
    # @vehicles.each do |vehicle|
    #   vehicle.passengers.map do |passenger|
    #     park_visitors << passenger
    #   end
    # end
    # park_visitors
    @vehicles.map do |vehicle|
      vehicle.passengers
    end.flatten
  end

  def revenue_generated
    num_visitors = 0
    @vehicles.map do |vehicle|
      vehicle.passengers.map do |passenger|
        if passenger.adult? == true
          num_visitors += 1
        end
      end
    end
    total_revenue = num_visitors * admission_price
  end
end
