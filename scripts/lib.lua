-- A lua script that allows reuse of solarus code
lib = {}

-- Add a library to the search path
-- Library can now be invoked by require().
function lib.add (lib_loc)
  package.path = package.path .. ";" .. lib_loc
end