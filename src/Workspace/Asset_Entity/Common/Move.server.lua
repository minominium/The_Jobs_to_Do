wait(3)

local peacefulEntityCommon = script.Parent
local Humanoid = peacefulEntityCommon:WaitForChild("Humanoid")

local randomSeed = Random.new()
local movingTo = {Vector3.new(0, 0, -5), Vector3.new(0, 0, 5), Vector3.new(-5, 0, 0), Vector3.new(5, 0, 0)}
local turnIndicator = game.Workspace.Asset_Tile.Asset_Basic.TurnIndicator
local destination = peacefulEntityCommon.HumanoidRootPart.Position
local path = game:GetService("PathfindingService"):CreatePath({AgentRadius = 5, AgentHeight = 0, AgentCanJump = false, Costs = {}})

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("TurnChange")
local isMyTurn = game.Workspace.Etc:WaitForChild("TurnCheckValue").Value

while true do
	isMyTurn = game.Workspace.Etc:WaitForChild("TurnCheckValue").Value
	if isMyTurn == "PeacefulC" then
		if Humanoid.Health < 1 then
			game.Workspace.Etc.WhosTurn.Value = "Player"
			game.Workspace.Etc.TurnCheckValue.Value = "Player"
		else
			local randomDest = randomSeed:NextInteger(1, 4)
			peacefulEntityCommon.HumanoidRootPart.CFrame = CFrame.lookAt(peacefulEntityCommon.HumanoidRootPart.Position, peacefulEntityCommon.HumanoidRootPart.Position + (movingTo[randomDest] / 5))
			destination += movingTo[randomDest]
			Humanoid:MoveTo(destination)
			Humanoid.MoveToFinished:Wait(0.1)
			peacefulEntityCommon.HumanoidRootPart.CFrame = CFrame.new(destination + Vector3.new(0, 0, 0)) * (peacefulEntityCommon.HumanoidRootPart.CFrame - peacefulEntityCommon.HumanoidRootPart.Position)
			game.Workspace.Etc.WhosTurn.Value = "Player"
			game.Workspace.Etc.TurnCheckValue.Value = "Player"
		end		
	end
	remoteEvent:FireAllClients(game.Workspace.Etc.TurnCheckValue.Value)

	wait(1)
end