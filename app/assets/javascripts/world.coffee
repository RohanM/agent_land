class @World
  colours: [
    [0,   255,   0, 255] # GRASS
    [255, 255,   0, 255] # FOOD
    [128, 128, 128, 255] # ROCK
    [0,     0, 255, 255] # WATER
  ]

  draw: (data) ->
    canvas = document.getElementById 'game'
    ctx = canvas.getContext '2d'

    frame = ctx.createImageData 320, 200

    num_cols = data.length
    num_rows = data[0].length
    for row in [0...num_rows]
      for col in [0...num_cols]
        cell = data[col][row]
        e = (col + (row * num_cols)) * 4

        frame.data[e+0] = @colours[cell][0]
        frame.data[e+1] = @colours[cell][1]
        frame.data[e+2] = @colours[cell][2]
        frame.data[e+3] = @colours[cell][3]

    ctx.putImageData frame, 0, 0
