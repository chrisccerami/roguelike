class Door < InteractiveObject
  def passable?
    false
  end

  def interact
    UI.instance.next_room
  end

  private

  def can_move?
    false
  end
end
