
-- dependencies
local print = print
local UTILITY = UTILITY
local CLASSES = CLASSES


local Body = LUX.class:new{}

Body:inherit(CLASSES.Object2D)
function Body:instance(_ENV, x, y)
  self:super(_ENV, x, y)
  --[[ Body (_ENV, x, y) ]]

  -- private
  local speed = UTILITY.Vector:new{}
  local speedlimitter = 0.8

  -- initialisation
  speed:set(3,0)

  local function check_speedlimit()
    if speed*speed > EPSILON then
      speed:scale(speedlimitter)
    else
      speed:set(0)
    end
  end

  function update()
    check_speedlimit()
    pos = pos + speed
    print(speed)
  end

end

return Body
