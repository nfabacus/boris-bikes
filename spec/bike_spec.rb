require 'bike'

describe Bike do
  it 'should have a way to report broken bikes' do
    subject.report_broken

    expect(subject).to be_broken
  end
end
