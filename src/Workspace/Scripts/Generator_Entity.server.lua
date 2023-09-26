local workspace = game.Workspace
local player = game:GetService("Players")

local peacefulEntityCommon = 1
local peacefulEntityRabbit = 2
local hostileEntity = 2

local randomFactor = Random.new()
local numOfTiles = {}
local randomSpawner

local function EntityGenerate()
	wait(0.1)
	for _, v in pairs(workspace.Asset_Entity:GetChildren()) do
		if v.Name == "Common" then
			for i = 1, peacefulEntityCommon do
				local npcRandomSpawn = workspace.Asset_Entity.Common:Clone()
				npcRandomSpawn.Move.Enabled = true
				npcRandomSpawn.Parent = workspace.Cloned_Entity.Peaceful
				for _, v in pairs(workspace.Cloned_Tile.Floors.FloorZero:GetChildren()) do
					for i, value in pairs(v:GetChildren()) do
						if value.Name:find("Tile") then
							numOfTiles[i] = value							
						end
					end
				end
				randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
				npcRandomSpawn:PivotTo(CFrame.new(numOfTiles[randomSpawner].Position + Vector3.new(0, 4.5, 0)))
				numOfTiles[randomSpawner] = 0
				print("NPC Spawned : "..tostring(npcRandomSpawn.HumanoidRootPart.Position))
				wait(0.1)
			end
		elseif v.Name == "Rabbit" then
			for i = 1, peacefulEntityRabbit do
				local rabbitRandomSpawn = workspace.Asset_Entity.Rabbit:Clone()
				rabbitRandomSpawn.Move.Enabled = true
				rabbitRandomSpawn.Parent = workspace.Cloned_Entity.Peaceful
				local temp = 1
				while temp ~= 0 do
					randomSpawner = randomFactor:NextInteger(1, #numOfTiles)
					if numOfTiles[randomSpawner] == 0 then
						temp = 1
					else
						temp = 0
					end
				end	
				rabbitRandomSpawn:PivotTo(CFrame.new(numOfTiles[randomSpawner].Position + Vector3.new(0, 1.4, 0)))
				print("Rabbit "..i.." Spawned : "..tostring(rabbitRandomSpawn.HumanoidRootPart.Position))
				wait(0.1)
			end
		end
		
	end
	
	--local randomFactor = Random.new()
	--for i = 1, peacefulEntity do
	--	local randomPosition = randomFactor:NextInteger(1, 9)
		
	--end
end

player.PlayerAdded:Connect(EntityGenerate)