local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
local SelectedItem = "Med Kit"
local Damange = 5
local namecall
local ScriptLoaded = false
local LocalPlayer = game:GetService("Players").LocalPlayer
local Lighting = game:GetService("Lighting")
local OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
local OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
local ModifiedWalkspeed = 50
local ModifiedJumpPower = 100
local OriginalBrightness = Lighting.Brightness
local OriginalFog = Lighting.FogEnd
local OriginalShadow = Lighting.GlobalShadows
local HailClone = game:GetService("Workspace").Hails:Clone()
getgenv().RemoveSlipping = false
getgenv().SemiGodmode = false
    -- Remove Slipping Handler
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'IceSlip' and RemoveSlipping == true then
			return task.wait(387420489)
		end
		return old(self, unpack(args))
	end)

    -- Semi-Godmode Handler
	namecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'Energy' then
			if SemiGodmode == true then
				if args[1] < 0 then
					args[1] = 0
				end
			else
				args[1] = args[1]
			end
			return namecall(self, unpack(args))
		end
		return namecall(self, ...)
	end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Breaking Blitz",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Admin Commands",
   LoadingSubtitle = "by Blitz01",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
if game.PlaceId ~= 13864667823 then
	if game.PlaceId == 14775231477 or game.PlaceId == 13864661000 then
    local Tab = Window:CreateTab("Free Characters", "rewind")
    local Button = Tab:CreateButton({
   Name = "Hacker Role",
   Callback = function()
   game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Phone", true, false)
   end,
})
    local Button = Tab:CreateButton({
   Name = "Nerd Kid Role",
   Callback = function()
   game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Book", true, false)
   end,
})
  end
else
-- Floating Part
local Part = Instance.new("Part")
Part.Size = Vector3.new(5, 1, 5)
Part.Parent = game:GetService("Workspace")
Part.Anchored = true
Part.Transparency = 1
end
local function Notify(name, content, image, time)
  Rayfield:Notify({
   Title = name,
   Content = content,
   Duration = time,
   Image = image,
})
end
local function Delete(Instance)
	pcall(function()
		Events:WaitForChild("OnDoorHit"):FireServer(Instance)
	end)
end
local function UnequipAllTools()
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = LocalPlayer.Backpack
		end
	end
end
local function EquipAllTools()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = LocalPlayer.Character
		end
	end
end
local function GiveItem(Item)
	if Item == "Armor" then
		Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
	elseif Item == "Crowbar 1" or Item == "Crowbar 2" or Item == "Bat" or Item == "Pitchfork" or Item == "Hammer" or Item == "Wrench" or Item == "Broom" then
		Events.Vending:FireServer(3, tostring(Item:gsub(" ", "")), "Weapons", LocalPlayer.Name, 1)
		Notify('Credits To', "Leo Dicap On V3rmillion For Making This Feature!", 'rbxassetid://4483345998', 3)
	else
		Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
	end
end
local function GetBestTool()
	for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
		if v.Name:match("Circle") and v.Visible == true then
			GiveItem(tostring(v.Name:gsub("Circle", "")))
		end
	end
end
local function Train(Ability)
	Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
end
local function TakeDamange(Amount)
	Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
end
local function TeleportTo(CFrameArg)
	LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameArg
end
local function GiveAll()
	GetBestTool()
	task.wait(.1)
	GiveItem("Armor")
	task.wait(.1)
	for i = 1, 5 do
		Train("Speed")
		Train("Strength")
	end
	task.wait(.1)
	UnequipAllTools()
	for i = 1, 15 do
		GiveItem("Gold Pizza")
		task.wait(0.05)
	end
end
local function HealAllPlayers()
	UnequipAllTools()
	task.wait(.2)
	GiveItem("Golden Apple")
	task.wait(.5)
	LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
	task.wait(.5)
	Events:WaitForChild("HealTheNoobs"):FireServer()
end
local function HealYourself()
	GiveItem("Pizza")
	Events.Energy:FireServer(25, "Pizza")
end
local function BreakBarricades()
	for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
		for i = 1, 20 do
			if v:FindFirstChild("TreeHitPart") then
				Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
			end
		end
	end
end
local function BreakEnemies()
	pcall(function()
		for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
			v:FindFirstChild("Humanoid", true).Health = 0
		end
		for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
			v:FindFirstChild("Humanoid", true).Health = 0
		end
		for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
			v:FindFirstChild("Humanoid", true).Health = 0
		end
	end)
end
local function KillEnemies()
	pcall(function()
		for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
			Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
		end
		for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
			Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
		end
		for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
			Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
		end
		if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
			Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
		end
		if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
			Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
		end
	end)
end
local function GetDog()
	for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
		if v.Name:match("Circle") and v.Visible == true then
			GiveItem(tostring(v.Name:gsub("Circle", "")))
			task.wait(.1)
			LocalPlayer.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = LocalPlayer.Character
			TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
			task.wait(.5)
			Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
		end
	end
	task.wait(2)
	for i = 1, 3 do
		TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
		task.wait(.1)
	end
end
local function GetAgent()
	GiveItem("Louise")
	task.wait(.1)
	LocalPlayer.Backpack:WaitForChild("Louise").Parent = LocalPlayer.Character
	Events:WaitForChild("LouiseGive"):FireServer(2)
end
local function GetUncle()
	GiveItem("Key")
	task.wait(.1)
	LocalPlayer.Backpack:WaitForChild("Key").Parent = LocalPlayer.Character
	wait(.5)
	Events.KeyEvent:FireServer()
end
local function ClickPete()
	fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
end
local function CollectCash()
	for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
			firetouchinterest(v, LocalPlayer.Character.HumanoidRootPart, 0)
		end
	end
