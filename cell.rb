class Cell
  attr_accessor :neighbors, :state, :next_state

  def initialize
    @neighbors = []
    @state = assign_state
    @next_state = @state
  end

  def assign_state
    state = [0, 1].sample
  end

  def assign_next_state
    neighbor_state =
      neighbors.map do |neighbor|
        neighbor.state
      end

    neighbor_count = neighbor_state.reduce(:+)

    if neighbor_count != 2 || neighbor_count != 3
      next_state = 0
    elsif neighbor_count == 3
      next_state = 1
    else
      next_state = state
    end
  end

  def alive?
    state == 1
  end

  def dead?
    state == 0
  end

  def status
    alive? ? ":)" : ":X"
  end

end
