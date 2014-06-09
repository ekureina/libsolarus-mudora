libsolarus-zelda
------------

A Solarus Lua Library for common zelda-based game entities and other things.

-----------------
Table of Contents
-----------------

1. Usage
2. Entities

  2.1 Arrow


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

-------------
2.1 Arrow
-------------

The arrow has the properties max_dist, speed, and angle.  They can be set or returned using setter and getter functions.
The only event defined is on_update(), which moves the arrow.