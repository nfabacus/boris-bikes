class Bike
  attr_accessor :broken, :report_broken, :report_fixed

  def initialize(broken = false)
    @broken = broken
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
  end

  def report_fixed
    @broken = false
  end

end
