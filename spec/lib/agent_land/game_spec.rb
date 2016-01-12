require 'rails_helper'
require 'agent_land/game'

module AgentLand
  describe Game do
    let(:game) { Game.new }
    let(:world) { game.world }
    let(:agent) { game.agents.first }

    it "initialises a world" do
      expect(game.world).to be_a World
      expect(game.world.data).not_to be_empty
    end

    it "places the agent within the world bounds" do
      expect(agent.x).to be >= 0
      expect(agent.y).to be >= 0
      expect(agent.x).to be < world.width
      expect(agent.y).to be < world.height
    end
  end
end
