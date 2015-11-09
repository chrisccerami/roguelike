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
  end

  private

  def find_data(avatar)
    DATA.select {|enemy| enemy["avatar"] == avatar }.first
  end
end