end
local function GetAllOutsideItems()
	TeleportTo(CFrame.new(-199.240555, 30.0009422, -790.182739, 0.08340507, 2.48169538e-08, 0.996515751, -2.7112752e-09, 1, -2.46767993e-08, -0.996515751, -6.43658127e-10, 0.08340507))
	for i, v in pairs(game:GetService("Workspace").OutsideParts:GetChildren()) do
		fireclickdetector(v.ClickDetector)
	end
	LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-10, 0, 0))
end
local function BringAllEnemies()
	pcall(function()
		for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
			v.HumanoidRootPart.Anchored = true
			v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
		end
		for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
			v.HumanoidRootPart.Anchored = true
			v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
		end
			
		for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
			v.HumanoidRootPart.Anchored = true
			v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
		end
	end)
end
local function Noclip(State)
	LocalPlayer.Character.HumanoidRootPart.CanCollide = State
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("MeshPart") then
			v.CanCollide = State
		end
	end
end
local function GetSecretEnding()
	for i, v in next, SecretEndingTable do
		Events.LarryEndingEvent:FireServer(v, true)
	end
end
local function GetGAppleBadge()
	if game:GetService("Workspace"):FindFirstChild("FallenTrees") then
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
		task.wait(1)
		TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		task.wait(.5)
		fireclickdetector(game:GetService("Workspace").GoldenApple.ClickDetector)
	else
		Notify("Error", "Golden Apple Has Not Spawned Yet, Please Wait Until the First Wave.", 'rbxassetid://4483345998', 3)
	end
end
local function AntiMud(Touchable)
	for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
		if v.Name == "Mud" and v:IsA("Part") then
			if Touchable == true then
				v.CanTouch = false
			else 
				v.CanTouch = false
			end
		end
	end
end
local function SSAntiWind()
	if game:GetService("Workspace"):FindFirstChild("WavePart") then
		Delete(game:GetService("Workspace").WavePart)
	end
end
local function AntiWind()
	if game:GetService("Workspace"):FindFirstChild("WavePart") then
		game:GetService("Workspace").WavePart.CanTouch = false
	end
end
-- Main Script / GUI
local GBTab = Window:CreateTab("Game Breaking", 4483345998)
local Label = GBTab:CreateLabel("Server-Side Deletion", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Button = GBTab:CreateButton({
   Name = "Delete The Game",
   Callback = function()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			Delete(v)
		end
   end,
})
local Button2 = GBTab:CreateButton({
   Name = "Delete The House",
   Callback = function()
		for i, v in pairs(game:GetService("Workspace").TheHouse:GetChildren()) do
			if v.Name ~= "FloorLayer" then
				Delete(v)
			end
		end
   end,
})
local Label2 = GBTab:CreateLabel("Humanoid Deletion", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Input = GBTab:CreateInput({
   Name = "Delete Player's Humanoid",
   CurrentValue = "",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      Delete(game:GetService("Workspace")[Value])
   end,
})
local Button3 = GBTab:CreateButton({
   Name = "Delete Other's Humanoid",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v.Name ~= tostring(game:GetService("Players").LocalPlayer.Name) then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name), true))
			end
		end
   end,
})
local Button3 = GBTab:CreateButton({
   Name = "Delete Everyone's Humanoid",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name), true))
		end
   end,
})
local Label3 = GBTab:CreateLabel("Limbs Deletion", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Input2 = GBTab:CreateInput({
   Name = "Delete Player's Limbs",
   CurrentValue = "",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftHand)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftFoot)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftLowerArm)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftLowerLeg)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftUpperArm)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LeftUpperLeg)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightFoot)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightHand)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightLowerArm)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightLowerLeg)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightUpperArm)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).RightUpperLeg)
   end,
})
local Button4 = GBTab:CreateButton({
   Name = "Delete Other's Limbs",
   Callback = function()
   	for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v.Name ~= tostring(game:GetService("Players").LocalPlayer.Name) then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftHand)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftFoot)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftLowerArm)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftLowerLeg)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftUpperArm)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftUpperLeg)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightFoot)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightHand)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightLowerArm)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightLowerLeg)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightUpperArm)
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightUpperLeg)
			end
		end
   end,
})
local Button5 = GBTab:CreateButton({
   Name = "Delete Everyone's Limbs",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftHand)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftFoot)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftLowerArm)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftLowerLeg)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftUpperArm)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LeftUpperLeg)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightFoot)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightHand)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightLowerArm)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightLowerLeg)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightUpperArm)
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).RightUpperLeg)
		end
   end,
})
local Label4 = GBTab:CreateLabel("Character Freezing", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Input3 = GBTab:CreateInput({
   Name = "Freeze Player",
   CurrentValue = "",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Input3",
   Callback = function(Text)
		pcall(function()
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).LowerTorso)
		end)
   end,
})
local Button6 = GBTab:CreateButton({
   Name = "Freeze Other's Characters",
   Callback = function()
  	for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v.Name ~= tostring(game:GetService("Players").LocalPlayer.Name) and v:FindFirstChild("LowerTorso") then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LowerTorso)
			end
		end
   end,
})
local Button7 = GBTab:CreateButton({
   Name = "Freeze Everyone's Characters",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v:FindFirstChild("LowerTorso") then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LowerTorso)
			end
		end
   end,
})
local Label5 = GBTab:CreateLabel("Kill Players", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Input4 = Tab:CreateInput({
   Name = "Kill Player",
   CurrentValue = "",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Input4",
   Callback = function(Text)

   end,
})
