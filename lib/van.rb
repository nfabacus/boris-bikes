require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity= capacity
  end

  def dropoff_bike
    broken_bikes = @bikes.select {|bike| bike.broken?}
    working_bikes = @bikes.select {|bike| !bike.broken?}
    @bikes = working_bikes
    puts "Broken Bikes being dropped off: #{broken_bikes}"
    broken_bikes
  end

  def release_bike
    for i in 0..@bikes.count-1
      if !@bikes[i].broken?
        released_bike = @bikes[i]
        @bikes.delete_at(i)
        return released_bike
      end
    end
    fail 'No bikes available'
  end

  def collect_bike(bike)
    if full?
      fail 'Van full'
    elsif bike.broken?
      puts "Bike is broken. collected in the van."
      @bikes << bike
      else
        puts "Bike is in working order. not collected in the van."
      end

  end

  private

  def full?
    true if @bikes.count >= @capacity
  end

end
