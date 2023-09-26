local workspace = game.Workspace
local player = game:GetService("Players")

-- local floorSize = 7

local numOfSRoom = 1
local numOfRoomOF = 4
local numOfRoomZF = 3
local numOfRoomBOF = 4
-- local numOfPath = 5
local randomFactor = Random.new()
local numOfTiles = {}
local randomSpawner

local grid_Pos = {	{30, 30},  {65, 30},  {100, 30},
					{30, 65},  {65, 65},  {100, 65},
					{30, 100}, {65, 100}, {100, 100} }
local grid_Stat_OF = {	true, true, true,
						true, true, true,
						true, true, true }
local grid_Stat_ZF = {	true, true, true,
						true, true, true,
						true, true, true }
local grid_Stat_BF = {	true, true, true,
						true, true, true,
						true, true, true }

local function SpawnRoomMaker(row, col)
	local spawnRoom = workspace.Asset_Tile.Asset_Floor.Tile_Room_SL:Clone()
	spawnRoom.Parent = workspace.Cloned_Tile.Floors.FloorZero
	spawnRoom:PivotTo(CFrame.new(row, 8.5, col))
	print("Spawned to "..spawnRoom.WorldPivot.X.." "..spawnRoom.WorldPivot.Z)
	spawnRoom.SpawnLocation.Enabled = true
end

local function RoomMaker(row, hei, col)
	local room = workspace.Asset_Tile.Asset_Floor.Tile_Room:Clone()
	if hei == 8.5 then
		room.Parent = workspace.Cloned_Tile.Floors.FloorZero
	elseif hei == 98.5 then
		room.Parent = workspace.Cloned_Tile.Floors.Upperworld
	elseif hei < 0 then
		room.Parent = workspace.Cloned_Tile.Floors.Underground
	end
	room:PivotTo(CFrame.new(row, hei, col))
end

local function PathMaker(row, hei, col)
	local path = workspace.Asset_Tile.Asset_Floor.Tile_Path:Clone()
	if hei == 8.5 then
		path.Parent = workspace.Cloned_Tile.Floors.FloorZero
	elseif hei == 98.5 then
		path.Parent = workspace.Cloned_Tile.Floors.Upperworld
	elseif hei < 0 then
		path.Parent = workspace.Cloned_Tile.Floors.Underground
	end
	path:PivotTo(CFrame.new(row, hei, col))
end

local function MapGenerate()
	local randomFactor = Random.new()
	local spawnRoomLocation = randomFactor:NextInteger(1, 9)
	
	SpawnRoomMaker(grid_Pos[spawnRoomLocation][1], grid_Pos[spawnRoomLocation][2])
	grid_Stat_ZF[spawnRoomLocation] = false
	while numOfRoomZF ~= 0 do
		spawnRoomLocation = randomFactor:NextInteger(1, 9)
		if grid_Stat_ZF[spawnRoomLocation] then
			RoomMaker(grid_Pos[spawnRoomLocation][1], 8.5, grid_Pos[spawnRoomLocation][2])
			grid_Stat_ZF[spawnRoomLocation] = false
			numOfRoomZF -= 1
		end
	end
	for i = 1, 9 do
		if grid_Stat_ZF[i] then
			PathMaker(grid_Pos[i][1], 8.5, grid_Pos[i][2])
			grid_Stat_ZF[i] = false
		end
	end
	
	while numOfRoomOF ~= 0 do
		spawnRoomLocation = randomFactor:NextInteger(1, 9)
		if grid_Stat_OF[spawnRoomLocation] then
			RoomMaker(grid_Pos[spawnRoomLocation][1], 98.5, grid_Pos[spawnRoomLocation][2])
			grid_Stat_OF[spawnRoomLocation] = false
			numOfRoomOF -= 1
		end
	end
	for i = 1, 9 do
		if grid_Stat_OF[i] then
			PathMaker(grid_Pos[i][1], 98.5, grid_Pos[i][2])
			grid_Stat_OF[i] = false
		end
	end
	
	while numOfRoomBOF ~= 0 do
		spawnRoomLocation = randomFactor:NextInteger(1, 9)
		if grid_Stat_BF[spawnRoomLocation] then
			RoomMaker(grid_Pos[spawnRoomLocation][1], -86.5, grid_Pos[spawnRoomLocation][2])
			grid_Stat_BF[spawnRoomLocation] = false
			numOfRoomBOF -= 1
		end
	end
	for i = 1, 9 do
		if grid_Stat_BF[i] then
			PathMaker(grid_Pos[i][1], -86.5, grid_Pos[i][2])
			grid_Stat_BF[i] = false
		end
	end
	
	wait(1)
	
	local randomUpPortal = workspace.Asset_Tile.Asset_Basic.Portal_UP:Clone()
	randomUpPortal.Parent = workspace.Cloned_Tile.Portals
	for _, v in pairs(workspace.Cloned_Tile.Floors.FloorZero:GetChildren()) do
		for i, value in pairs(v:GetChildren()) do
			if value.Name:find("Tile") then
				numOfTiles[i] = value							
			end
		end
	end
	randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
	randomUpPortal.Position = numOfTiles[randomSpawner].Position + Vector3.new(0, 6, 0)
	randomUpPortal.CharacterTeleport.Enabled = true
	numOfTiles = {}
	
	local randomUpPortalDest = workspace.Asset_Tile.Asset_Basic.Portal_UpDest:Clone()
	randomUpPortalDest.Parent = workspace.Cloned_Tile.Portals
	for _, v in pairs(workspace.Cloned_Tile.Floors.Upperworld:GetChildren()) do
		for i, value in pairs(v:GetChildren()) do
			if value.Name:find("Tile") then
				numOfTiles[i] = value
			end
		end
	end
	randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
	randomUpPortalDest.Position = numOfTiles[randomSpawner].Position + Vector3.new(0, 6, 0)
	
	local randomDownPortal = workspace.Asset_Tile.Asset_Basic.Portal_Down:Clone()
	randomDownPortal.Parent = workspace.Cloned_Tile.Portals
	for _, v in pairs(workspace.Cloned_Tile.Floors.FloorZero:GetChildren()) do
		for i, value in pairs(v:GetChildren()) do
			if value.Name:find("Tile") then
				numOfTiles[i] = value							
			end
		end
	end
	randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
	randomDownPortal.Position = numOfTiles[randomSpawner].Position + Vector3.new(0, 6, 0)
	randomDownPortal.CharacterTeleport.Enabled = true
	numOfTiles = {}

	local randomDownPortalDest = workspace.Asset_Tile.Asset_Basic.Portal_DownDest:Clone()
	randomDownPortalDest.Parent = workspace.Cloned_Tile.Portals
	for _, v in pairs(workspace.Cloned_Tile.Floors.Underground:GetChildren()) do
		for i, value in pairs(v:GetChildren()) do
			if value.Name:find("Tile") then
				numOfTiles[i] = value
			end
		end
	end
	randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
	randomDownPortalDest.Position = numOfTiles[randomSpawner].Position + Vector3.new(0, 6, 0)
end

player.PlayerAdded:Connect(MapGenerate)