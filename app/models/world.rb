class World < ActiveRecord::Base
  GRASS = 0
  FOOD = 1
  ROCK = 2
  WATER = 3

  def place(agent_presence)
    while !placement_valid?(agent_presence)
      place_randomly(agent_presence)
    end
  end

  def width
    data.count
  end

  def height
    data.first.count
  end


  private

  def placement_valid?(agent_presence)
    agent_presence.placed? &&
      terrain_at(agent_presence.x, agent_presence.y) == GRASS
  end

  def place_randomly(agent_presence)
    agent_presence.x = rand width
    agent_presence.y = rand height
  end

  def terrain_at(x, y)
    data[x][y]
  end
end
