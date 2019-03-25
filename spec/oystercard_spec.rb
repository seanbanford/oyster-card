require 'oystercard'

describe Oystercard do
  it 'responds to balance being 0' do
    expect(subject.balance).to eq 0
  end

  it 'allows balance to top up' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'balance maximum of £90' do
    subject.top_up(90)
    expect { subject.top_up(1) }.to raise_error 'Maximum £90'
  end

  it 'can deduct a fare' do
    subject.deduct(10)
    expect(subject.balance).to eq -10
  end

end
