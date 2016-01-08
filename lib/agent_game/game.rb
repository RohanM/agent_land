require 'agent_game/world_generator'

module AgentGame
  class Game
    attr_reader :world

    def initialize
      @world = World.new
      wg = WorldGenerator.new 320, 200
      wg.generate @world

      @frame = 0
    end

    def running?
      @frame < 10
    end

    def step
      @frame += 1
    end
  end
end
