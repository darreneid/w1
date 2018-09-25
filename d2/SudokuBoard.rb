class Sudoku_Board
    attr_accessor(:board)

    def initialize(file_path)
        @board = from_file(file_path)
    end

    def from_file(file_path)
        text_array = Array.new
        File.foreach(file_path) do |line|
            text_array << line.chomp
        end
        tile_array = Array.new(9) {Array.new(9)}
        text_array.length.times do |i|
            text_array[i].length.times do |j|
                tile_array[i][j] = Tile.new(text_array[i][j])
            end
        end
        tile_array
    end

    def update(pos, val)
        if @board[pos[0]][pos[1]].given = true
        else
            @board[pos[0]][pos[1]] = Tile.new(val, false)
        end
        render
    end

    def render
        system('clear')
        @board.length.times do |i|
            @board[i].length.times do |j|
                if @board[i][j].to_s == "0"
                    @board[i][j].given = false
                    print "-" + " "
                else
                    print @board[i][j].to_s + " "
                end
            end
            puts "\n"
        end
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

