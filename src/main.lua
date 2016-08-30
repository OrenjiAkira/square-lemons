
--[[

Love2D project.
I don't know what I am doing, nor why I am doing it.

]]

-- Utility
lux     = require 'lux.pack' 'lux'
Vector  = require 'lux.geom.Vector'

-- Globals
globals = nil

local framedelay = 0
local framecount = 0

function love.load()
    -- Love2D Load. Load stuff here.
    globals = require 'globals'
end

function love.update(dt)
    -- Love2D Update. Updates game logic.
    framedelay = framedelay + dt
    while framedelay >= globals.frameunit do
        framedelay = framedelay - globals.frameunit
        framecount = framecount + 1
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
        print("Pseudo-time count: ", framecount/globals.framerate)
        love.event.quit()
    end
end
