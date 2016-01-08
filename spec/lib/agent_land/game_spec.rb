require 'rails_helper'
require 'agent_land/game'

module AgentLand
  describe Game do
    let(:game) { Game.new }

    it "initialises a world" do
      expect(game.world).to be_a World
      expect(game.world.data).not_to be_empty
    end
  end
end
