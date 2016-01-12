require 'rails_helper'
require 'agent_land/agent_presence'

describe World do
  let(:world) { World.new data: data }
  let(:data) { [[World::FOOD, World::ROCK], [World::WATER, World::GRASS]] }
  let(:ap) { AgentLand::AgentPresence.new(nil) }

  describe "placing agents" do
    # Because this is non-deterministic, run 10 times to gain confidence
    10.times do |i|
      it "places agent presences on grass (trial #{i})" do
        world.place ap

        expect(ap.x).to eq 1
        expect(ap.y).to eq 1
      end
    end

    describe "checking placement validity" do
      it "reports non-placement as invalid" do
        ap = double(:agent_presence, placed?: false)
        expect(world.send(:placement_valid?, ap)).to be false
      end

      it "reports non-grass placement as invalid" do
        [[0, 0], [0, 1], [1, 0]].each do |p|
          ap = double(:agent_presence, placed?: true, x: p[0], y: p[1])
          expect(world.send(:placement_valid?, ap)).to be false
        end
      end

      it "reports grass placement as valid" do
        ap = double(:agent_presence, placed?: true, x: 1, y: 1)
        expect(world.send(:placement_valid?, ap)).to be true
      end
    end

    it "places an agent presence randomly" do
      ap = OpenStruct.new
      world.send(:place_randomly, ap)
      expect(ap.x).to be >= 0
      expect(ap.y).to be >= 0
      expect(ap.x).to be < 2
      expect(ap.y).to be < 2
    end
  end

  describe "reporting width and height" do
    let(:data) { [[World::FOOD, World::ROCK], [World::WATER, World::GRASS], [World::ROCK, World::ROCK]] }

    it "reports width and height" do
      expect(world.width).to eq 3
      expect(world.height).to eq 2
    end
  end
end
