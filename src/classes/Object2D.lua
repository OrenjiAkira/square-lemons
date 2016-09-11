
-- dependencies
local print = print
local UTILITY = UTILITY
local CLASSES = CLASSES

-- class declaration
local Object2D = LUX.class:new{}

Object2D:inherit(CLASSES.Object)
function Object2D:instance(_ENV, x, y)
  self:super(_ENV)
  --[[ Object2D (table) ]]

  -- public
  EPSILON = 1e-5 -- const, do not change
  pos = UTILITY.Vector:new{ x or 0, y or 0 }

end

return Object2D
