-- Arrow Entity
-- Variables
local arrow = ...
--local arrow.max_dist
--local arrow.start{}
-- game must be global
local game = arrow:get_game()
local hero = game:get_hero()
--local arrow.angle
--local arrow.speed
--local arrow.dx
--local arrow.dy

-- Functions
-- Not defined: events other than on_update()

-- Initializations
function arrow:on_created()
  -- arrow.max_dist = 10
  arrow.max_speed = 0.1
  arrow.angle = 0
  arrow.dx = 1
  arrow.dy = 0
  arrow.start = {}
  arrow.start.x, arrow.start.y = arrow:get_position()

  local direction = self:get_direction()

  local sprite = self:create_sprite('entities/arrow')
  sprite:set_direction(direction)

  local m = sol.movement.create('straight')
  m:set_speed(192)
  m:set_angle(direction*math.pi/2)
  m:set_smooth(false)
  function m:on_obstacle_reached()
    sprite:set_animation('reached_obstacle')
    function sprite:on_animation_finished()
      arrow:remove()
    end
  end
  m:start(self)

  if (direction % 2 == 0) then
    -- Horizontal.
    self:set_size(16, 8);
    self:set_origin(8, 4);
  else
    -- Vertical.
    self:set_size(8, 16);
    self:set_origin(4, 8);
  end
end

-- Getters and Setters

-- max_dist
function arrow:set_max_dist(dist)
  arrow.max_dist = dist
end

function arrow:get_max_dist()
  return arrow.max_dist
end

-- Angle
function arrow:set_angle(angle)
  arrow.angle = angle
end

function arrow:get_angle()
  return arrow.angle
end

-- speed
function arrow:set_speed(speed)
  arrow.speed = speed
  arrow.dx = arrow.speed * math.cos(arrow.angle)
end

function arrow:get_speed()
  return arrow.speed
end

-- On update
-- function arrow:on_update()
--   local x, y = arrow:get_position()
--   local distance = sol.main.get_distance(arrow.start.x, arrow.start.y, x, y)
--   if distance < arrow.max_dist then
--     arrow:set_position(x + arrow.dx, y + arrow.dy)
--   else
--     arrow:remove()
--   end
-- end
