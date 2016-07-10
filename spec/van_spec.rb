require 'van'

describe Van do
  it { is_expected.to respond_to(:dropoff_bike) }

  it { is_expected.to respond_to(:collect_bike).with(1).argument }
  #
  it { is_expected.to respond_to(:bikes) }

  describe 'initialization' do
    it 'allows user to enter variable capacity' do
      van = Van.new(30)
      expect(van.capacity).to eq 30
    end
  end

  describe '#collect_bike' do
    it 'raises an error when full' do
      Van::DEFAULT_CAPACITY.times { subject.collect_bike double(:bike, broken?: true) }
      expect { subject.collect_bike double(:bike, broken?: true) }.to raise_error ('Van full')
    end

    it 'returns collected bikes' do
      bike = double(:bike, broken?: true)
      subject.collect_bike(bike)
      expect(subject.bikes).to eq [bike]
    end


  end

  describe '#dropoff_bike' do

    let(:bike) { double :bike }
    it 'drop off bikes' do
      bike = double(:bike, broken?: true)
      subject.collect_bike(bike)
      expect(subject.dropoff_bike).to eq [bike]
    end

  #   it 'raises an error' do
  #     expect { subject.release_bike }.to raise_error('No bikes available')
  #   end
  #
  #   it 'does not release broken bike' do
  #     bike = double(:bike, broken?: true)
  #     #allow(bike).to receive(:broken?).and_return(true)
  #     subject.dock(bike)
  #     expect{ subject.release_bike}.to raise_error('Bike is broken')
  #   end
  end


end
