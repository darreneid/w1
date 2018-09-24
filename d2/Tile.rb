require 'colorize'

class Tile
    attr_accessor :@value, :@given

    def initialize(value, given = true)
        @value = value
        @given = given
    end

    def to_s
        given ? "#{value}" : "#{value}".colorize(:green)
    end
end