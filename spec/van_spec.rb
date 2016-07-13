require 'van'

describe Van do
  it { is_expected.to respond_to(:dropoff_bike).with(1).argument }

  it { is_expected.to respond_to(:take_bike).with(2).argument }
  #
  it { is_expected.to respond_to(:bikes) }

  describe 'initialization' do
    it 'allows user to enter variable capacity' do
      van = Van.new(30)
      expect(van.capacity).to eq 30
    end
  end

  describe '#take_bike' do
    it 'raises an error when full with broken bikes at docking station' do
      Van::DEFAULT_CAPACITY.times { subject.take_bike double(:bike, broken?: true), "docking station" }
      expect { subject.take_bike double(:bike, broken?: true) }.to raise_error ('Van full')
    end
    it 'raises an error when full with working bikes at garage' do
      Van::DEFAULT_CAPACITY.times { subject.take_bike double(:bike, broken?: false), "garage" }
      expect { subject.take_bike double(:bike, broken?: false), "garage" }.to raise_error ('Van full')
    end

    it 'takes broken bikes when location is "docking station"' do
      15.times{ subject.take_bike double(:bike, broken?: true), "docking station"}
      expect(subject.bikes.count).to eq 15
    end
    it 'does not take broken bikes when location is not "docking station"' do
      15.times{ subject.take_bike double(:bike, broken?: true)}
      expect(subject.bikes.count).to eq 0
    end
    it 'does not take working bikes when location is not "garage"' do
      subject.take_bike double(:bike, broken?: false)
      expect(subject.bikes.count).to eq 0
    end
    it 'does not take working bikes at location "docking station"' do
      subject.take_bike double(:bike, broken?: false), "docking station"
      expect(subject.bikes.count).to eq 0
    end
    it 'takes working bikes at location "garage"' do
      5.times{subject.take_bike double(:bike, broken?: false), "garage"}
      expect(subject.bikes.count).to eq 5
    end
    it 'does not take broken bikes at location "garage"' do
      15.times{ subject.take_bike double(:bike, broken?: true), "garage"}
      expect(subject.bikes.count).to eq 0
    end
  end

  describe '#dropoff_bike' do

    it 'drops off broken bikes at location "garage"' do
      bike = double(:bike, broken?: true)
      subject.take_bike bike, "docking station"
      expect(subject.dropoff_bike "garage").to eq [bike]
    end
    it 'does not drop off working bikes at location "garage"' do
      bike = double(:bike, broken?: false)
      5.times {subject.take_bike bike, "garage"}
      expect(subject.dropoff_bike "garage").to eq nil
    end
    it 'drops off working bikes at location "docking station"' do
      bike = double(:bike, broken?: false)
      15.times{subject.take_bike bike, "garage"}
      working_bikes = subject.dropoff_bike "docking station"
      expect(working_bikes.count).to eq 15
    end
    it 'does not drop off broken bikes at location "docking station"' do
      bike = double(:bike, broken?: true)
      subject.take_bike bike, "docking station"
      expect(subject.dropoff_bike "docking station").to eq nil
    end
  #   it 'does not release broken bike' do
  #     bike = double(:bike, broken?: true)
  #     #allow(bike).to receive(:broken?).and_return(true)
  #     subject.dock(bike)
  #     expect{ subject.release_bike}.to raise_error('Bike is broken')
  #   end
  end


end
