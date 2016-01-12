App.cable.subscriptions.create "GameChannel",
  game: new Game

  connected: ->
    @perform "run_game"

  received: (data) ->
    console.log data
    if data.type == 'world_state'
      @game.updateWorld data.world
      @game.render()
    else if data.type == 'agents_state'
      @game.updateAgents data.agents
      @game.render()
