local players = game:GetService("Players")
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")
local workspace = game.Workspace

players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		runService.Heartbeat:Connect(function()
			local newSky = Instance.new("Sky")
			if humanoidRootPart.Position.Y < 0 then
				newSky = workspace.Asset_Sky:FindFirstChild("Desert night skybox"):Clone()
			elseif humanoidRootPart.Position.Y > 50 then
				newSky = workspace.Asset_Sky:FindFirstChild("Heaven Sky"):Clone()
			else
				newSky = workspace.Asset_Sky:FindFirstChild("Desert Sky"):Clone()
			end
			newSky.Parent = lighting
			lighting:FindFirstChild("Sky"):Destroy()
			newSky.Name = "Sky"
		end)
	end)
end)