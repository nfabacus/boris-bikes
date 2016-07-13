require 'bike'

describe Bike do
  it 'should have a way to report broken bikes' do
    subject.report_broken

    expect(subject.broken?).to be true
  end

  it 'should have a way to report fixed bikes' do
    subject.report_fixed

    expect(subject.broken?).to be false
  end

end
