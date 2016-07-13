require 'garage'

describe Garage do

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = Bike.new(true)
      subject.take_bike(bike)
      released_bike = subject.release_bike
      expect(released_bike.broken?).to eq false
    end
  end

  describe '#take_bike' do
    it 'Garage does not take bikes that are not broken.' do
      bike = double(:bike, broken?: false)
      expect{ subject.take_bike bike}.to raise_error('Garage can only accept broken bikes.')
    end
    it 'Garage takes broken bikes.' do
      bike = double(:bike, broken?: true)
      expect(subject.take_bike bike).to eq [bike]
    end
    it 'raises an error when full' do
      Garage::DEFAULT_CAPACITY.times { subject.take_bike double(:bike, broken?: true) }
      expect { subject.take_bike double(:bike, broken?: true) }.to raise_error ('Garage full')
    end
  end
end
