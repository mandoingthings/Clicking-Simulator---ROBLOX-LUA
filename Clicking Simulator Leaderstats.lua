local DataStoreService = game:GetService("DataStoreService")
local PlayerData = DataStoreService:GetDataStore("PlayerData")

game.Players.PlayerAdded:Connect(function(Player)

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = Player

	local PlayerStats = Instance.new("Folder")
	PlayerStats.Name = "PlayerStats"
	PlayerStats.Parent = Player
	
	
	local Cash = Instance.new("NumberValue")
	Cash.Value = 0
	Cash.Name = "Cash"
	Cash.Parent = leaderstats
	
	
	local Clicks = Instance.new("NumberValue")
	Clicks.Value = 0
	Clicks.Name = "Clicks"
	Clicks.Parent = PlayerStats
	
	
	local TimePlayed = Instance.new("NumberValue")
	TimePlayed.Value = 0
	TimePlayed.Name = "TimePlayed"
	TimePlayed.Parent = PlayerStats
	
	local Gene = Instance.new("NumberValue")
	Gene.Value = 0
	Gene.Name = "Gene"
	Gene.Parent = PlayerStats
	
	local ClickUpgrade = Instance.new("NumberValue")
	ClickUpgrade.Value = 1
	ClickUpgrade.Name = "ClickUpgrade"
	ClickUpgrade.Parent = PlayerStats
	
	local AddedMultipler = Instance.new("NumberValue")
	AddedMultipler.Value = 1
	AddedMultipler.Name = "AddedMultipler"
	AddedMultipler.Parent = PlayerStats
	
	local Rebirth = Instance.new("NumberValue")
	Rebirth.Value = 1
	Rebirth.Name = "Rebirth"
	Rebirth.Parent = leaderstats
	
	
	
	
	local DataSet = Instance.new("BoolValue")
	DataSet.Value = false
	DataSet.Name = "DataSet"
	DataSet.Parent = PlayerStats

	

	local Data
	local Success, Failure = pcall(function()
		Data = PlayerData:GetAsync(Player.UserId)
	end)
	
	if Success and Data then
		if Data[1] then
			Cash.Value = Data[1]
		end
		if Data[2] then
			Clicks.Value = Data[2]
		end
		if Data[3] then
			TimePlayed.Value = Data[3]
		end
		if Data[4] then
			--Gene.Value = Data[4]
		end
		if Data[5] then
			ClickUpgrade.Value = Data[5]
		end
		if Data[6] then
			Rebirth.Value = Data[6]
		end
		
		DataSet.Value = true
	end
	
	
	
	local RepSt= game:GetService("ReplicatedStorage")
	local ClickEvent = RepSt:WaitForChild("ClickEvent")
	
	ClickEvent.OnServerEvent:Connect(function()
		Clicks.Value = Clicks.Value + ((1 * ClickUpgrade.Value) * Rebirth.Value) 
	end)
	
	
end)

game.Players.PlayerRemoving:Connect(function(Player)

	local leaderstats = Player:FindFirstChild("leaderstats")
	local PlayerStats = Player:FindFirstChild("PlayerStats")
	
	-- Data
	
	local Cash = leaderstats:FindFirstChild("Cash")
	local Clicks = PlayerStats:FindFirstChild("Clicks")
	local TimePlayed = PlayerStats:FindFirstChild("TimePlayed")
	local Gene = PlayerStats:FindFirstChild("Gene")
	local ClickUpgrade = PlayerStats:FindFirstChild("ClickUpgrade")
	local Rebirth = leaderstats:FindFirstChild("Rebirth")

	
	-- Data
	
	local Data = {
		
		-- Data Values
		Cash.Value,
		Clicks.Value,
		TimePlayed.Value,
		Gene.Value,
		ClickUpgrade.Value,
		Rebirth.Value
		
		-- Data Values
		
	}
	
	
	local Success, Failure = pcall(function()
		PlayerData:SetAsync(Player.UserId, Data)

	end)
	
	if Success then
		
	else
		print(Failure)
	end
	
end)

-- Bind to Close helps slow the leaving process, so the game can save

game:BindToClose(function()
	wait(3)
end)