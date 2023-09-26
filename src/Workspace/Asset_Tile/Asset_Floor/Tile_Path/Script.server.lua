local tilePath = script.Parent

for i, v in pairs(tilePath:GetChildren()) do
	if v:IsA("BasePart") then
		if string.find(v.Name, "Tile") then
			v.Touched:Connect(function(part)
				local partParent = part.Parent
				local humanoid = partParent:FindFirstChild("Humanoid")
				humanoid.MoveToFinished:Wait(0.1)
				partParent.HumanoidRootPart.CFrame = CFrame.new((v.Position + Vector3.new(0, 4.5, 0)) * (partParent.HumanoidRootPart.CFrame - partParent.HumanoidRootPart.Position))
			end)
		end
	end
end