$LOAD_PATH.unshift './lib/roguelike'

module Roguelike
  require 'curses'
  require 'yaml'
  require 'game'
  require 'ui'
  require 'map'
  require 'interactive_object'
  require 'character'
  require 'enemy'
  require 'wall'
  require 'door'

  def self.run(map_name)
    Game.instance.run(map_name)
  end
end
