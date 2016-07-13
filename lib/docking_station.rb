require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def release_bike
    for i in 0..@bikes.count-1
      if !@bikes[i].broken?
        released_bike = @bikes[i]
        @bikes.delete_at(i)
        puts "released bike: #{released_bike}"
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
