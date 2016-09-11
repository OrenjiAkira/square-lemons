
-- dependencies
local table = table
local love = love
local RESOURCES = RESOURCES
local GLOBALS = GLOBALS

-- class declaration
local Room = LUX.class:new{}

function Room:instance(_ENV, res_name)
  --[[ Room (string) ]]

  -- private
  local resource = RESOURCES[res_name]
  local spritebatch = love.graphics.newSpriteBatch(resource.img, 1024, 'static')
  local tiles = resource.tiles
  local width, height = #tiles, #tiles[1]
  local tiledata = resource.tiledata

  -- initialisation
  for i=1, width do
    local row = tiles[i]
    for j=1, height do
      local tile = tiles[i][j]
      if tile ~= 0 then
        spritebatch:add(tiledata[tile], j-1, i-1, 0, 1/GLOBALS.unit, 1/GLOBALS.unit)
      end
    end
  end

  -- draw
  function render()
    love.graphics.push()
    love.graphics.scale(GLOBALS.unit)
    love.graphics.draw(spritebatch, 0, 0)
    love.graphics.pop()
  end
end

return Room
