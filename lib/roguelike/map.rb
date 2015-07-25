class Map
  require 'yaml'

  attr_reader :file
  attr_accessor :layout, :number, :initial_x, :initial_y
  def initialize(file_name, number)
    @file = YAML.load_file(file_name)
    map = Map.find_map(@file, number)
    @number = number
    @layout = map["layout"]
    @initial_x = map["initial_x"]
    @initial_y = map["initial_y"]
  end

  def update_map(number)
    map = Map.find_map(self.file, number)
    @number = number
    @layout = map["layout"]
    @initial_x = map["initial_x"]
    @initial_y = map["initial_y"]
  end

  private

  def self.find_map(file, n)
    file.select { |map| map["number"] == n }.first
  end

end
