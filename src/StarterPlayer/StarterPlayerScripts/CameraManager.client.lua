local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer

local cameraOffset = Vector3.new(0,15,10)
camera.CameraType = Enum.CameraType.Scriptable

local function onRenderStep()
	if player.Character then
		local playerPosition = player.Character.HumanoidRootPart.Position
		local cameraPosition = playerPosition + cameraOffset
		
		camera.CFrame = CFrame.new(cameraPosition, playerPosition)
	end
end

runService:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value + 1, onRenderStep)