class Game
  include Singleton

  attr_reader :ui, :character
  attr_accessor :map, :map_name, :interactables
  def initialize
    @map
    @ui = UI.instance
    @character = Character.new(avatar: "@", x: nil, y: nil)
    @interactables = Array.new
  end

  def run(map_name)
    self.map = Map.new(map_name, 1)
    set_character_position
    ui.write_map(map.layout)
    ui.write(character.x_pos, character.y_pos, character.avatar)
    loop do
      accept_input
    end
  end

  def self.thing_in_position(x, y)
    instance.interactables.select do |obj|
      obj.x_pos == x && obj.y_pos == y
    end.first
  end

  private

  def set_character_position
    character.x_pos = @map.initial_x
    character.y_pos = @map.initial_y
  end

  def accept_input
    inputs = {
      w: proc { character.move_up },
      a: proc { character.move_left },
      s: proc { character.move_down },
      d: proc { character.move_right },
      q: proc { ui.close }
    }
    inputs[ui.accept_input.to_sym].call
    ui.write(character.x_pos, character.y_pos, character.avatar)
  end
end
