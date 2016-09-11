
local love = love
local RESOURCES = RESOURCES
local CLASSES = CLASSES
local UTILITY = UTILITY
local GLOBALS = GLOBALS

local Sprite = LUX.class:new{}

function Sprite:instance(_ENV, res_name)
  --[[ Sprite (string) ]]

  local resource = RESOURCES[res_name]
  local pos = UTILITY.Vector:new{}
  local animation_player = CLASSES.AnimationPlayer(resource.animations)
  local image = resource.img
  local quad = animation_player.get_quad()
  animation_player.play()

  function set_pos(x, y)
    pos:set(x, y)
  end

  function set_state(state)
    animation_player.play(state)
  end

  function update()
    animation_player.update()
    quad = animation_player.get_quad()
  end

  function render()
    love.graphics.push()
    love.graphics.scale(GLOBALS.unit)
    love.graphics.draw(image, quad, pos.x, pos.y, 0, 1/GLOBALS.unit, 1/GLOBALS.unit, resource.offset.x, resource.offset.y, 0, 0)
    love.graphics.pop()
  end

end

return Sprite
