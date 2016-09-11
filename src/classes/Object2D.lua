
-- dependencies
local print = print
local UTILITY = UTILITY

local Object2D = LUX.class:new{}

function Object2D:instance(_ENV, x, y)
  --[[ Object2D (table) ]]

  -- public
  EPSILON = 0.01 -- const, do not change
  pos = UTILITY.Vector:new{ x or 0, y or 0 }
  -- private
  local speed = UTILITY.Vector:new{}

  function update()
  end

  function render()
  end

end

return Object2D
