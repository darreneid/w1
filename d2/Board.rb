class Board
    attr_accessor :grid, :deck

    def initialize
        @grid = Array.new(4) {Array.new(4)}
        @deck = ("A".."H").to_a + ("A".."H").to_a
        populate
    end

    def populate
        @grid.length.times do |i|
            @grid[0].length.times do |j|
                @grid[i][j] = Card.new(@deck.shuffle!.pop)
            end
        end
    end

    def render
        system("clear")
        @grid.each do |row|
            row.each do |card|
                print card.display
                print " "
            end
            puts "\n"
        end
    end

    def won?
        @grid.each do |row|
            row.each do |card|
                if card.status == "down"
                    return false
                end
            end
        end
        true
    end

    def reveal(pos)
        if @grid[pos[0]][pos[1]].status == "down"
            @grid[pos[0]][pos[1]].reveal
        end
    end

    def hide(pos)
        if @grid[pos[0]][pos[1]].status = "up"
            @grid[pos[0]][pos[1]].hide
        end
    end

    def access(pos)
        @grid[pos[0]][pos[1]].display
    end
end