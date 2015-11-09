class Game
  include Singleton

  attr_reader :ui, :character
  attr_accessor :map, :map_name, :interactables
  def initialize
    @ui = UI.instance
    @character = Character.new(avatar: "@", x: nil, y: nil)
    @interactables = []
  end

  def run(map_name)
    setup(map_name)
    loop do
      accept_input
    end
  end

  def self.thing_in_position(x, y)
    instance.interactables.find do |obj|
      obj.x_pos == x && obj.y_pos == y
    end
  end

  def ais
    interactables.select(&:ai?)
  end

  def self.chance
    rand > 0.5
  end

  def self.over
    UI.instance.game_over
  end

  private

  def accept_input
    case ui.accept_input.to_sym
    when :w
      character.move_up
    when :a
      character.move_left
    when :s
      character.move_down
    when :d
      character.move_right
    when :q
      ui.close
    end
    ais.each(&:take_turn)
  end

  def setup(map_name)
    self.map = Map.new(map_name, 1)
    ui.write_map(map.layout)
  end
end
