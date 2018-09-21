class Card
    def initialize(value, status = "down")
        @face_value = value
        @status = status
    end

    def display
        if @status == "down"
            " "
        else
            "#{@face_value}"
        end
    end

    def hide
        @status = "down"
    end

    def reveal
        @status = "up"
    end
end