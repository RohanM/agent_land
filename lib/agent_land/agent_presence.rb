module AgentLand
  class AgentPresence
    attr_accessor :x, :y

    def initialize(agent)
      @agent = agent
    end

    def act!(game)
      @agent.
        act!(state, game.world.dup).
        from(self)
    end

    def state
      {}
    end

    def placed?
      x.present? && y.present?
    end
  end
end
