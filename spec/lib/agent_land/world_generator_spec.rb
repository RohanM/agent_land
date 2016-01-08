require 'agent_land/world_generator'

module AgentLand
  describe WorldGenerator do
    describe "initialization" do
      let(:width) { 3 }
      let(:height) { 4 }
      let(:wg) { WorldGenerator.new(3, 4) }

      it "calculates the diagonal length of the world" do
        expect(wg.instance_variable_get(:@diagonal)).to eq 5
      end

      it "clears the world, making it a grassland of the correct dimensions" do
        wg.send(:clear)

        expect(wg.data.count).to eq width
        expect(wg.data[0].count).to eq height

        all_grass = wg.data.all? { |col| col.all? { |cell| cell == WorldGenerator::GRASS } }
        expect(all_grass).to be true
      end

      describe "adding terrain" do
        it "adds a number of patches"
        it "adds a square of a particular terrain type"
        it "sets a cell to a particular terrain type, ignoring OOB"
      end
    end
  end
end
