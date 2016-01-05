App.cable.subscriptions.create "GameChannel",
  connected: ->
    @perform "run_game"

  received: (data) ->
    console.log data
    world = new World
    world.draw data.world