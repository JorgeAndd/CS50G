PipePair = Class{}

local GAP_HEIGHT = 90
 
function PipePair:init(y)
  self.x = VIRTUAL_WIDTH + (math.random(20, 30) * 2)
  self.y = y

  self.pipes = {
    upper = Pipe('top', self.y),
    lower = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
  }

  self.remove = false
  self.scored = false
end

function PipePair:update(dt)
  if self.x > -PIPE_WIDTH then
    self.x = self.x - PIPE_SPEED * dt
    self.pipes.upper.x = self.x
    self.pipes.lower.x = self.x
  else
    self.remove = true
  end
end

function PipePair:render()
  self.pipes.upper:render()
  self.pipes.lower:render()
end