$LOAD_PATH.unshift './lib/roguelike'

module Roguelike
  require 'curses'
  require 'ui'
  require 'game'
  require 'map'
  require 'character'
  require 'yaml'

  def self.run
    Game.instance.run
  end
end
