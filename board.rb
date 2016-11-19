require "./cell.rb"

class Board
  attr_reader :row_length, :board_size, :state, :next_state

  def initialize(row_length)
    @row_length = row_length
    @board_size = row_length**2
    @state = []
    (board_size).times do
      @state << Cell.new()
    end
    @next_state = []

    create_cells(@state)
  end

  def create_cells(state)
    puts "create_cells"
    state.each_with_index do |cell, index|
      assign_state(index, cell)
    end
  end

  def increment
    puts "increment"
    state.each do |cell|
      cell.assign_next_state
    end
  end

  def top?(index)
    index < row_length
  end

  def bottom?(index)
    index > board_size - row_length + 1
  end

  def left?(index)
    index % row_length == 0
  end

  def right?(index)
    index % (row_length + 1) == 0
  end

  def assign_state(index, cell)
    puts "assign state"
    top_left  = index - row_length - 1
    top_mid   = index - row_length
    top_right = index - row_length + 1

    left  = index - 1
    right = index + 1

    bottom_left  = index + row_length - 1
    bottom_mid   = index + row_length
    bottom_right = index + row_length + 1

    case
    when top?(index) && left?(index)
      cell.neighbors = [
        state[right],
        state[bottom_mid],
        state[bottom_right]
      ]
    when top?(index) && right?(index)
      cell.neighbors = [
        state[left],
        state[bottom_left],
        state[bottom_mid]
      ]
    when top?(index)
      cell.neighbors = [
        state[left],
        state[right],
        state[bottom_left],
        state[bottom_mid],
        state[bottom_right]
      ]
    when bottom?(index) && left?(index)
      cell.neighbors = [
        state[top_mid],
        state[top_right],
        state[right],
      ]
    when bottom?(index) && right?(index)
      cell.neighbors = [
        state[top_left],
        state[top_mid],
        state[left]
      ]
    when bottom?(index)
      cell.neighbors = [
        state[top_left],
        state[top_mid],
        state[top_right],
        state[left],
        state[right]
      ]
    when left?(index)
      cell.neighbors = [
        state[top_mid],
        state[top_right],
        state[right],
        state[bottom_right],
        state[bottom_mid]
      ]
    when right?(index)
      cell.neighbors = [
        state[top_mid],
        state[top_left],
        state[left],
        state[bottom_left],
        state[bottom_mid]
      ]
    when true
      cell.neighbors = [
        state[top_right],
        state[top_mid],
        state[top_left],
        state[left],
        state[right],
        state[bottom_right],
        state[bottom_left],
        state[bottom_mid]
      ]
    end
    puts cell.neighbors

  end

end
