
--[[

Love2D project.
I don't know what I am doing, nor why I am doing it.

]]

-- Utility

local framedelay = 0
local framecount = 0

local test_image

function love.load()
    -- Love2D Load. Load stuff here.

    -- Useful low-level stuff
    LUX     = require 'lux.pack' 'lux'
    UTILITY = LUX.pack('utility')
    UTILITY.Vector  = require 'lux.geom.Vector'

    -- Game Globals and Types
    GLOBALS = require 'globals'
    CLASSES = LUX.pack('classes')
    test_image = CLASSES.Sprite('smol_slime')
    test_image.load()
    test_image.set_state('moving')
    for k,v in pairs(GLOBALS) do
        print(k,v)
    end
    print()
    test_image.set_pos(GLOBALS.game_width/2, GLOBALS.game_height/2)
end

function love.update(dt)
    -- Love2D Update. Updates game logic.
    framedelay = framedelay + dt
    while framedelay >= GLOBALS.frameunit do
        framedelay = framedelay - GLOBALS.frameunit
        framecount = framecount + 1

        -- Game logic here
        test_image:update()
    end
end

function love.draw()
    -- Love2D Draw. Draws things.
    test_image:render()
end

function love.keyreleased(key)
    if key == 'left' or key == 'right' then
        test_image.set_state('idle')
    end
    if key == 'up' or key == 'down' then
        test_image.set_state('moving')
    end
    -- Debug exit
    if key == 'f8' then
        print("Frame count: ", framecount)
        print("Pseudo-time count: ", framecount/GLOBALS.framerate)
        love.event.quit()
    end
end
