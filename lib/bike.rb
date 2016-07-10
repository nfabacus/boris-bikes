class Bike
  def initialize
    @broken = false
  end

  def working?
    if @broken == false
      true
    elsif @broken == true
      false
    else
      puts "unknown"
    end
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end
