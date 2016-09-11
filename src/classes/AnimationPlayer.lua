
-- dependencies
local assert = assert
local print = print
local love = love
local UTILITY = UTILITY

local AnimationPlayer = LUX.class:new{}

function AnimationPlayer:instance(_ENV, resource_animations)
  --[[ AnimationPlayer (table) ]]

  -- private
  local animations = {}
  local current_animation_name = resource_animations[1].name
  for i=1,#resource_animations do
    print("default", resource_animations[i].default)
    animations[resource_animations[i].name] = UTILITY.Animation(resource_animations[i].quads, resource_animations[i].step, resource_animations[i].loop)
    if resource_animations[i].default then
      current_animation_name = resource_animations[i].name
    end
  end

  local function current_animation()
    return animations[current_animation_name]
  end

  function play(aname)
    if aname then
      assert(animations[aname], "Invalid animation name: " .. aname)
      current_animation_name = aname
    end
    current_animation().start()
  end

  function stop()
    current_animation().stop()
  end

  function pause()
    current_animation().pause()
  end
  
  function get_quad()
    return current_animation().getFrame()
  end

  -- update
  function update()
    print(current_animation_name)
    current_animation().update()
  end

end

return AnimationPlayer
