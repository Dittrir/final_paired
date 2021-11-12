class Passenger
  attr_reader :name, :age, :adult, :driver
  def initialize(attributes)
    @name = attributes["name"]
    @age = attributes["age"]
    @adult = false
    @driver = false
  end

  def adult?
    if @age >= 18
      @adult = true
    else
      @adult = false
    end
  end

  def drive
    @driver = true
  end

  def stop_driving
    @driver = false
  end

  def driver?
    @driver
  end
end
