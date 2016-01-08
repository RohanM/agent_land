require 'agent_game/game'

class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_notifications"
  end

  def run_game
    game = AgentGame::Game.new

    while game.running?
      game.step
      broadcast_world_state game.world
    end

  end


  private

  def broadcast_world_state world
    broadcast type: 'world_state', world: world.data
  end

  def broadcast(data)
    ActionCable.server.broadcast "game_notifications", data
  end

end
