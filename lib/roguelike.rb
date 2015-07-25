$LOAD_PATH.unshift './lib/roguelike'

module Roguelike
  require 'curses'
  require 'ui'
  require 'game'
  require 'map'
  require 'character'
  require 'yaml'

  def self.run(map_name)
    Game.instance.run(map_name)
  end
end
