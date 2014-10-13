-- Slippery Ice Entity
-- Variables
local slip_ice = ...
local game = slip_ice:get_game()
local hero = game:get_hero()
local travent = {"dynamic_tile","teletransporter","destination",
  "pickable","destructible","carried_object","chest","shop_treasure",
  "enemy","npc","jumper","switch","sensor","separator","wall","crystal",
  "crystal_block","stream","door","stairs","bomb","explosion","fire",
  "arrow","hookshot","boomerang","custom_entity"}
local sspeed = 200 --Set how fast entities slide
local colsound = 'running_obstacle'
local ssound = 'ice_slide'
local sstates = {"forced walking","running","pulling","pushing"} -- Hero states that warrant sliding

-- Functions
-- Set all non "block" or "hero" entities to not be traversable
function slip_ice:set_traversables()
  for i=1,27
    slip_ice:set_traversable_by(travent[i], false) 
  end
end

function slip_ice:slide(collision_entity)
  local state = hero:get_state()
  local slide = false
  for i,v in ipairs(sstates) do  -- Should the entity slide?
    if state == v then
      slide = true
    end
  end
  if (slide == true) then  -- Check slide status
    if (collision_entity:get_type() == "hero") then
      collision_entity:freeze()
    end
    local direction = hero:get_direction()
    local m = sol.movement.create('straight')
    m:set_speed(sspeed)
    m:set_angle(direction*math.pi/2) --Set angle (convert to rad)
    m:set_smooth(false)
    function m:on_obstacle_reached()
      if (collision_entity:get_type() == "hero") then
        collision_entity:unfreeze()
      end
      m:stop()
      sol.audio.play_sound(colsound) -- Play collision sound
    end
    m:start(collision_entity)
    sol.audio.play_sound(ssound)
  end
end

-- Initializations
function slip_ice:on_created()
  slip_ice:set_traversables()
  slip_ice:add_collision_test("containing",slip_ice:slide(collision_entity))
end