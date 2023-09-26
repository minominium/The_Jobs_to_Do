local tool = script.Parent

local function onTouch(partOther)
	local humanOther = partOther.Parent:FindFirstChild("HitBox")
	print(partOther.Parent.Name.."  "..tostring(partOther.Name))
	if humanOther and humanOther.Parent ~= tool.Parent then
		print("Scythe Check")
		partOther.Parent:FindFirstChild("Humanoid"):TakeDamage(100)
	end
end

tool.Activated:Connect(function()
	tool.Handle.CanTouch = true
	local value = Instance.new("StringValue")
	value.Name = "toolanim"
	value.Value = "Slash" -- try also: Lunge
	value.Parent = tool
	wait(1)
	tool.Handle.CanTouch = false
end)

tool.Handle.Touched:Connect(onTouch)
