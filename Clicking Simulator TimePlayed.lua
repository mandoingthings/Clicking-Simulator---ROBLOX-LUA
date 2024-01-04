game.Players.PlayerAdded:Connect(function(Player)
	local leaderstats = Player:WaitForChild("leaderstats")
	local PlayerStats = Player:WaitForChild("PlayerStats")

	-- Data

	local Cash = leaderstats:WaitForChild("Cash")
	local Clicks = PlayerStats:WaitForChild("Clicks")
	local TimePlayed = PlayerStats:WaitForChild("TimePlayed")
	local DataSet = PlayerStats:WaitForChild("DataSet")
	
	DataSet.Changed:Connect(function()
		repeat
		wait(1)
			if DataSet.Value == true then		
				TimePlayed.Value = TimePlayed.Value + 1
			end
		until DataSet.Value == false
	end)
end)