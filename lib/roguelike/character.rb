class Character < InteractiveObject
  attr_accessor :hp

  def initialize(options)
    super
    @hp = 10
  end

  def passable?
    false
  end

  def ai?
    false
  end

  def set_position(x, y)
    @x_pos = x
    @y_pos = y
  end
end
