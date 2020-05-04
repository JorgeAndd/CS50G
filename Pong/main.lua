push = require 'push'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  smallFont = love.graphics.newFont('font.ttf', 8)
  love.graphics.setFont(smallFont)
  
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })
end

function love.keypressed(key)
  if key == 'escape' then
      love.event.quit()
  end
end

function love.draw()
  push:apply('start')

  -- clear screen with color
  love.graphics.clear(0.16, 0.18, 0.20, 1)

  -- draw welcome text at the top of the screen
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

  -- draw left paddle
  love.graphics.rectangle('fill', 10, 30, 5, 20)

  -- draws right paddle
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

  -- draws ball
  love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

  push:apply('end')
end


