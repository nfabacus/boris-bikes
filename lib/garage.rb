require_relative 'bike'

class Garage
  DEFAULT_CAPACITY = 100
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def take_bike(bike)
    fail 'Garage full' if full?
    if bike.broken?
      puts "Broken bike accepted."
      bike.report_fixed
      puts "Bike is fixed and being stored in the garage."
      @bikes << bike
    else
      fail 'Grange can only accept broken bikes.'
    end
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

  private



    def full?
      true if @bikes.count >= @capacity
    end

    def empty?
      true if @bikes.empty?
    end
end
