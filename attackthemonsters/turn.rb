class Turn
  def initialize(characters)
    @queue = characters
  end

  def shuffle
    @queue.shuffle!
  end

  def attacker
    @queue.first
  end

  def defender
    @queue[1]
  end

  def next
    @queue.rotate!
  end
end