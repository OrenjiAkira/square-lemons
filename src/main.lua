
--[[

Love2D project.
I don't know what I am doing, nor why I am doing it.

]]

lux = require "lux.pack" "lux"

classes = lux.pack("classes")
resources = lux.pack("resources")
globals = require "globals"

local framedelay = 0
local framecount = 0

local test_element

function love.load()
    -- Love2D Load. Runs before everything.
    --[[
    test_element = classes.drawable()
    test_element.load("susy")
    ]]
    print(resources.susy.img)
end

function love.update(dt)
    -- Love2D Update. Updates game logic.
    framedelay = framedelay + dt
    while framedelay >= 1/globals.frameunit do
        framedelay = framedelay - 1/globals.frameunit
        framecount = framecount + 1
    end
end

function love.draw()
    -- Love2D Draw. Draws things.
end

function love.keyreleased(key)
    if key == "escape" then
        print("Frame count: ", framecount)
        print("Pseudo-time count: ", framecount/globals.framerate)
        love.event.quit()
    end
end
