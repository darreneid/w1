require 'set'

def import(file)
  dict = Set[]
  File.foreach(file) { |line| dict.add(line[0...-1]) }
  dict
end

class Game

  def initialize(*players)
    @fragment = ""
    @names = []
    players.each {|p| @names << p}
    @player_one = Player.new(@names[0])
    @player_two = Player.new(@names[1])
    @dictionary = import("./data/dictionary.txt")
  end

  def play_round
    while true
      take_turn(current_player)
      p "The fragment is now #{@fragment}"
      next_player
    end
  end

  def take_turn(player)
    p "Take your turn, #{player.name}"
    entry = gets.chomp
    while !valid_play?(@fragment + entry)
      p "Try again, #{player.name}."
      entry = gets.chomp
    end
    @fragment += entry
  end

  def valid_play?(string)
    @dictionary.each do |word|
      if string == word
        p "It seems you lost that round, #{current_player.name}"
        return false
      elsif string == word[0...string.length]
        return true
      end
    end
    return false
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

class Player
  def initialize(name)
    @name = name
    @losses = 0
    @ghost = ""
  end

  def losses(x = @losses)
    @losses = x
    @losses
  end

  def ghost(x = @ghost)
    @ghost = x
    @ghost
  end 

  def name
    @name
  end
end

rob = Game.new("Bob", "Ross") 
rob.play_round