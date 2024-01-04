if script.Parent.Used.Value == true then
	script.Parent.BuyButton.Transparency = 1
	script.Parent.Active = false
	script.Parent.BackgroundColor3 = Color3.new(0,0,0)
else
	script.Parent.BuyButton.Transparency = 0
	script.Parent.Active = true
	script.Parent.BackgroundColor3 = Color3.new(1,1,1)
end

script.Parent.Used.Changed:Connect(function()
	if script.Parent.Used.Value == true then
		script.Parent.BuyButton.Transparency = 1
		script.Parent.Active = false
		script.Parent.BackgroundColor3 = Color3.new(0,0,0)
	else
		script.Parent.BuyButton.Transparency = 0
		script.Parent.Active = true
		script.Parent.BackgroundColor3 = Color3.new(1,1,1)
	end

end)
