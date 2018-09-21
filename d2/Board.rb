class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(4) {Array.new(4)}
        @grid[0][0] = 10
    end

    def render

    end

    def won?

    end

    def reveal

    end
end