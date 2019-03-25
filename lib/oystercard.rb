
class Oystercard

  attr_reader :balance, :in_journey
  DEFAULT_MAXIMUM_FUNDS = 90
  DEFAULT_MINIMUM_FUNDS = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail 'Maximum £90' if max?(value)
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Minimum fare £1' if minimum?
    @in_journey = true
  end

  def touch_out(fare = DEFAULT_MINIMUM_FUNDS)
    deduct(fare)
    @in_journey = false
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
