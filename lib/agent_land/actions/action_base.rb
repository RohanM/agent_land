module AgentLand
  class ActionBase
    def from(agent_presence)
      @agent_presence = agent_presence
      self
    end

    # Actions are implemented by overriding this method
    # They will have access to @agent_presence (the AP executing the action)
    # and the game within which the action is occurring.
    def apply(game)
    end
  end
end
