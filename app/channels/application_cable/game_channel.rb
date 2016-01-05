class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_notifications"
  end

  def run_game
    ActionCable.server.broadcast "game_notifications", {my: 'data'}
  end
end
