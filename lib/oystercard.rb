
class Oystercard

  attr_reader :balance, :in_journey, :entry_station
  DEFAULT_MAXIMUM_FUNDS = 90
  DEFAULT_MINIMUM_FUNDS = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(value)
    fail 'Maximum £90' if max?(value)
  end

  def in_journey?
    if @entry_station == nil
      false
    else
      true
    end
  end

  def touch_in(station)
    fail 'Minimum fare £1' if minimum?
    @in_journey = true
    @entry_station = station
  end

  def touch_out(fare = DEFAULT_MINIMUM_FUNDS)
    deduct(fare)
    @in_journey = false
    @entry_station = nil
  end

private

  def max?(value)
    (@balance += value) > DEFAULT_MAXIMUM_FUNDS
  end

  def minimum?
    @balance < DEFAULT_MINIMUM_FUNDS
  end

  def deduct(fare)
    @balance -= fare
  end
end
