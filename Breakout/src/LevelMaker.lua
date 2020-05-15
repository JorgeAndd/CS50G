LevelMaker = Class{} 

function LevelMaker.createMap(level)
  local bricks = {}
  local numRows = math.random(1, 5)
  local numCols = math.random(7, 13)

  for y = 1, numRows do
    for x = 1, numCols do
      b = Brick(
        -- x-coordinate
        (x-1)                   -- decrement x by 1 because tables are 1-indexed, coords are 0
        * 32                    -- multiply by 32, the brick width
        + 8                     -- the screen should have 8 pixels of padding; we can fit 13 cols + 16 pixels total
        + (13 - numCols) * 16,  -- left-side padding for when there are fewer than 13 columns
        
        y * 16                  -- just use y * 16, since we need top padding anyway
      ) 

      table.insert(bricks, b)
    end
  end 

  return bricks
end