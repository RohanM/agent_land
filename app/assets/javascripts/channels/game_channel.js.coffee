App.cable.subscriptions.create "GameChannel",
  received: (data) ->
    console.log data
