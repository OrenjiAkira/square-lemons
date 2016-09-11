
local Direction = {}
local CONSTS = {}

-- Contants
CONSTS.UP         = UTILITY.Vector:new{  0, -1 }
CONSTS.RIGHT      = UTILITY.Vector:new{  1,  0 }
CONSTS.DOWN       = UTILITY.Vector:new{  0,  1 }
CONSTS.LEFT       = UTILITY.Vector:new{ -1,  0 }
CONSTS.UP_LEFT    = UTILITY.Vector:new{  0, -1 }
CONSTS.UP_RIGHT   = UTILITY.Vector:new{  1,  0 }
CONSTS.DOWN_RIGHT = UTILITY.Vector:new{  0,  1 }
CONSTS.DOWN_LEFT  = UTILITY.Vector:new{ -1,  0 }
CONSTS.UP_LEFT = CONSTS.UP_LEFT:normalized()
CONSTS.UP_RIGHT = CONSTS.UP_RIGHT:normalized()
CONSTS.DOWN_RIGHT = CONSTS.DOWN_RIGHT:normalized()
CONSTS.DOWN_LEFT = CONSTS.DOWN_LEFT:normalized()

-- guarantee that elements are unchangeable
function CONSTS.__index(t, attr)
  local mt = getmetatable(t)
  assert(mt[attr], "Invalid direction name. Try: 'UP', 'RIGHT', 'DOWN', 'LEFT', 'UP_LEFT', 'UP_RIGHT', 'DOWN_RIGHT', 'DOWN_LEFT'")
  return mt[attr]:clone()
end
setmetatable(Direction, CONSTS)

return Direction
