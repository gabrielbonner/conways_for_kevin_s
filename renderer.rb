module Renderer

  def self.render(board)
    puts "render"
    board.state.each_with_index do |cell, index|
      print "#{cell.next_state}  "
      print "\n" if (index + 1) % board.row_length == 0
    end

  end

end
