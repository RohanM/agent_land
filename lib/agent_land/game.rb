require 'agent_land/world_generator'
require 'agent_land/agent_presence'

module AgentLand
  class Game
    attr_reader :world, :agents

    def initialize
      create_world
      add_agents

      @frame = 0
    end

    def create_world
      @world = World.new
      wg = WorldGenerator.new 320, 200
      wg.generate
      @world.data = wg.data
    end


    def add_agents
      @agents = []

      ap = AgentPresence.new
      @world.place ap

      @agents << ap
    end

    def running?
      @frame < 10
    end

    def step
      @frame += 1
    end

    def world_data
      @world.data
    end

    def agents_data
      @agents.map { |ap| {x: ap.x, y: ap.y} }
    end
  end
end
