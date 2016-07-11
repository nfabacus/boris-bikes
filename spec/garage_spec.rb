require 'garage'

describe Garage do
  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:take_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = double(:bike, broken?: true)
      subject.take_bike(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be bike
    end

  #   it 'raises an error' do
  #     expect { subject.release_bike }.to raise_error('No bikes available')
  #   end
  #
  #   it 'does not release broken bike' do
  #     bike = double(:bike, broken?: true)
  #     #allow(bike).to receive(:broken?).and_return(true)
  #     subject.dock(bike)
  #     expect{ subject.release_bike}.to raise_error('No bikes available')
  #   end
  end
  #
  describe '#take_bike' do
    it 'Garange does not take bikes that are not broken.' do
      bike = double(:bike, broken?: false)
      expect{ subject.take_bike bike}.to raise_error('Grange can only accept broken bikes.')
    end
    it 'Garange takes broken bikes.' do
      bike = double(:bike, broken?: true)
      expect(subject.take_bike bike).to eq [bike]
    end

    it 'raises an error when full' do
      Garage::DEFAULT_CAPACITY.times { subject.take_bike double(:bike, broken?: true) }
      expect { subject.take_bike double(:bike, broken?: true) }.to raise_error ('Garage full')
    end
  end
end
