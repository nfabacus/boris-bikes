require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if @bikes.empty?
      fail 'No bikes available'
    else
      return_bike
    end
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

    def return_bike
      @bikes.each do |bike|
        return bike unless bike.broken?
      end
      fail 'Bike is broken'
    end

    def full?
      true if @bikes.count >= @capacity
    end

    def empty?
      true if @bikes.empty?
    end
end
