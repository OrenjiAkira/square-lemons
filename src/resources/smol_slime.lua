
local res = {}

res.img = love.graphics.newImage 'assets/smol-slime.png'
res.width, res.height = res.img:getDimensions()
res.offset = UTILITY.Vector:new{16, 32}
res.animations = {
  {
    name   = "idle",
    quads  = {
      love.graphics.newQuad(0*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(1*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(2*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(3*32, 0, 32, 48, res.img:getDimensions()),
    },
    step   = 0.2,
    loop   = true,
  },
  {
    default = true,
    name   = "moving",
    quads  = {
      love.graphics.newQuad(0*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(1*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(2*32, 0, 32, 48, res.img:getDimensions()),
      love.graphics.newQuad(3*32, 0, 32, 48, res.img:getDimensions()),
    },
    step   = 0.1,
    loop   = true,
  }
}

return res
