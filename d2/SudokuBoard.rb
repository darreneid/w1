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
                tile_array[i][j] = Tile.new(text_array[i][j].to_i, true)
            end
        end
        tile_array
    end

    def update(pos)
        if @board[pos[0]-1][pos[1]-1].given == true
        else
            @board[pos[0]-1][pos[1]-1].value = pos[2]
        end
        render
    end

    def render
        system('clear')
        @board.length.times do |i|
            @board[i].length.times do |j|
                if @board[i][j].value == 0
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
        @board.length.times do |i|
            if !row_solved?(i)
                return false
            end
        end

        @board[0].length.times do |j|
            if !column_solved?(j)
                return false
            end
        end

        @board.length.times do |k|
            if !box_solved?(k)
                return false
            end
        end
        true
    end

    def row_solved?(i)
        tst = (1..9).to_a
        @board[i].each do |t|
            if tst.include?(t.value)
                tst.delete(t.value)
            else
                return false
            end
        end
        true
    end

    def column_solved?(j)
        tst = (1..9).to_a
        @board.each do |t|
            if tst.include?(t[j].value)
                tst.delete(t[j].value)
            else
                return false
            end
        end
        true
    end

    def box_solved?(k)
        tst = (1..9).to_a
        row = (k/3)*3
        col = (k % 3)*3
        (row..row+2).to_a.each do |i|
            (col..col+2).to_a.each do |j|
                if tst.include?(@board[i][j].value)
                    tst.delete(@board[i][j].value)
                else
                    return false
                end
            end
        end
        true
    end
end

