require 'agent_land/actions/action_base'

module AgentLand
  class MoveAction < ActionBase
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3

    def initialize(direction)
      @direction = direction
    end

    def apply(game)
      x = @agent_presence.x
      y = @agent_presence.y

      case @direction
      when NORTH
        y -= 1
      when EAST
        x += 1
      when SOUTH
        y += 1
      when WEST
        x -= 1
      end

      if x >= 0 && y >= 0 && x < game.world.width && y < game.world.height
        @agent_presence.x = x
        @agent_presence.y = y
      end
    end
  end
end
