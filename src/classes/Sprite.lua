
local RESOURCES = LUX.pack('resources')

return function(res_name)
    local obj = {}

    local resource = RESOURCES[res_name]
    local pos = UTILITY.Vector:new{}
    local animation_player = CLASSES.AnimationPlayer(resource.animations)
    local image = resource.img
    local quad

    function obj.load()
        animation_player.load()
        quad = animation_player.get_quad()
    end

    function obj.set_pos(x, y)
        pos:set(x, y)
    end

    function obj.set_state(state)
        animation_player.play(state)
    end

    function obj:update()
        animation_player:update()
        quad = animation_player.get_quad()
    end

    function obj:render()
        love.graphics.push()
        love.graphics.scale(GLOBALS.unit)
        love.graphics.draw(image, quad, pos.x, pos.y, 0, 1/GLOBALS.unit, 1/GLOBALS.unit, resource.offset.x, resource.offset.y, 0, 0)
        love.graphics.pop()
    end

    return obj
end
