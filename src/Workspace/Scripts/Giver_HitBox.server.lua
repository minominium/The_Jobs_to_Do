local players = game:GetService("Players")

local function HitBoxMaker(character)
	if character then
		local hitBox = Instance.new("Part")
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		hitBox.CanCollide = false
		hitBox.Transparency = 1
		hitBox.Name = "HitBox"
		hitBox.Parent = character
		hitBox.Massless = true
		hitBox.Material = Enum.Material.Plastic
		hitBox.Size = Vector3.new(4.8, 5, 4.8)
		hitBox.CFrame = CFrame.new(humanoidRootPart.Position)
		hitBox.Anchored = true
		wait(0.1)
		
		local weld = Instance.new("WeldConstraint")
		weld.Parent = hitBox
		weld.Part0 = hitBox
		weld.Part1 = humanoidRootPart
		weld.Enabled = true
		wait(0.1)
		
		hitBox.Anchored = false
	end
end

players.PlayerAdded:Connect(function(plr)
	plr.CharacterAppearanceLoaded:Connect(HitBoxMaker)
end)
