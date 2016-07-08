require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  describe 'initialization' do
    it 'allows user to enter variable capacity' do
      docking_station = DockingStation.new(30)
      30.times {docking_station.dock Bike.new}
      expect {docking_station.dock Bike.new}.to raise_error('Docking station full')
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
    it 'should not release broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike}.to raise_error('Bike is broken')
    end
  end

  describe '#dock' do
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error ('Docking station full')
    end
  end
end
