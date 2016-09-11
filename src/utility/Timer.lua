
-- dependencies
local GLOBALS = GLOBALS
local unpack = unpack

-- class declaration
local Timer = LUX.class:new{}

function Timer:instance(_ENV, seconds, doing, doing_params, done, done_params)
  --[[ Timer (float, function, table, function, table) ]]

  -- private
  local fcount = 0
  local frametime = seconds * GLOBALS.framerate
  local go = false

  function start()
    go = true
  end

  function pause()
    go = false
  end

  function stop()
    go = false
    fcount = 0
  end

  function is_running()
    return go
  end

  -- update
  function update()
    if go then
      fcount = fcount + 1
      if fcount < frametime then
        doing(unpack(doing_params))
      else
        done(unpack(done_params))
        stop()
        return true
      end
    end
  end

end

return Timer
