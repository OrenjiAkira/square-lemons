

-- dependencies
local print = print
local UTILITY = UTILITY
local GLOBALS = GLOBALS

-- class declaration
local Animation = LUX.class:new{}

function Animation:instance(_ENV, quads, seconds, loop)
  --[[ Animation (table, float, function) ]]

  -- public
  step = seconds or 0.1
  loopable = loop or false
  current_frame = 1
  -- private
  local frames = quads
  local animation_length = #frames
  local fcount = 0
  local play = false
  local finished = false

  local function reset()
    fcount = 0
  end

  local function next()
    if loopable then
      current_frame = (current_frame % animation_length) + 1
      print("next frame:", current_frame)
    elseif current_frame < animation_length then
      print("next frame! no loop")
      current_frame = current_frame + 1
    else
      stop()
      finished = true
    end
  end

  local frame_timer = UTILITY.Timer(step, GLOBALS.null_function, {}, next, {})

  function start()
    play = true
  end

  function stop()
    play = false
    reset()
  end

  function pause()
    play = false
  end

  function getFrame()
    return frames[current_frame]
  end

  function update()
    if play then
      print("animating...")
      if not frame_timer.is_running() then
        frame_timer.start()
      elseif frame_timer:update() then
        frame_timer.stop()
      end
    end
  end

end

return Animation
