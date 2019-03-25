
class Oystercard

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail 'Maximum £90' if max?(value)
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end




private

  def max?(value)
    (@balance += value) > 90
  end

end
