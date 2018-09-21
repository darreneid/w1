require 'set'
require_relative 'Game.rb'
require_relative 'Player.rb'

def import(file)
  dict = Set[]
  File.foreach(file) { |line| dict.add(line[0...-1]) }
  dict
end

rob = Game.new("Bob", "Ross") 
rob.run