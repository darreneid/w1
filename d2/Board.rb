class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(4) {Array.new(4)}
        populate
    end

    def populate
        @grid.length.times do |i|
            @grid[0].length.times do |j|
                @grid[i][j] = Card.new(10)
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

    end

    def reveal

    end
end