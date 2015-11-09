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

  def write_map(layout)
    x = 0
    y = 0
    rows = layout.split("\n")
    rows.each do |row|
      row.each_char do |char|
        object = initialize_by_string(x, y, char)
        add_to_game(object) if object
        setpos(y, x)
        addstr(char)
        x += 1
      end
      x = 0
      y += 1
    end
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

  def alert_user
    beep
    flash
  end

  def load_room(map)
    write_map(map.layout)
    Game.instance.character.move(map.initial_x, map.initial_y)
  end

  def next_room
    clear
    next_room = Game.instance.map.number + 1
    Game.instance.map.update_map(next_room)
    Game.instance.interactables = []
    load_room(Game.instance.map)
  end

  private

  def add_to_game(interactable)
    Game.instance.interactables << interactable
  end

  def initialize_by_string(x, y, string)
    if string ==  "|" || string == "-"
      Wall.new(x: x, y: y, avatar: string)
    elsif string == "#"
      Door.new(x: x, y: y, avatar: string)
    elsif /[a-zA-Z]/ =~ string
      Enemy.new(x: x, y: y, avatar: string)
    else
      nil
    end
  end
end
