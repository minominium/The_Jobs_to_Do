repeat wait() until game.Players.LocalPlayer.Character
local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("TurnChange")

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")
local workspace = game.Workspace
local turnIndicator = workspace.Asset_Tile.Asset_Basic.TurnIndicator
humanoid.AutoRotate = false

local playerModule = require(player.PlayerScripts:WaitForChild("PlayerModule"))
local controls = playerModule:GetControls()
local runService = game:GetService("RunService")
runService:UnbindFromRenderStep("ControlScriptRenderstep")
local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input)
	remoteEvent.OnClientEvent:Connect(function(turnCheck)
		workspace.Etc.WhosTurn.Value = tostring(turnCheck)
	end)
	if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.D then
		if workspace.Etc.WhosTurn.Value == "Player" then
		--if turnIndicator.BrickColor == BrickColor.new("Really black") then
			turnIndicator.BrickColor = BrickColor.new("Toothpaste")
			local playerCFrame = character.HumanoidRootPart.CFrame
			local humanoidPOS = character.HumanoidRootPart.Position
			local destination = humanoidPOS
			
			if input.KeyCode == Enum.KeyCode.W then
				character.HumanoidRootPart.CFrame = CFrame.lookAt(humanoidPOS, humanoidPOS + Vector3.new(0, 0, -1))
				destination += Vector3.new(0, 0, -5)
			elseif input.KeyCode == Enum.KeyCode.S then
				character.HumanoidRootPart.CFrame = CFrame.lookAt(humanoidPOS, humanoidPOS + Vector3.new(0, 0, 1))
				destination += Vector3.new(0, 0, 5)
			elseif input.KeyCode == Enum.KeyCode.A then
				character.HumanoidRootPart.CFrame = CFrame.lookAt(humanoidPOS, humanoidPOS + Vector3.new(-1, 0, 0))
				destination += Vector3.new(-5, 0, 0)
			elseif input.KeyCode == Enum.KeyCode.D then
				character.HumanoidRootPart.CFrame = CFrame.lookAt(humanoidPOS, humanoidPOS + Vector3.new(1, 0, 0))
				destination += Vector3.new(5, 0, 0)
			end
			--while 
			humanoid:MoveTo(destination)
			humanoid.MoveToFinished:Wait(0.1)
			character.HumanoidRootPart.CFrame = CFrame.new(destination + Vector3.new(0, 0, 0)) * (character.HumanoidRootPart.CFrame - character.HumanoidRootPart.Position)
			workspace.Etc.WhosTurn.Value = "PeacefulR"
			remoteEvent:FireServer(tostring(workspace.Etc.WhosTurn.Value))
		end
	else
		print("Wrong input")
	end
end)
