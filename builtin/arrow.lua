-- Arrow Entity
-- Variables
local arrow = ...
local game = arrow:get_game()
local hero = game:get_hero()

-- Functions
-- Not defined: events other than on_update()

-- Initializations
function arrow:on_created()
  -- self.max_dist = 10
  self.max_speed = 0.1
  --self.angle = 0
  self.crystal_state_changed = false
  self.dx = 1
  self.dy = 0
  self.start = {}
  self.start.x, self.start.y = self:get_position()

  local direction = hero:get_direction()

  local sprite = self:create_sprite('entities/arrow')
  sprite:set_direction(direction)

  self:set_can_traverse('teletransporter',true)
  self:set_can_traverse('stream',true)
  self:set_can_traverse('jumper',true)
  self:set_can_traverse('crystal_block',true)
  self:set_can_traverse('npc',true)

  local m = sol.movement.create('straight')
  m:set_speed(192)
  m:set_angle(direction*math.pi/2)
  m:set_smooth(false)
  function m:on_obstacle_reached()
    sprite:set_animation('reached_obstacle')
    sol.audio.play_sound('arrow_hit')
    sol.timer.start(1500, function()
      arrow:remove()
    end)
  end
  m:start(self)
  sol.audio.play_sound('bow')

  if (direction % 2 == 0) then
    -- Horizontal.
    self:set_size(16, 8);
    self:set_origin(8, 4);
  else
    -- Vertical.
    self:set_size(8, 16);
    self:set_origin(4, 8);
  end

  self:add_collision_test("sprite",function(me,collision_entity)
    if collision_entity:get_type() == 'crystal' and not self.crystal_state_changed then
      game:get_map():change_crystal_state()
      self.crystal_state_changed = true
    else
      print(collision_entity:get_type())
    end
  end)

  self:add_collision_test("overlapping", function(me, collision_entity)
    print(collision_entity:get_type());
  end)
end

-- Getters and Setters

-- max_dist
function arrow:set_max_dist(dist)
  self.max_dist = dist
end

function arrow:get_max_dist()
  return self.max_dist
end

--[[
-- Angle
function arrow:set_angle(angle)
  self.angle = angle
end

function arrow:get_angle()
  return self.angle
end]]
