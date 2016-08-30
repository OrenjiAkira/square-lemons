

return function(seconds, doing, doing_params, done, done_params)
    --[[ Timer (float, function, function) ]]
    local obj = {}

    -- private
    local fcount = 0
    local frametime = seconds * GLOBALS.framerate
    local go = false

    function obj:update()
        if go then
            fcount = fcount + 1
            if fcount < frametime then
                doing(doing_params)
            else
                done(done_params)
                obj.stop()
                return true
            end
        end
    end

    function obj.start()
        go = true
    end

    function obj.pause()
        go = false
    end

    function obj.stop()
        go = false
        fcount = 0
    end

    function obj.is_running()
        return go
    end

    return obj
end
