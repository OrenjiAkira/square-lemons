
-- dependencies
local print = print
local UTILITY = UTILITY
local CLASSES = CLASSES
local GLOBALS = GLOBALS

-- class declaration
local Body = LUX.class:new{}

Body:inherit(CLASSES.Object2D)
function Body:instance(_ENV, x, y)
  self:super(_ENV, x, y)
  --[[ Body (_ENV, x, y) ]]

  -- private
  local speed = UTILITY.Vector:new{}
  local speedlimitter = 0.8
  local acc = 1*GLOBALS.frameunit

  local function check_speedlimit()
    if speed*speed > EPSILON*EPSILON then
      speed:scale(speedlimitter)
    else
      speed:set(0)
    end
  end

  function move(dir)
    local direction = UTILITY.Direction[dir]
    direction:scale(acc)
    speed:add(direction)
  end

  function update()
    check_speedlimit()
    pos = pos + speed
    print(speed)
  end

end

return Body
