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
    elsif (@bikes.last).broken?
      fail 'Bike is broken'
    else
      @bikes.pop
    end
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  #  def broken?
  #    bike = Bike.new
  #    true if bike.report_broken
  #  end

    def full?
      true if @bikes.count >= @capacity
    end

    def empty?
      true if @bikes.empty?
    end
end
