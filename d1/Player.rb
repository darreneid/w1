class Player

    def initialize(name)
      @name = name
      @losses = 0
      @game_name = "GHOST"
      @game_status = ""
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
  
    def game_status
      @game_status
    end
  
    def update
      @game_status = @game_name[0...@losses]
      p "#{@name}: #{@game_status}"
    end
  end