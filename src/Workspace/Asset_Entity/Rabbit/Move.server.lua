wait(3)

local peacefulEntityRabbit = script.Parent
local Humanoid = peacefulEntityRabbit:WaitForChild("Humanoid")
local destination = peacefulEntityRabbit.HumanoidRootPart.Position

local randomSeed = Random.new()
local movingTo = {Vector3.new(0, 0, -5), Vector3.new(0, 0, 5), Vector3.new(-5, 0, 0), Vector3.new(5, 0, 0)}
local turnIndicator = game.Workspace.Asset_Tile.Asset_Basic.TurnIndicator
local path = game:GetService("PathfindingService"):CreatePath({AgentRadius = 5, AgentHeight = 0, AgentCanJump = false, Costs = {}})

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("TurnChange")
local isMyTurn = game.Workspace.Etc:WaitForChild("TurnCheckValue").Value

while true do
	isMyTurn = game.Workspace.Etc:WaitForChild("TurnCheckValue").Value
	if isMyTurn == "PeacefulR" then
		if Humanoid.Health < 1 then
			game.Workspace.Etc.WhosTurn.Value = "PeacefulC"
			game.Workspace.Etc.TurnCheckValue.Value = "PeacefulC"
		else
			local randomDest = randomSeed:NextInteger(1, 4)
			peacefulEntityRabbit.HumanoidRootPart.CFrame = CFrame.lookAt(peacefulEntityRabbit.HumanoidRootPart.Position, peacefulEntityRabbit.HumanoidRootPart.Position + (movingTo[randomDest] / 5))
			destination += movingTo[randomDest]
			Humanoid:MoveTo(destination)
			Humanoid.MoveToFinished:Wait(0.1)
			peacefulEntityRabbit.HumanoidRootPart.CFrame = CFrame.new(destination + Vector3.new(0, 0, 0)) * (peacefulEntityRabbit.HumanoidRootPart.CFrame - peacefulEntityRabbit.HumanoidRootPart.Position)
			game.Workspace.Etc.WhosTurn.Value = "PeacefulC"
			game.Workspace.Etc.TurnCheckValue.Value = "PeacefulC"
		end
	end
	remoteEvent:FireAllClients(game.Workspace.Etc.TurnCheckValue.Value)

	wait(1)
end