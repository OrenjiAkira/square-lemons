
-- dependencies
local table = table
local love = love
local GLOBALS = GLOBALS

-- class declaration
local Tiledata = LUX.class:new{}

function Tiledata:instance(_ENV, w, h)
  --[[ Tiledata (table, float, function) ]]
  local tiledata = {}

  for i=1, w/GLOBALS.unit do
    for j=1, h/GLOBALS.unit do
      local qx, qy, qw, qh = (j-1) * GLOBALS.unit, (i-1) * GLOBALS.unit, GLOBALS.unit, GLOBALS.unit
      table.insert(tiledata, love.graphics.newQuad(qx, qy, qw, qh, w, h))
    end
  end

  function get_data(i)
    return tiledata[i]
  end

end

return Tiledata
