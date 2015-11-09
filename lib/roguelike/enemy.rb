class Enemy < InteractiveObject
  DATA = YAML.load_file("lib/roguelike/enemies.yaml")

  attr_accessor :hp

  def initialize(options)
    super
    data = find_data(avatar)
    @name = data["name"]
    @hp = data["hp"]
  end

  def passable?
    false
  end

  def interact
    self.hp -= 1 if Game.chance
  end

  def ai?
    true
  end

  def take_turn
    if hp < 1
      die
    else
      char = Game.instance.character
      char_x = char.x_pos
      char_y = char.y_pos
      if char_x < x_pos - 1
        move_left
      elsif char_x > x_pos + 1
        move_right
      elsif char_y < y_pos - 1
        move_up
      elsif char_y > y_pos + 1
        move_down
      else
        attack(char)
      end
    end
  end

  def attack(char)
    char.hp -= 1 if Game.chance
    if char.hp < 1
      Game.over
    end
  end

  private

  def die
    Game.instance.interactables.delete(self)
    UI.instance.write(x_pos, y_pos, " ")
  end

  def find_data(avatar)
    DATA.find { |enemy| enemy["avatar"] == avatar }
  end
end
