require 'set'

def import(file)
  dict = Set[]
  File.foreach(file) { |line| dict.add(line[0...-1]) }
  dict
end

class Game

  def initialize(*players)
    players.each {|p| @play << p}
    @fragment = ""
    @dictionary = import("./data/dictionary.txt")
  end

  def test
    p dictionary.length
  end
end

game = Game.new(2) {"John", "Bill"}
game.test
