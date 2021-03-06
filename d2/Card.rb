class Card
    attr_accessor :face_value, :status

    def initialize(value, status = "down")
        @face_value = value
        @status = status
    end

    def display
        if @status == "down"
            "-"
        else
            @face_value
        end
    end

    def hide
        @status = "down"
    end

    def reveal
        @status = "up"
    end

    def ==(card)
        if @face_value == card.face_value
            true
        end
        false
    end
end