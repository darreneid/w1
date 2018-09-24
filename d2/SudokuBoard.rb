class Sudoku_Board
    def initialize(file_path)
        @board = from_file(file_path)
    end

    def from_file(file_path)
        board = []
        File.foreach(file_path) do |line|
            board.insert(-1, line.chars[0...-1])
        end
        board
    end

    def update(pos)

    end

    def render
        p @board
    end

    def solved?

    end

    def row_solved?

    end

    def column_solved?

    end

    def box_solved?

    end
end

