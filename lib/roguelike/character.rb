class Character < InteractiveObject
  attr_accessor :hp

  def initialize(options)
    super
    @hp = 10
  end

  def passable?
    false
  end
end
