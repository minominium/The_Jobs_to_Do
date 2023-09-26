local portalUp = script.Parent
local portalUpDest = game.Workspace.Cloned_Tile.Portals:WaitForChild("Portal_UpDest")
local isTouched = false

portalUp.Touched:Connect(function(part)
	if not isTouched then
		print("PortalUp Touched")
		isTouched = true
		local partParent = part.Parent
		partParent.HumanoidRootPart.CFrame = CFrame.new(portalUpDest.Position)
	end	
end)

portalUp.TouchEnded:Connect(function()
	isTouched = false
end)