require 'oystercard'

describe Oystercard do
  it 'responds to balance being 0' do
    expect(subject.balance).to eq 0
  end
end
