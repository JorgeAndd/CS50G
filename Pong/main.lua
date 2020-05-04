push = require 'push'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  smallFont = love.graphics.newFont('font.ttf', 8)
  scoreFont = love.graphics.newFont('font.ttf', 32)

  love.graphics.setFont(smallFont)
  
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })

  player1Score = 0
  player2Score = 0

  player1Y = 30
  player2Y = VIRTUAL_HEIGHT - 50
end

function love.update(dt)
  -- player 1 movement
  if love.keyboard.isDown('w') then
    player1Y = player1Y - PADDLE_SPEED * dt
  elseif love.keyboard.isDown('s') then
    player1Y = player1Y + PADDLE_SPEED * dt
  end

  -- player 2 movement
  if love.keyboard.isDown('up') then
    player2Y = player2Y - PADDLE_SPEED * dt
  elseif love.keyboard.isDown('down') then
    player2Y = player2Y + PADDLE_SPEED * dt
  end
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
  love.graphics.setFont(smallFont)
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

  -- draw score
  love.graphics.setFont(scoreFont)
  love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
  love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

  -- draw left paddle
  love.graphics.rectangle('fill', 10, player1Y, 5, 20)

  -- draws right paddle
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)

  -- draws ball
  love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

  push:apply('end')
end


