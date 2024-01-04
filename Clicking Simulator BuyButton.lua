local ChangingColor = false
local Player = game.Players.LocalPlayer
local tweens = game:GetService("TweenService")
local Frame = script.Parent.Parent
local ScrollingFrame = Frame.Parent
local Used = Frame.Used
local Tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0)
script.Parent.Text = "$".. script.Parent.Cost.Value


script.Parent.Cost.Changed:Connect(function()
	script.Parent.Text = "$".. script.Parent.Cost.Value
end)


script.Parent.MouseButton1Click:Connect(function()
	local leaderstats = Player:FindFirstChild("leaderstats")
	local Cash = leaderstats:FindFirstChild("Cash")
	
	if Cash.Value >= script.Parent.Cost.Value and Used.Value == false then
		local RepSt = game:GetService("ReplicatedStorage")
		local MultiplierBuyEvent = RepSt:FindFirstChild("MultiplierBuyEvent")
		MultiplierBuyEvent:FireServer(Frame, Used)
	else
		if ChangingColor == false then
			ChangingColor = true
			local tweenre = tweens:Create(Frame, Tweeninfo, {BackgroundColor3 = Color3.new(1, 0, 0)})
			tweenre:Play()
			wait(0.55)
			ChangingColor = false
		end
			
		
	end
end)