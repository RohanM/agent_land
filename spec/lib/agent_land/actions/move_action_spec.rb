require 'ostruct'
require 'agent_land/actions/move_action'

module AgentLand
  describe MoveAction do
    describe "movement" do
      let(:game) { double(:game, world: double(:world, width: 3, height: 3)) }
      let(:ap) { OpenStruct.new x: 1, y: 1 }

      it "moves north" do
        MoveAction.new(MoveAction::NORTH).from(ap).apply(game)
        expect(ap.x).to eq 1
        expect(ap.y).to eq 0
      end

      it "moves east" do
        MoveAction.new(MoveAction::EAST).from(ap).apply(game)
        expect(ap.x).to eq 2
        expect(ap.y).to eq 1
      end

      it "moves south" do
        MoveAction.new(MoveAction::SOUTH).from(ap).apply(game)
        expect(ap.x).to eq 1
        expect(ap.y).to eq 2
      end

      it "moves west" do
        MoveAction.new(MoveAction::WEST).from(ap).apply(game)
        expect(ap.x).to eq 0
        expect(ap.y).to eq 1
      end
    end

    describe "world boundaries" do
      let(:game) { double(:game, world: double(:world, width: 1, height: 1)) }
      let(:ap) { OpenStruct.new x: 0, y: 0 }

      [MoveAction::NORTH, MoveAction::EAST, MoveAction::SOUTH, MoveAction::WEST].each do |direction|
        it "bounds direction #{direction}" do
          MoveAction.new(direction).from(ap).apply(game)
          expect(ap.x).to eq 0
          expect(ap.y).to eq 0
        end
      end
    end
  end
end
