class Sudoku_Game
    attr_accessor(:board)
    
    def initialize(file_path)
        @board = Sudoku_Board.new(file_path)
    end

    def play
        while !@board.solved?
            @board.render
            pos_val = prompt
            @board.update(pos_val)
        end
        p "You win!"
    end

    def prompt
        user_input = []
        loop do
            print "Choose a row (1-9): "
            user_input << gets.chomp.to_i
            print "Choose a column (1-9): "
            user_input << gets.chomp.to_i
            print "Enter a new value (1-9): "
            user_input << gets.chomp.to_i
            break if validate(user_input)
            @board.render
            puts "That input was invalid."
            user_input = []
        end
        user_input
    end

    def validate(user_input)
        user_input.each do |inp|
            if inp < 1 || inp > 9
                return false
            end
        end
        true
    end
end