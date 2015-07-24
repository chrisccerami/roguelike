class Character
  attr_accessor :avatar, :x_pos, :y_pos
  def initialize(avatar, x, y)
    @avatar = avatar
    @x_pos = x
    @y_pos = y
  end

  def move(x, y)
    if can_move?(x, y)
      UI.instance.clear_position(@x_pos, @y_pos)
      @x_pos = x
      @y_pos = y
      check_target(x, y)
    else
      UI.instance.alert_user
    end
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

  def can_move?(target_x, target_y)
    !UI.instance.wall?(target_x, target_y)
  end

  def check_target(x, y)
    if UI.instance.door?(x, y)
      move_through_door
    end
  end

  def move_through_door
    UI.instance.next_room
  end
end
