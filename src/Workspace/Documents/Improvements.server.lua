--[[
-------------------------------------------------------------------------------------
More things to improve in this project
20230630 ~ 20230721
-------------------------------------------------------------------------------------
1. Tile based moving system
-- Current State --------------------------------------------------------------------
=== Basic moving
^^^^ Character can move 1 tile(5 Studs) per button input
zzzzz MoveTo(tile) -> CFraming Position/Orientation of HumanoidRootPart
^^^^ THE FIRST Desination is exactly fine.
     But from the second, it goes wrong slightly, but incrementally.
=== Wall malfunctions Moving System
^^^^ It IS necessary but it has malfunctioning moving system.
^^^^ When character "reaches" wall parts, entire moving system is gone wrong
     because of twisting CFrame of HumanoidRootPart.
     
-- Improvements ---------------------------------------------------------------------
=== In present system, it's BASICALLY IMPOSSIBLE to moving by tiles.
=== Making character to reach EXACT position is required, at least.
=== RayCast may be the key to solve

2. NPC Moving
-- Current State --------------------------------------------------------------------
=== Moving by tiles, in NPC's turn
=== Going "into" wall is problem. Maybe pathFindingService is the key, but no time

-- Improvements ---------------------------------------------------------------------
=== Use pathFindingService

]]--