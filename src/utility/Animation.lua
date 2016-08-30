

return function(quads, seconds, loop)
    --[[ Animation (table, float, function) ]]
    local obj = {}

    -- public
    obj.step = seconds or 0.1
    obj.loopable = loop or false
    obj.current_frame = 0
    -- private
    local frames = quads
    local animation_length = #frames
    local fcount = 0
    local play = false

    local function reset()
        fcount = 0
    end
    local function next()
        if obj.loopable then
            obj.current_frame = (obj.current_frame + 1) % animation_length
        elseif obj.current_frame < animation_length then
            obj.current_frame = obj.current_frame + 1
        else
            obj.stop()
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
            if not frame_timer.is_running() then frame_timer.start() end
            if animation:update()           then next()              end
        end
    end

    return frames
end
