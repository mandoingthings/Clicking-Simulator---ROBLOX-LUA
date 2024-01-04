local RepSt= game:GetService("ReplicatedStorage")
local ClickEvent = RepSt:WaitForChild("ClickEvent")
local Player = game.Players.LocalPlayer
local waitTime = false
script.Parent.MouseButton1Click:Connect(function()
	if waitTime == false then
		waitTime = true
		ClickEvent:FireServer()
		wait(0.05)
		waitTime = false
	end
end)
