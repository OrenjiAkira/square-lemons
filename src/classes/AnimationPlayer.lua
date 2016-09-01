

return function(resource_animations)
    --[[ AnimationPlayer (table) ]]
    local obj = {}

    -- private
    local current_animation
    local current_animation_name
    local animations = {}
    local empty = {
        name     = "__unset",
        quads    = { love.graphics.newQuad(0, 0, 0, 0, 0, 0) },
        step     = false,
        loop     = false,
    }

    local function load_animation(animation_info)
        animations[animation_info.name] = UTILITY.Animation(animation_info.quads, animation_info.step, animation_info.loop)
    end

    function obj.play(aname)
        if aname then
            assert(animations[aname], "Invalid animation name: " .. aname)
            current_animation_name = aname
            current_animation = animations[aname]
        end
        current_animation.play()
    end

    function obj.stop()
        current_animation.stop()
    end

    function obj.pause()
        current_animation.pause()
    end

    function obj.load()
        for i=1,#resource_animations do
            load_animation(resource_animations[i])
        end
        load_animation(empty)
        current_animation = animations["__unset"]
    end

    function obj:update()
        current_animation:update()
    end

    function obj.get_quad()
        print(current_animation_name)
        print(current_animation:getFrame())
        return current_animation:getFrame()
    end

    return obj
end
