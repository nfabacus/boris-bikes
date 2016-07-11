require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity= capacity
  end

  def dropoff_bike(location = nil)
    broken_bikes = @bikes.select {|bike| bike.broken?}
    working_bikes = @bikes.select {|bike| !bike.broken?}
    if location == "garage"
      if !broken_bikes.empty?
        @bikes = working_bikes
        puts "Broken bikes being dropped off at #{location}: #{broken_bikes}"
        return broken_bikes
      else
        puts "No broken bikes to drop off."
      end

    elsif location == "docking station"
      if !working_bikes.empty?
        @bikes = broken_bikes
        puts "Working bikes being dropped off at #{location}: #{working_bikes}"
        return working_bikes
      else
        puts "No working bikes to drop off."
      end
    else
      puts "You can drop off bikes only at either garage or docking station. You know!"
    end
  end

  def take_bike(bike, location = nil)
    full? #Check if the van is full

    if location == "docking station"
      if bike.broken?
        puts "Bike is broken. collected in the van at #{location}."
        @bikes << bike
      else
        puts "Bike is in working order. not collected in the van at #{location}"
      end

    elsif location == "garage"
      if !bike.broken?
        puts "Bike is in working order. collected in the van at #{location}."
        @bikes << bike
      else
        puts "Bike is still broken. Not collected in the van at #{location}."
      end
    end

  end

  private

  def full?
    fail 'Van full' if @bikes.count >= @capacity

  end

end
