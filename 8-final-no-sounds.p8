pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
function _init()
  panda = player(64, 112, 1)
  panda_ball = ball(64, 64 , 4)

  actors = {
    panda,
    panda_ball
  }
end

function _update()
  for actor in all(actors) do
    actor:update()
  end

  -- Check for collisions
  if panda_ball.position.y >= 112 then
    if panda_ball.position.x >= panda.position.x - 5 and
       panda_ball.position.x <= panda.position.x + 13 then
      panda_ball.acceleration.y *= -1
    else
      panda_ball:reset()
    end
  end
end

function _draw()
  cls()
  rectfill(0,0,128,128,12)
  map(0,0,0,0)

  for actor in all(actors) do
    actor:draw()
  end
end

ball = function(x, y, sprite)
  local b_table = {}

  b_table.position = { x = x, y = y }
  b_table.acceleration = { x = 1.5, y = -1 }
  b_table.sprite = sprite

  b_table.update = function(this)
    -- check X bounds
    if this.position.x <= 0 or this.position.x >= 120 then
      this.acceleration.x *= -1
    end

    -- check Y bounds
    if this.position.y <= 0 then
      this.acceleration.y *= -1
    end

    this.position.x += this.acceleration.x
    this.position.y += this.acceleration.y
  end

  b_table.draw = function(this)
    spr(this.sprite, this.position.x, this.position.y)
  end

  b_table.reset = function(this)
    this.position = { x = 64, y = 64 }
    this.acceleration = { x = 1.5, y = -1 }
  end

  return b_table
end

player = function(x, y, sprite)
  local p_table = {}
  
  p_table.position = { x = x, y = y }
  p_table.sprite = sprite

  p_table.update = function(this)
    -- If the left key is pressed
    if btn(0) then
      this.position.x -= 2
    end

    -- If the right key is pressed
    if btn(1) then
      this.position.x += 2
    end
  end
  
  p_table.draw = function(this)
    spr(this.sprite, this.position.x, this.position.y)
  end

  return p_table
end

__gfx__
0000000000500500ffffffffcccccccc006666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000777700ffffffffcccccccc067777600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000757500ffffffffcccccccc677777760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700055777755ffffffffcccccccc677777760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000555500ffffffffcccccccc677777760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000777700f5f5f5f5cccccccc677777760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005775005f5f5f5fcccccccc067777600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000050050055555555cccccccc006666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
