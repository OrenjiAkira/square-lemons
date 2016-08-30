
--[[

Love2D project.
I don't know what I am doing, nor why I am doing it.

]]

-- Utility

local framedelay = 0
local framecount = 0

function love.load()
    -- Love2D Load. Load stuff here.

    -- Useful low-level stuff
    LUX     = require 'lux.pack' 'lux'
    UTILITY = LUX.pack('utility')
    UTILITY.Vector  = require 'lux.geom.Vector'

    -- Game Globals and Types
    GLOBALS = require 'globals'
    CLASSES = LUX.pack('classes')
end

function love.update(dt)
    -- Love2D Update. Updates game logic.
    framedelay = framedelay + dt
    while framedelay >= GLOBALS.frameunit do
        framedelay = framedelay - GLOBALS.frameunit
        framecount = framecount + 1

        -- Game logic here
        
    end
end

function love.draw()
    love.graphics.scale(unit)
    -- Love2D Draw. Draws things.
end

function love.keyreleased(key)
    -- Debug exit
    if key == 'escape' then
        print("Frame count: ", framecount)
        print("Pseudo-time count: ", framecount/GLOBALS.framerate)
        love.event.quit()
    end
end
