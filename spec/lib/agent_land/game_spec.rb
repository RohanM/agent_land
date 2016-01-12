require 'rails_helper'
require 'agent_land/game'
require 'agent_land/actions/move_action'

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

    describe "stepping" do
      class WestingAgent
        def act!(state, world)
          MoveAction.new MoveAction::WEST
        end
      end

      let(:agent) { WestingAgent.new }
      let(:ap) { AgentPresence.new(agent) }

      before do
        game.instance_variable_set :@agents, [ap]
        ap.x = 10
        ap.y = 10
      end

      it "fetches an action from each agent and applies it" do
        game.step
        expect(ap.x).to eq 9
        expect(ap.y).to eq 10
      end
    end
  end
end
