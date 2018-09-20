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
    @current_player = @play[0]
    @next_player = @play[1]
    @previous_player = nil
    @dictionary = import("./data/dictionary.txt")
  end

  def play_round

  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    @next_player
  end

  def take_turn(player)

  end

  def valid_play?(string)

  end

  def fragment
    @fragment
  end

  def play
    @play
  end

  def dictionary
    @dictionary
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
end
