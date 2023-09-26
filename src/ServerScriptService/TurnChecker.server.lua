local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("TurnChange")
local workspace = game.Workspace
local turnCheckValue = Instance.new("StringValue")
turnCheckValue.Name = "TurnCheckValue"

local function onMoved(player, whoSTurn)
	print(player.Name.." Fired Server Event")
	turnCheckValue.Parent = workspace.Etc
	turnCheckValue.Value = tostring(whoSTurn)
end

remoteEvent.OnServerEvent:Connect(onMoved)