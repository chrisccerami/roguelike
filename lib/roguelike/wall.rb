class Wall < InteractiveObject
  def passable?
    false
  end

  def interact
  end

  private

  def can_move?
    false
  end
end
