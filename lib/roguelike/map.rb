class Map
  require 'yaml'
  MAP_FILE = YAML.load_file('./map.yaml')

  attr_accessor :layout, :number, :initial_x, :initial_y
  def initialize(number)
    map = Map.find_map(number)
    @number = number
    @layout = map["layout"]
    @initial_x = map["initial_x"]
    @initial_y = map["initial_y"]
  end

  def self.find_map(n)
    MAP_FILE.select { |map| map["number"] == n }.first
  end
end
