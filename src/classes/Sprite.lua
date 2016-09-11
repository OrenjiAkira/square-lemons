
-- dependencies
local love = love
local RESOURCES = RESOURCES
local CLASSES = CLASSES
local UTILITY = UTILITY
local GLOBALS = GLOBALS

-- class declaration
local Sprite = LUX.class:new{}

Sprite:inherit(CLASSES.Object2D)
function Sprite:instance(_ENV, res_name)
  self:super(_ENV)
  --[[ Sprite (string) ]]

  -- private
  local resource = RESOURCES[res_name]
  local animation_player = CLASSES.AnimationPlayer(resource.animations)
  local image = resource.img
  local quad = animation_player.get_quad()

  -- initialisation
  animation_player.play()

  function set_state(state)
    animation_player.play(state)
  end

  -- update
  function update()
    animation_player.update()
    quad = animation_player.get_quad()
  end

  -- draw
  function render()
    love.graphics.push()
    love.graphics.scale(GLOBALS.unit)
    love.graphics.draw(image, quad, pos.x, pos.y, 0, 1/GLOBALS.unit, 1/GLOBALS.unit, resource.offset.x, resource.offset.y, 0, 0)
    love.graphics.pop()
  end

end

return Sprite
