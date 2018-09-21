class Game

    def initialize(*players)
      @fragment = ""
      @names = []
      players.each {|p| @names << p}
      @player_one = Player.new(@names[0])
      @player_two = Player.new(@names[1])
      @dictionary = import("./data/dictionary.txt")
    end
  
    def run
      while @player_one.game_status != "GHOST" and @player_two.game_status != "GHOST"
        @fragment = ""
        play_round
      end
    end
  
    def play_round
      while take_turn(current_player)
        p "The fragment is now #{@fragment}"
        next_player
      end
      update
    end
  
    def take_turn(player)
      p "Take your turn, #{player.name}"
      entry = gets.chomp
      while valid_play?(@fragment + entry) == "invalid"
        p "Try again, #{player.name}"
        entry = gets.chomp
      end
      if !valid_play?(@fragment + entry)
        p "You lose this round, #{player.name}"
        current_player.losses(current_player.losses+1)
        return false
      else
        @fragment += entry
        return true
      end
    end
  
    def valid_play?(string)
      @dictionary.each do |word|
        if string == word
          return false
        elsif string == word[0...string.length]
          return true
        end
      end
      return "invalid"
    end

    def update
        @player_one.update
        @player_two.update
        puts "\n"
    end
  
    def fragment(x = @fragment)
        @fragment = x
        @fragment
    end
  
    def next_player
      @player_one, @player_two = @player_two, @player_one
    end
  
    def current_player(x = @player_one)
      @player_one = x
      @player_one
    end
  
    def previous_player (x = @player_two)
      @player_two = x
      @player_two
    end
  end