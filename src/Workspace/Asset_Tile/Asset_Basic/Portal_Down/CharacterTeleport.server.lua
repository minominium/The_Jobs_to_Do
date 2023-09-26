local portalDown = script.Parent
local portalDownDest = game.Workspace.Cloned_Tile.Portals:WaitForChild("Portal_DownDest")
local isTouched = false

portalDown.Touched:Connect(function(part)
	if not isTouched then
		print("PortalDown Touched")
		isTouched = true
		local partParent = part.Parent
		partParent.HumanoidRootPart.CFrame = CFrame.new(portalDownDest.Position)
	end
end)

portalDown.TouchEnded:Connect(function()
	isTouched = false
end)