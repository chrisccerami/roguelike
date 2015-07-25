class UI
  include Curses
  require 'singleton'
  include Singleton

  def initialize
    noecho
    curs_set(0)
    init_screen
  end

  def close
    close_screen
    exit
  end

  def write(x, y, string)
    setpos(y, x)
    addstr(string)
  end

  def accept_input
    inputs = %w(w a s d q)
    loop do
      input = getch
      return input if inputs.include?(input)
    end
  end

  def clear_position(x, y)
    setpos(y, x)
    delch
    insch(' ')
  end

  def wall?(x, y)
    setpos(y, x)
    inch.chr == '|' || inch.chr == '-'
  end

  def door?(x, y)
    setpos(y, x)
    inch.chr =='#'
  end

  def alert_user
    beep
    flash
  end

  def load_room(map)
    write(0, 0, map.layout)
    Game.instance.character.move(map.initial_x, map.initial_y)
  end

  def next_room
    clear
    next_room = Game.instance.map.number + 1
    Game.instance.map.update_map(next_room)
    load_room(Game.instance.map)
  end
end
