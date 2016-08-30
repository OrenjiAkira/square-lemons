
local globals = {}

globals.framerate = 60
globals.frameunit = 1/globals.framerate
globals.unit = 32
globals.game_width, globals.game_weight = love.graphics.getDimensions()/globals.unit
globals.null_function = function() return end

return globals
