class GamesController < ApplicationController
  def new
    ActionCable.server.broadcast "game_notifications", {my: 'data'}
  end
end
