class Game
    attr_accessor :board, :previous_guess, :guessed_pos

    def initialize
        @board = Board.new
        @previous_guess = []
        @guessed_pos = []
    end

    def play
        while !@board.won?
            @board.render
            make_guess
            @previous_guess = @guessed_pos.dup
            make_guess
            if !board.access(@previous_guess).==(board.access(@guessed_pos))
                sleep(2)
                @board.hide(@previous_guess)
                @board.hide(@guessed_pos)
            end
            board.render
        end
    end

    def make_guess
        print "Select a card. Row: "
        @guessed_pos[0] = gets.chomp.to_i
        print "Column: "
        @guessed_pos[1] = gets.chomp.to_i
        @board.reveal(@guessed_pos)
        @board.render
    end
end
