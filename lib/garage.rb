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
    fail 'Garage can only accept broken bikes.' if !bike.broken?
    puts "Broken bike accepted."
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    bike = @bikes.pop
    bike.report_fixed
    bike
  end

  def fix_bike(bike)
    bike.broken = false
    bike
  end

  private

    def full?
      true if @bikes.count >= @capacity
    end

    def empty?
      true if @bikes.empty?
    end
end
