require "./board.rb"
require "./cell.rb"
require "./renderer.rb"

puts "What row length do you want?"
row_length = gets.chomp

board = Board.new(row_length.to_i)

  Renderer.render(board)
  board.increment
  sleep 1
  Renderer.render(board)
  board.increment
  sleep 1
  Renderer.render(board)
  board.increment
  sleep 1
  Renderer.render(board)
  board.increment
  sleep 1
