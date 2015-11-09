class InteractiveObject
  attr_accessor :avatar, :x_pos, :y_pos
  def initialize(options)
    @avatar = options[:avatar]
    @x_pos = options[:x]
    @y_pos = options[:y]
  end

  def passable?
    fail "Not Implemented"
  end

  def move_up
    move(@x_pos, @y_pos - 1)
  end

  def move_down
    move(@x_pos, @y_pos + 1)
  end

  def move_left
    move(@x_pos - 1, @y_pos)
  end

  def move_right
    move(@x_pos + 1, @y_pos)
  end

  def move(x, y)
    if can_move?(x, y)
      UI.instance.clear_position(@x_pos, @y_pos)
      thing = Game.thing_in_position(x, y)
      thing.interact if thing
      @x_pos = x
      @y_pos = y
      UI.instance.write(x_pos, y_pos, avatar)
    else
      Game.thing_in_position(x, y).interact
      UI.instance.alert_user
    end
  end

  private

  def can_move?(target_x, target_y)
    thing = Game.thing_in_position(target_x, target_y)
    thing.nil? || thing.passable?
  end
end
