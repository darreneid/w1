require 'set'

def import(file)
  dict = Set[]
  File.foreach(file) { |line| dict.add(line[0...-1]) }
  dict
end

class Game

  def initialize(*players)
    @fragment = ""
    @play = []
    players.each {|p| @play << p}
    @current_player = Player.new(play[0])
    @next_player = Player.new(play[1])
    @previous_player = nil
    @dictionary = import("./data/dictionary.txt")
  end

  def play_round
    
  end

  def take_turn(player)
    p "Take your turn, #{player.name}"
    entry = gets.chomp
  end

  def valid_play?(string)
    if string.length == 1

  end

  def fragment(x = @fragment)
    @fragment = x
    @fragment
  end

  def current_player(x = @current_player)
    @current_player = x
    @current_player
  end

  def next_player
    @next_player, @current_player = @current_player, @next_player
  end

  def previous_player (x = @previous_player)
    @previous_player = x
    @previous_player
  end
end

class Player
  def initialize(name)
    @name = name
  end

  def guess

  end

  def alert_invalid_guess

  end 

  def name
    @name
  end
end


rob = Game.new("Bob", "Ross") 
rob.play_round