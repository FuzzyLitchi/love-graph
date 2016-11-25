dots = {}

love.load = ->
  path = "Data.png"
  image_data = love.graphics.newImage(path)\getData!
  print image_data

  for x=0,image_data\getWidth!-1
    count = 0
    y_avrg = 0

    for y=0,image_data\getHeight!-1
      r, g, b, a = image_data\getPixel x, y

      if a != 0 then
        y_avrg +=y
        count +=1

    y_avrg = y_avrg / count
    table.insert dots, {x:x,y:y_avrg}

  print("done")

love.update = (dt) ->

love.draw = ->
  for k,v in pairs(dots)
    love.graphics.circle("fill", v.x, v.y, 3)
