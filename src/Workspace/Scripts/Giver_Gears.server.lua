local accessories = game.ServerStorage.Accessories
local tool = game.ServerStorage.Scythe
local players = game:GetService("Players")

local function GiveGear(character)
	if character then
		local shirt = character:FindFirstChildOfClass("Shirt")
		local pants = character:FindFirstChildOfClass("Pants")
		if not shirt then
			shirt = Instance.new("Shirt")
			shirt.Parent = character
		end
		if not pants then
			pants = Instance.new("Pants")
			pants.Parent = character
		end			
		
		shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=4586292486"
		pants.PantsTemplate = "http://www.roblox.com/asset/?id=4586294185"
		
		for _, item in pairs(accessories:GetChildren()) do
			if item:IsA("Accessory") then
				character:WaitForChild("Humanoid"):AddAccessory(item)
			end
		end
		character:FindFirstChildOfClass("Humanoid"):EquipTool(tool)
	end
end

players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(GiveGear)
end)