require 'agent_land/game'

class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_notifications"
  end

  def run_game
    game = AgentLand::Game.new

    while game.running?
      game.step

      broadcast_game_state game
    end
  end


  private

  def broadcast_game_state game
    broadcast_world_state game
    broadcast_agents_state game
  end

  def broadcast_world_state game
    broadcast type: 'world_state', world: game.world_data
  end

  def broadcast_agents_state game
    broadcast type: 'agents_state', agents: game.agents_data
  end

  def broadcast(data)
    ActionCable.server.broadcast "game_notifications", data
  end

end
