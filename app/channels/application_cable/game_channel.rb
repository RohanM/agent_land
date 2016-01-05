require 'agent_game/world'

class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_notifications"
  end

  def run_game
    world = AgentGame::World.new 320, 200
    broadcast_world_state world
  end


  private

  def broadcast_world_state world
    broadcast type: 'world_state', world: world.data
  end

  def broadcast(data)
    ActionCable.server.broadcast "game_notifications", data
  end

end
