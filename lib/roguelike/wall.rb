class Wall < InteractiveObject
  def passable?
    false
  end

  def interact
  end

  def ai?
    false
  end

  private

  def can_move?
    false
  end
end
