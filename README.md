solarus-lstd
------------

A Solarus Lua Library for common game entities and other things.

-----------------
Table of Contents
-----------------

1. Usage
2. Entities
  2.1 Arrow


------------
1 Usage
------------

The lua files included are intended for (Solarus)[http://www.solarus-games.org/] quests.

At the present moment, to use the entities, you must copy the entities you would like into a folder called ```entities``` in your quest's data folder.

In the future, you may be able to just copy lib.lua, call

    require("lib")
    lib:add(path_to_scripts_folder)
    map:create_custom_entity()  -- with required fields and name of wanted entity script file as model.

That is the way that makes the most sense to me.

-------------
2 Entities
-------------

The following entities are currently implemented:
Arrow -> builtin_arrow.lua

-------------
2.1 Arrow
-------------

The arrow has the properties max_dist, speed, and angle.  They can be set or returned using setter and getter functions.
The only event defined is on_update(), which moves the arrow.