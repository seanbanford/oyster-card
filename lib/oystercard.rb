
class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail 'Maximum £90' if max?(value)
  end

  def deduct(fare)
    @balance -= fare
  end

private

  def max?(value)
    (@balance += value) > 90
  end

end
