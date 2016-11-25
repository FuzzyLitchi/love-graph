local dots = { }
love.load = function()
  local path = "Data.png"
  local image_data = love.graphics.newImage(path):getData()
  print(image_data)
  for x = 0, image_data:getWidth() - 1 do
    local count = 0
    local y_avrg = 0
    for y = 0, image_data:getHeight() - 1 do
      local r, g, b, a = image_data:getPixel(x, y)
      if a ~= 0 then
        y_avrg = y_avrg + y
        count = count + 1
      end
    end
    y_avrg = y_avrg / count
    table.insert(dots, {
      x = x,
      y = y_avrg
    })
  end
  return print("done")
end
love.update = function(dt) end
love.draw = function()
  for k, v in pairs(dots) do
    love.graphics.circle("fill", v.x, v.y, 3)
  end
end
