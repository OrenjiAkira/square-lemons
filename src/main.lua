
--[[

Love2D project.
I don't know what I am doing, nor why I am doing it.

]]

-- Utility
love.filesystem.getRequirePath "lux.macro.takeover"

local framedelay = 0
local framecount = 0

local test_image
local test_room
local test_body

function love.load()
  -- Love2D Load. Load stuff here.

  -- Useful low-level stuff
  LUX   = require 'lux.pack' 'lux'
  UTILITY = LUX.pack('utility')
  UTILITY.Vector  = require 'lux.geom.Vector'

  -- Game Globals and Types
  GLOBALS = require 'globals'
  RESOURCES = LUX.pack('resources')
  CLASSES = LUX.pack('classes')

  test_body = CLASSES.Body()
  test_image = CLASSES.Sprite('smol_slime')
  test_body.pos:set(GLOBALS.game_width/4, GLOBALS.game_height/2)

  test_room = CLASSES.Room('room_basic')
end

function love.update(dt)
  -- Love2D Update. Updates game logic.
  framedelay = framedelay + dt
  while framedelay >= GLOBALS.frameunit do
    framedelay = framedelay - GLOBALS.frameunit
    framecount = framecount + 1

    -- Game logic here
    test_body.update()
    test_image.pos:set(test_body.pos:unpack())
    test_image.update()
  end
end

function love.draw()
  -- Love2D Draw. Draws things.
  test_room.render()
  test_image.render()
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
