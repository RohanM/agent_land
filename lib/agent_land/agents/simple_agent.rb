require 'agent_land/agents/agent_base'
require 'agent_land/actions/move_action'

module AgentLand
  class SimpleAgent < AgentBase
    def act!(state, world)
      MoveAction.new rand(4)
    end
  end
end
