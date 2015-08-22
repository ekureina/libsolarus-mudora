local game = ...

--[[
This script is used as a workaround to be able to delete only one collision test on a custom entity.
To use it write the following in the game manager:
sol.main.load_file("scripts/collision_test_manager.lua")(game)
--]]

-- Add a collision test to an entity. Assign a name to reference to it, in case we need to stop it later.
function game:add_custom_collision_test(entity, name, collision_test, callback)
  -- Create the list of collision tests if necessary.
  if not entity.custom_collision_tests then entity.custom_collision_tests = {} end
  -- Store the info of the collision test.
  local info = {collision_test = collision_test, callback = callback}
  entity.custom_collision_tests[name] = info
  -- Create the collision test (the engine does it).
  entity:add_collision_test(collision_test, callback)
end

-- Restart custom collision tests.
function game:restart_custom_collision_tests(entity)
  -- Stop all collision tests (done by the engine).
  entity:clear_collision_tests()
  -- Re-create all the collision tests stored on the list.
  for _, info in pairs(entity.custom_collision_tests) do
    entity:add_collision_test(info.collision_test, info.callback)
  end
end

-- Remove a collision test of an entity of a given reference name.
function game:clear_custom_collision_test(entity, name)
  -- Remove info of the collision test from the list.
  entity.custom_collision_tests[name] = nil
  -- Restart collision tests.
  game:restart_custom_collision_tests(entity)
end
