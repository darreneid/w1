require_relative 'Tile.rb'
require_relative 'SudokuBoard.rb'
require_relative 'SudokuGame.rb'

def new_game
    Sudoku_Game.new('data/sudoku1-almost.txt')
end

r = new_game

r.play