

return function(quads, seconds, loop)
  --[[ Animation (table, float, function) ]]
  local obj = {}

  -- public
  obj.step = seconds or 0.1
  obj.loopable = loop or false
  obj.current_frame = 1
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
    if obj.loopable then
      obj.current_frame = (obj.current_frame % animation_length) + 1
      print("next frame:", obj.current_frame)
    elseif obj.current_frame < animation_length then
      print("next frame! no loop")
      obj.current_frame = obj.current_frame + 1
    else
      obj.stop()
      finished = true
    end
  end

  local frame_timer = UTILITY.Timer(obj.step, GLOBALS.null_function, nil, next, nil)

  function obj.play()
    play = true
  end

  function obj.stop()
    play = false
    reset()
  end

  function obj.pause()
    play = false
  end

  function obj:getFrame()
    return frames[obj.current_frame]
  end

  function obj:update()
    if play then
      print("animating...")
      if not frame_timer.is_running() then
        frame_timer.start()
      elseif frame_timer:update() then
        frame_timer.stop()
      end
    end
  end

  return obj
end
