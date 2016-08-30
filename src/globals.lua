
local globals = {}

globals.framerate = 60
globals.frameunit = 1/globals.framerate
globals.unit = 32
globals.gameWidth, globals.gameHeight = love.graphics.getDimensions()/globals.unit

return globals
