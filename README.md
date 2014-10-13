libsolarus-Mudora
------------

A Solarus Lua Library for common Zelda-based game entities and other things.
It is the bridge between the language of the engine and the language of game design.

-----------------
Table of Contents
-----------------

1. Usage
2. Entities

  2.1 Arrow
  2.2 Slippery Ice


------------
1 Usage
------------

The Lua files contained are most easily used as a git submodule (in a git-maintained project).
Place the submodule where you would like to, and call it from your quest.

-------------
2 Entities
-------------

The following entities are currently implemented:
Arrow -> builtin/arrow.lua
Slippery Ice -> other/slip_ice.lua

-------------
2.1 Arrow
-------------

The arrow has the properties max_dist, speed, and angle.  They can be set or returned using setter and getter functions.
The only event defined is on_update(), which moves the arrow.

----------------
2.2 Slippery Ice
----------------

Slippery Ice slides the hero or a block if either walks into it.
It uses collision testing and hero states to acomplish this.