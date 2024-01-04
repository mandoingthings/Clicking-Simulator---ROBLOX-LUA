local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local PlayerData = DataStoreService:GetDataStore("PlayerBuyData")

local RepSt = game:GetService("ReplicatedStorage")
local MultiplierBuyEvent = RepSt:WaitForChild("MultiplierBuyEvent")

game.Players.PlayerAdded:Connect(function(Player)
	local data
	local success, failure = pcall(function()
		local encodedData = PlayerData:GetAsync(tostring(Player.UserId))
		data = encodedData and HttpService:JSONDecode(encodedData) or {}
	end)

	if success and data then
		local PlayerGui = Player:WaitForChild("PlayerGui")
		local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
		local BuyScreen = ScreenGui:WaitForChild("BuyScreen")
		local Frame = BuyScreen:WaitForChild("Frame")
		local ScrollingFrame = Frame:WaitForChild("ScrollingFrame")

		for i, v in ipairs(ScrollingFrame:GetChildren()) do
			
			if v:IsA("GuiObject") then
				for i, d in ipairs(data) do
					if d[1] == v.Name then
						v:WaitForChild("Used").Value = true
					end
				end
				
			end
		end
	end
end)

MultiplierBuyEvent.OnServerEvent:Connect(function(Player, Frame, Used)
	local leaderstats = Player:WaitForChild("leaderstats")
	local PlayerStats = Player:WaitForChild("PlayerStats")
	local Cash = leaderstats:WaitForChild("Cash")
	local PlayerGui = Player:FindFirstChild("PlayerGui")
	local ScreenGui = PlayerGui:FindFirstChild("ScreenGui")
	local BuyScreen = ScreenGui:FindFirstChild("BuyScreen")
	local Framed = BuyScreen:FindFirstChild("Frame")
	local ScrollingFrame = Framed:FindFirstChild("ScrollingFrame")
	local Frames = ScrollingFrame:FindFirstChild(Frame.Name)
	local Cash = leaderstats:FindFirstChild("Cash")
	local Clicks = PlayerStats:FindFirstChild("Clicks")
	local TimePlayed = PlayerStats:FindFirstChild("TimePlayed")
	local Gene = PlayerStats:FindFirstChild("Gene")
	local ClickUpgrade = PlayerStats:FindFirstChild("ClickUpgrade")
	local ClickMultiplier = PlayerStats:FindFirstChild("ClickMultiplier")
	
	
	Frames.Used.Value = true
	Cash.Value = Cash.Value - Frame:WaitForChild("BuyButton"):WaitForChild("Cost").Value
	ClickUpgrade.Value = Frame.Amount.Multiplier.Value
	
	for i, v in ipairs(ScrollingFrame:GetChildren()) do
		if v:IsA("GuiObject") and v:FindFirstChild("Amount"):FindFirstChild("Multiplier").Value <= Frame.Amount.Multiplier.Value then
			v:FindFirstChild("Used").Value = true
		end
	end
	
	local data = {}

	for i, v in ipairs(ScrollingFrame:GetChildren()) do
		if v:IsA("GuiObject") and v:FindFirstChild("Used").Value == true then
			
			table.insert(data, {v.Name})
		end
	end

	local success, failure = pcall(function()
		local encodedData = HttpService:JSONEncode(data)
		PlayerData:SetAsync(tostring(Player.UserId), encodedData)
	end)
	
	if failure then
		print(failure)
	end
end)

--game.Players.PlayerRemoving:Connect(function(Player)
--	local PlayerGui = Player:FindFirstChild("PlayerGui")
--	local ScreenGui = PlayerGui:FindFirstChild("ScreenGui")
--	local BuyScreen = ScreenGui:FindFirstChild("BuyScreen")
--	local Frame = BuyScreen:FindFirstChild("Frame")
--	local ScrollingFrame = Frame:FindFirstChild("ScrollingFrame")

--	local data = {}

--	for i, v in ipairs(ScrollingFrame:GetChildren()) do
--		if v:IsA("GuiObject") and v:FindFirstChild("Used").Value == true then
--			print("data")

--			table.insert(data, {v.Name})
--		end
--	end

--	local success, failure = pcall(function()
--		local encodedData = HttpService:JSONEncode(data)
--		PlayerData:SetAsync(tostring(Player.UserId), encodedData)
--	end)
--end)


--game:BindToClose(function()
--	wait(2)
--end)