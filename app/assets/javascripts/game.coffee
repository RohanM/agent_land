$(document).ready ->
  canvas = document.getElementById 'game'
  ctx = canvas.getContext '2d'

  frame = ctx.createImageData 320, 200
  for i in [0..frame.data.length] by 4
    frame.data[i+0] = (i+  0) % 255
    frame.data[i+1] = (i+ 85) % 255
    frame.data[i+2] = (i+170) % 255
    frame.data[i+3] = 255
  ctx.putImageData frame, 0, 0
