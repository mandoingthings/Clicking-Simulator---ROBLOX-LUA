script.Parent.Text = script.Parent.Multiplier.Value.. "x"


script.Parent.Multiplier.Changed:Connect(function()
	script.Parent.Text = script.Parent.Multiplier.Value.. "x"
end)
