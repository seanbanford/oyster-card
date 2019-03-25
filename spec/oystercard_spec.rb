require 'oystercard'

describe Oystercard do
  let(:station){ double :station }
  describe '#card balance' do
    it 'responds to balance being 0' do
      expect(subject.balance).to eq 0
    end

    it 'allows balance to top up' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it 'balance maximum of £90' do
      subject.top_up(Oystercard::DEFAULT_MAXIMUM_FUNDS)
      expect { subject.top_up(1) }.to raise_error 'Maximum £90'
    end

    it 'can deduct a fare' do
      subject.touch_out(10)
      expect(subject.balance).to eq -10
    end

    it 'Has minimum fare available' do
      expect { subject.touch_in(station) }.to raise_error 'Minimum fare £1'
    end
  end

  it 'touches in' do
    subject.top_up(2)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it 'touches out' do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it 'charges for journey' do
    expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::DEFAULT_MINIMUM_FUNDS)
  end

  it 'checks if in journey' do
    expect(subject.in_journey?).to eq false
  end


  it 'remembers entry station' do
    subject.top_up(2)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it 'forgets entry station on touch out' do
    subject.top_up(2)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.entry_station).to eq nil
  end
end
