class Cell

  attr_accessor :neighbours, :alive

  def is_alive?
    return (alive && neighbours == 2) || neighbours == 3
  end
end