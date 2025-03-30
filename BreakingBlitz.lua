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
--Tables
local ItemsTable = {
	"Crowbar 1",
	"Crowbar 2",
	"Bat",
	"Pitchfork",
	"Hammer",
	"Wrench",
	"Broom",
	"Armor",
	"Med Kit",
	"Key",
	"Gold Key",
	"Louise",
	"Lollipop",
	"Chips",
	"Golden Apple",
	"Pizza",
	"Gold Pizza",
	"Rainbow Pizza",
	"Rainbow Pizza Box",
	"Book",
	"Phone",
	"Cookie",
	"Apple",
	"Bloxy Cola",
	"Expired Bloxy Cola",
	"Bottle",
	"Ladder",
	"Battery"
}
local SecretEndingTable = {
	"HatCollected",
	"MaskCollected",
	"CrowbarCollected"
}
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
local GBButton = GBTab:CreateButton({
   Name = "Delete The Game",
   Callback = function()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			Delete(v)
		end
   end,
})
local GBButton2 = GBTab:CreateButton({
   Name = "Delete The House",
   Callback = function()
		for i, v in pairs(game:GetService("Workspace").TheHouse:GetChildren()) do
			if v.Name ~= "FloorLayer" then
				Delete(v)
			end
		end
   end,
})
local Section = Tab:CreateSection("Humanoid Deletion")
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
local Button4 = GBTab:CreateButton({
   Name = "Delete Everyone's Humanoid",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name), true))
		end
   end,
})
local Section2 = Tab:CreateSection("Limbs Deletion")
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
local Button5 = GBTab:CreateButton({
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
local Button6 = GBTab:CreateButton({
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
local Section3 = Tab:CreateSection("Character Freezing")
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
local Button7 = GBTab:CreateButton({
   Name = "Freeze Other's Characters",
   Callback = function()
  	for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v.Name ~= tostring(game:GetService("Players").LocalPlayer.Name) and v:FindFirstChild("LowerTorso") then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LowerTorso)
			end
		end
   end,
})
local Button8 = GBTab:CreateButton({
   Name = "Freeze Everyone's Characters",
   Callback = function()
		for i, v in pairs(game:GetService("Players"):GetChildren()) do
			if v:FindFirstChild("LowerTorso") then
				Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).LowerTorso)
			end
		end
   end,
})
local Section4 = Tab:CreateSection("Kill Players")
local Input4 = GBTab:CreateInput({
   Name = "Kill Player",
   CurrentValue = "",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Input4",
   Callback = function(Text)
	Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).Head)
	Delete(game:GetService("Workspace"):FindFirstChild(tostring(Value)).UpperTorso)
   end,
})
local Button9 = GBTab:CreateButton({
   Name = "Kill Others",
   Callback = function()
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
	    if v.Name ~= tostring(game:GetService("Players").LocalPlayer.Name) then
		pcall(function()
		   Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).Head)
		   Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).UpperTorso)
	      end)
	   end
	end
   end,
})
local Button10 = GBTab:CreateButton({
   Name = "Kill Everyone",
   Callback = function()
   for i, v in pairs(game:GetService("Players"):GetChildren()) do
	pcall(function()
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).Head)
		Delete(game:GetService("Workspace"):FindFirstChild(tostring(v.Name)).UpperTorso)
	end)
	end
   end,
})
local Section5 = Tab:CreateSection("Delete Models")
local Button11 = GBTab:CreateButton({
   Name = "Delete Treadmills",
   Callback = function()
   Delete(game:GetService("Workspace").Tredmills)
   end,
})
local Button12 = GBTab:CreateButton({
   Name = "Delete Benches",
   Callback = function()
   Delete(game:GetService("Workspace").BenchPresses)
   end,
})
local Button13 = GBTab:CreateButton({
   Name = "Delete TV",
   Callback = function()
   Delete(game:GetService("Workspace").TheHouse.Projector)
   end,
})
local Button14 = GBTab:CreateButton({
   Name = "Delete Vending Machines",
   Callback = function()
   Delete(game:GetService("Workspace").VendingMachines)
   end,
})
local Button15 = GBTab:CreateButton({
   Name = "Delete Boss Room",
   Callback = function()
   Delete(game:GetService("Workspace").Final.BossRoom)
   end,
})
local Section6 = GBTab:CreateSection("Delete Enemies")
local Button16 = GBTab:CreateButton({
   Name = "Delete Bad Guys",
   Callback = function()
   for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
	Delete(v)
   end
   for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
	Delete(v)
   end
   for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
	Delete(v)
   end
   end,
})
local Button17 = GBTab:CreateButton({
   Name = "Delete Pizza Miniboss",
   Callback = function()
   Delete(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true))
   end,
})
local Button18 = GBTab:CreateButton({
   Name = "Delete Brute",
   Callback = function()
   Delete(game:GetService("Workspace").BadGuyBrute)
   end,
})
local Button19 = GBTab:CreateButton({
   Name = "Delete Scary Mary",
   Callback = function()
   if game:GetService("Workspace"):FindFirstChild("Villainess") then
	Delete(game:GetService("Workspace").Villainess)
   else
	Notify('Warning', "Scary Mary Is Already Deleted Or Boss Fight Hasnt Started!", 'rbxassetid://4483345998', 7)
   end
   end,
})
local Button20 = GBTab:CreateButton({
   Name = "Delete Scary Larry",
   Callback = function()
   if game:GetService("Workspace"):FindFirstChild("BigBoss") then
	Delete(game:GetService("Workspace").BigBoss)
   else
	Notify('Warning', "Scary Larry Is Already Deleted Or Boss Fight Hasnt Started!", 'rbxassetid://4483345998', 7)
   end
   end,
})
local Section7 = GBTab:CreateSection("Weather Modifications")
local Toggle = GBTab:CreateToggle({
   Name = "Remove Wind For Everyone",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   getgenv().NoWindSS = Value
   while NoWindSS == true do
	SSAntiWind() 
	task.wait(.1)
   end
   end,
})
local Button21 = GBTab:CreateButton({
   Name = "Remove Ice For Everyone",
   Callback = function()
	Delete(game:GetService("Workspace").Terrain)
   end,
})
local Button22 = GBTab:CreateButton({
   Name = "Remove Hailing For Everyone",
   Callback = function()
	Delete(game:GetService("Workspace").Hails)
   end,
})
local Button23 = GBTab:CreateButton({
   Name = "Remove Mud For Everyone",
   Callback = function()
   for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
	if v.Name == "Mud" and v:IsA("Part") then
		Delete(v)
	    end
	end
   end,
})
local OPTab = Window:CreateTab("Overpowered", "rewind")
local Section8 = OPTab:CreateSection("Item Giver")
local Paragraph = OPTab:CreateParagraph({Title = "Note:", Content = "Getting/Spamming Multiple Of 1 Type Of Items May Cause The Item To Break And Be Unuseable/Unequippable.\nIt Is Recommended To Only Grab 1 Item At Once, Especially If Its An Item Everyone Can Use."})
local Dropdown = OPTab:CreateDropdown({
   Name = "Item",
   Options = ItemsTable,
   CurrentOption = {"Med Kit"},
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Options)
	if Value == 'Book' or Value == 'Phone' then
		Notify('Warning', Value .. " Wont Work Unless You Own The Corresponding Gamepass.", 'rbxassetid://4483345998', 7)
	end
	SelectedItem = Value
   end,
})
local Button24 = OPTab:CreateButton({
   Name = "Give Item",
   Callback = function()
   	GiveItem(SelectedItem)
   end,
})
local Label2 = OPTab:CreateLabel("Training", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Button25 = OPTab:CreateButton({
   Name = "Train Strength",
   Callback = function()
   	Train("Strength")
   end,
})
local Button26 = OPTab:CreateButton({
   Name = "Train Speed",
   Callback = function()
   	Train("Speed")
   end,
})
local Button27 = OPTab:CreateButton({
   Name = "Heal Yourself",
   Callback = function()
   	for i = 1, 10 do
	   HealYourself()
	end
   end,
})
local Toggle2 = OPTab:CreateToggle({
   Name = "Loop Heal Yourself",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
	getgenv().HealLoop = Value
	while HealLoop do
	HealYourself()
	task.wait(.1)
	end
   end,
})
local Label3 = OPTab:CreateLabel("Heal All", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Button28 = OPTab:CreateButton({
   Name = "Heal All",
   Callback = function()
   	HealAllPlayers()
   end,
})
local Toggle3 = OPTab:CreateToggle({
   Name = "Loop Heal Yourself",
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(Value)
	getgenv().HealAllLoop = Value
	while HealLoop do
	HealAllPlayers()
	task.wait(3)
	end
   end,
})
local Label4 = OPTab:CreateLabel("Quality Of Life", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Toggle4 = OPTab:CreateToggle({
   Name = "Semi-Godmode",
   CurrentValue = false,
   Flag = "Toggle4",
   Callback = function(Value)
	getgenv().SemiGodmode = Value
	if SemiGodmode == true then
	Notify('Info', "What Semi-Godmode Works On: Special Attacks (Pizza Boss's Pepper Attack, All Scarry Larry/Marry Attacks Except Monster Spawner), Hailing And Possibly Some Others\nWhat Semi-Godmode Doesnt Work On: Enemies, Ice (Use Anti Slip), Getting Locked In A Room While An Enemy Wave Comes, And Possibly Some Others.", 'rbxassetid://4483345998', 7)
	end
   end,
})
local Toggle5 = OPTab:CreateToggle({
   Name = "Remove Hailing",
   CurrentValue = false,
   Flag = "Toggle5",
   Callback = function(Value)
   if Value == false then
	if ScriptLoaded == true then
		HailClone.Parent = game:GetService("Workspace")
	end
   else
	HailClone = game:GetService("Workspace").Hails:Clone()
	game:GetService("Workspace").Hails:Destroy()
   end
   end,
})
local Toggle6 = OPTab:CreateToggle({
   Name = "Remove Wind",
   CurrentValue = false,
   Flag = "Toggle6",
   Callback = function(Value)
	getgenv().NoWind = Value
	while NoWind == true do
	AntiWind()
	task.wait(.5)
	end
   end,
})
local Toggle7 = OPTab:CreateToggle({
   Name = "Remove Mud",
   CurrentValue = false,
   Flag = "Toggle7",
   Callback = function(Value)
	AntiMud(Value)
   end,
})
local Section9 = OPTab:CreateSection("Kitchen Food")
local Slider = OPTab:CreateSlider({
   Name = "Table Food Slot",
   Range = {0, 4},
   Increment = 1,
   Suffix = "idk",
   CurrentValue = 1,
   Flag = "Slider1",
   Callback = function(Value)
   Position = Value
   end,
})
local Button29 = OPTab:CreateButton({
   Name = "Spawn Pizza Box",
   Callback = function()
   	Events:WaitForChild("OutsideFood"):FireServer(6, {
		["item2"] = "Pizza",
		["placement"] = Position
	})
   end,
})
local Button30 = OPTab:CreateButton({
   Name = "Spawn Bloxy Cola",
   Callback = function()
   	Events:WaitForChild("OutsideFood"):FireServer(6, {
		["item2"] = "BloxyPack",
		["placement"] = Position
	})
   end,
})
local Label6 = OPTab:CreateLabel("Others", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Toggle8 = OPTab:CreateToggle({
   Name = "Lag/Crash The Server",
   CurrentValue = false,
   Flag = "Toggle8",
   Callback = function(Value)
	while Value == true do 
	for i = 1, 10 do
		for i = 1, 4 do
			Events:WaitForChild("OutsideFood"):FireServer(6, {
				["item2"] = "Pizza",
				["placement"] = i
			})
			Events:WaitForChild("OutsideFood"):FireServer(6, {
				["item2"] = "BloxyPack",
				["placement"] = i
			})
		   end
		end
	task.wait(.1)
	end
   end,
})
local Button31 = OPTab:CreateButton({
   Name = "Break The Game",
   Callback = function()
   	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.UnclePete.PrimaryPart.CFrame
	task.wait(.5)
	game.Workspace.UnclePete:MoveTo(Vector3.new(math.huge, math.huge, math.huge))
   end,
})
local Button32 = OPTab:CreateButton({
   Name = "Teleport To Private Lobby",
   Callback = function()
	game:GetService("TeleportService"):Teleport(14775231477, LocalPlayer)
   end,
})
local Button33 = OPTab:CreateButton({
   Name = "Unlock Secret Ending",
   Callback = function()
	GetSecretEnding()
   end,
})
local Button34 = OPTab:CreateButton({
   Name = "Get Best Weapon",
   Callback = function()
	GetBestTool()
   end,
})
local Button35 = OPTab:CreateButton({
   Name = "Get All Equipment",
   Callback = function()
	GiveAll()
   end,
})
local TPTab = Window:CreateTab("Teleports", "rewind")
local Section10 = TPTab:CreateSection("Main")
local Button36 = TPTab:CreateButton({
   Name = "Boss Fight",
   Callback = function()
	TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
   end,
})
local Button37 = TPTab:CreateButton({
   Name = "Shop",
   Callback = function()
	TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
   end,
})
local Button38 = TPTab:CreateButton({
   Name = "Kitchen",
   Callback = function()
	TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
   end,
})
local Button39 = TPTab:CreateButton({
   Name = "Fighting Arena",
   Callback = function()
	TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
   end,
})
local Button40 = TPTab:CreateButton({
   Name = "The Gym",
   Callback = function()
	TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
   end,
})
local Button41 = TPTab:CreateButton({
   Name = "Golden Apple",
   Callback = function()
	TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
   end,
})
local Button42 = TPTab:CreateButton({
   Name = "Feeding Instructions",
   Callback = function()
	TeleportTo(CFrame.new(-207.885056, 60.4500465, -830.583557, 0.118373089, 3.89876789e-08, -0.992969215, 3.47791551e-09, 1, 3.96783406e-08, 0.992969215, -8.15031065e-09, 0.118373089))
   end,
})
local Button43 = TPTab:CreateButton({
   Name = "Middle Room",
   Callback = function()
	TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394e-08, -0.998819232, -2.08771045e-09, -0.0485812724))
   end,
})
local Button44 = TPTab:CreateButton({
   Name = "Scary Mary Pillar",
   Callback = function()
	TeleportTo(CFrame.new(-1501.49597, -325.156891, -1060.63367, -0.691015959, 7.43958628e-09, 0.722839475, -5.03345055e-09, 1, -1.51040194e-08, -0.722839475, -1.40754954e-08, -0.691015959))
   end,
})
local Button45 = TPTab:CreateButton({
   Name = "Outside Loot",
   Callback = function()
	TeleportTo(game:GetService("Workspace").OutsideParts:FindFirstChildWhichIsA("Part", true).CFrame + Vector3.new(10, 0, 0))
   end,
})
local Button46 = TPTab:CreateButton({
   Name = "Experiment Room",
   Callback = function()
	TeleportTo(game:GetService("Workspace").Final.Factory.RedDesk.Drawer:GetChildren()[2].CFrame + Vector3.new(20, 0, 0))
   end,
})
local Button47 = TPTab:CreateButton({
   Name = "Cafeteria",
   Callback = function()
	TeleportTo(game:GetService("Workspace").Final.Factory:FindFirstChild("Legs", true).CFrame)
   end,
})
local Button47 = TPTab:CreateButton({
   Name = "Rainbow Pizza Box",
   Callback = function()
	TeleportTo(game:GetService("Workspace").RainbowPizzaBox.CFrame)
   end,
})
local Section11 = TPTab:CreateSection("NPC's")
local Button48 = TPTab:CreateButton({
   Name = "Secret Agent Bradley",
   Callback = function()
	TeleportTo(CFrame.new(-281.792053, 95.4500275, -790.556946, -0.116918251, -7.95074726e-08, -0.993141532, -2.79918044e-09, 1, -7.97270019e-08, 0.993141532, -6.54155974e-09, -0.116918251))
   end,
})
local Button49 = TPTab:CreateButton({
   Name = "Twado The Dog",
   Callback = function()
	TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
   end,
})
local Button50 = TPTab:CreateButton({
   Name = "Uncle Pete",
   Callback = function()
	TeleportTo(CFrame.new(-294.208923, 63.4182587, -737.712036, -0.998669028, -7.34403613e-08, -0.05157727, -7.2258743e-08, 1, -2.47743781e-08, 0.05157727, -2.1014495e-08, -0.998669028))
   end,
})
local Section12 = TPTab:CreateSection("Secret Ending")
local Button51 = TPTab:CreateButton({
   Name = "Golden Crowbar",
   Callback = function()
	TeleportTo(CFrame.new(-147.337204, 29.4477005, -929.365295, 0.756779075, 4.53537341e-09, -0.653670728, 5.82708326e-09, 1, 1.36845468e-08, 0.653670728, -1.4165173e-08, 0.756779075))
   end,
})
local Button52 = TPTab:CreateButton({
   Name = "Purple Mask",
   Callback = function()
	TeleportTo(CFrame.new(102.560722, 29.2477055, -976.389954, -0.951403797, 3.76210636e-08, -0.307946175, 1.89752569e-08, 1, 6.35433466e-08, 0.307946175, 5.46120233e-08, -0.951403797))
   end,
})
local Button53 = TPTab:CreateButton({
   Name = "Homeless Kid",
   Callback = function()
	TeleportTo(CFrame.new(-79.4871826, 29.4477024, -932.782715, -0.215949073, 3.18771427e-08, 0.976404607, -7.60385461e-08, 1, -4.94647345e-08, -0.976404607, -8.49262562e-08, -0.215949073))
   end,
})
local HTab = Window:CreateTab("Humanoid", "rewind")
local Section13 = HTab:CreateSection("Settings")
local Slider2 = HTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 500},
   Increment = 50,
   Suffix = "idk",
   CurrentValue = 100,
   Flag = "Slider1", 
   Callback = function(Value)
	ModifiedWalkspeed = Value
   end,
})
local Slider3 = HTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 50,
   Suffix = "idk",
   CurrentValue = 100,
   Flag = "Slider1", 
   Callback = function(Value)
	ModifiedJumpPower = Value
   end,
})
local Section14 = HTab:CreateSection("Humanoid")
local Toggle9 = HTab:CreateToggle({
   Name = "Enable Walk Speed",
   CurrentValue = false,
   Flag = "Toggle9", 
   Callback = function(Value)
	if Value == true then
		OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
		LocalPlayer.Character.Humanoid.WalkSpeed = ModifiedWalkspeed
	else
		LocalPlayer.Character.Humanoid.WalkSpeed = OriginalWalkspeed
	end
   end,
})
local Toggle10 = HTab:CreateToggle({
   Name = "Enable Jump Power",
   CurrentValue = false,
   Flag = "Toggle10", 
   Callback = function(Value)
	if Value == true then
		OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
		LocalPlayer.Character.Humanoid.JumpPower = ModifiedJumpPower
		LocalPlayer.Character.Humanoid.UseJumpPower = Value
	else
		LocalPlayer.Character.Humanoid.JumpPower = OriginalJumpPower
	end
   end,
})
local Toggle11 = HTab:CreateToggle({
   Name = "Enable Noclip",
   CurrentValue = false,
   Flag = "Toggle11", 
   Callback = function(Value)
	getgenv().Noclipping = Value
	if Noclipping == true then
		spawn(function()
			while Noclipping == true do
				Noclip(false)
				task.wait(.05)
		   	end
		end)
	 end
	if Noclipping == false then
	   Noclip(true)
	end
   end,
})
local Toggle11 = HTab:CreateToggle({
   Name = "Enable Floating",
   CurrentValue = false,
   Flag = "Toggle11", 
   Callback = function(Value)
	getgenv().Float = Value
	if Float == true then
		spawn(function()
			while Float == true do
			Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
			task.wait(.05)
			end
		end)
	end
	if Float == false then
	   Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 999, 0)
	end
   end,
})
local CTab = Window:CreateTab("Combat", "rewind")
local Section15 = CTab:CreateSection("Kill Enemies")
local Button54 = CTab:CreateButton({
   Name = "Kill All Enemies",
   Callback = function()
	for i = 1, 10 do
		KillEnemies()
	end
   end,
})
local Toggle12 = CTab:CreateToggle({
   Name = "Loop Kill All",
   CurrentValue = false,
   Flag = "Toggle12", 
   Callback = function(Value)
	getgenv().KillAllLoop = Value
	while KillAllLoop do
		for i = 1, 3 do
			KillEnemies()
		end
		task.wait(.1)
	end
	end
})
local Section15 = CTab:CreateSection("Break Enemies")
local Button55 = CTab:CreateButton({
   Name = "Break All Enemies",
   Callback = function()
	BreakEnemies()
   end,
})
local Toggle13 = CTab:CreateToggle({
   Name = "Loop Kill All",
   CurrentValue = false,
   Flag = "Toggle13", 
   Callback = function(Value)
	getgenv().BreakAllLoop = Value
	while BreakAllLoop do
		BreakEnemies()
		task.wait(1)
	end
	end
})
local Section15 = CTab:CreateSection("Bring Enemies")
local Button55 = CTab:CreateButton({
   Name = "Bring All Enemies",
   Callback = function()
	BringAllEnemies()
   end,
})
local Toggle14 = CTab:CreateToggle({
   Name = "Loop Bring All",
   CurrentValue = false,
   Flag = "Toggle14", 
   Callback = function(Value)
	getgenv().BringAllLoop = Value
	while BringAllLoop do
		BringAllEnemies()
		task.wait(.1)
	end
	end
})
local BTab = Window:CreateTab("Badges", "rewind")
local Button56 = BTab:CreateButton({
   Name = "Dream Team (And The 3 Below)",
   Callback = function()
	GetDog()
	task.wait(5)
	GetAgent()
	task.wait(1)
	GetUncle()
   end,
})
local Button57 = BTab:CreateButton({
   Name = "Operation: Dog Rescue",
   Callback = function()
	GetDog()
   end,
})
local Button58 = BTab:CreateButton({
   Name = "Wake up, Bradley!",
   Callback = function()
	GetAgent()
   end,
})
local Button59 = BTab:CreateButton({
   Name = "Uncle Pete's Return",
   Callback = function()
	GetUncle()
   end,
})
local Button60 = BTab:CreateButton({
   Name = "The Golden Apple",
   Callback = function()
	GetGAppleBadge()
   end,
})
local Button61 = BTab:CreateButton({
   Name = "Delivery's Here",
   Callback = function()
	GetAllOutsideItems()
   end,
})
local Button62 = BTab:CreateButton({
   Name = "So Speedy",
   Callback = function()
	for i = 1, 5 do
		Train("Speed")
	end
   end,
})
local Button62 = BTab:CreateButton({
   Name = "So Strong",
   Callback = function()
	for i = 1, 5 do
		Train("Strength")
	end
   end,
})
local Button62 = BTab:CreateButton({
   Name = "Reformed",
   Callback = function()
	GetSecretEnding()
   end,
})
local Button62 = BTab:CreateButton({
   Name = "Avoid Humiliation",
   Callback = function()
	GiveAll()
	task.wait(4)
	GetDog()
	task.wait(5)
	GetAgent()
	task.wait(1)
	GetUncle()
   end,
})
local MTab = Window:CreateTab("Misc", "rewind")
local Section16 = MTab:CreateSection("Harmful")
local Slider = MTab:CreateSlider({
   Name = "Damage Amount",
   Range = {0, 200},
   Increment = 1,
   Suffix = "idk",
   CurrentValue = 5,
   Flag = "Slider1", 
   Callback = function(Value)
	Damange = Value
   end,
})
local Button63 = MTab:CreateButton({
   Name = "Damage Yourself",
   Callback = function()
	if SemiGodmode == false then
		TakeDamange(Damange)
	else
		Notify('Warning', "Damanging Yourself Won't Work Due To Having 'Semi Godmode' Enabled!", 'rbxassetid://4483345998', 7)
	end
   end,
})
local Button64 = MTab:CreateButton({
   Name = "Slip",
   Callback = function()
	if RemoveSlipping == false then
		Events:WaitForChild("IceSlip"):FireServer(Vector3.new(0, 0, 0))
	else
		Notify('Warning', "Slipping Won't Work Due To Having 'Remove Slipping' Enabled!", 'rbxassetid://4483345998', 7)
	end
   end,
})
local Section17 = MTab:CreateSection("Tools")
local Button65 = MTab:CreateButton({
   Name = "Equip All Tools",
   Callback = function()
	EquipAllTools()
   end,
})
local Button66 = MTab:CreateButton({
   Name = "Unequip All Tools",
   Callback = function()
	UnequipAllTools()
   end,
})
local Section18 = MTab:CreateSection("Bosses")
local Button67 = MTab:CreateButton({
   Name = "Delete Scary Mary",
   Callback = function()
	if game:GetService("Workspace"):FindFirstChild("Villainess") then
		game:GetService("Workspace").Villainess:Destroy()
	else
		Notify('Warning', "Scary Mary Is Already Deleted Or Boss Fight Hasnt Started!", 'rbxassetid://4483345998', 7)
	end
   end,
})
local Button68 = MTab:CreateButton({
   Name = "Delete Scary Larry",
   Callback = function()
	if game:GetService("Workspace"):FindFirstChild("BigBoss") then
		game:GetService("Workspace").BigBoss:Destroy()
	else
		Notify('Warning', "Scary Larry Is Already Deleted Or Boss Fight Hasnt Started!", 'rbxassetid://4483345998', 7)
	end
   end,
})
local Section19 = MTab:CreateSection("NPC's")
local Button69 = MTab:CreateButton({
   Name = "Get All NPC's",
   Callback = function()
	GetDog()
	task.wait(5)
	GetAgent()
	task.wait(1)
	GetUncle()
   end,
})
local Button70 = MTab:CreateButton({
   Name = "Get Twado",
   Callback = function()
	GetDog()
   end,
})
local Button71 = MTab:CreateButton({
   Name = "Get Agent Bradley",
   Callback = function()
	GetAgent()
   end,
})
local Button72 = MTab:CreateButton({
   Name = "Get Uncle Pete",
   Callback = function()
	GetUncle()
   end,
})
local Section20 = MTab:CreateSection("Cash")
local Button73 = MTab:CreateButton({
   Name = "Collect Cash",
   Callback = function()
	CollectCash()
   end,
})
local Toggle15 = MTab:CreateToggle({
   Name = "Auto Collect Cash",
   CurrentValue = false,
   Flag = "Toggle15", 
   Callback = function(Value)
	getgenv().CollectAllCash = Value
	while CollectAllCash do
		CollectCash()
		task.wait(1)
	end
	end
})
local Section20 = MTab:CreateSection("Others")
local Toggle16 = MTab:CreateToggle({
   Name = "Auto Claim Uncle Pete's Quests",
   CurrentValue = false,
   Flag = "Toggle16", 
   Callback = function(Value)
	getgenv().AutoPete = Value
	while AutoPete do
	ClickPete()
	task.wait(10)
	end
	end
})
local Button74 = MTab:CreateButton({
   Name = "Get All Items From Outside",
   Callback = function()
	GetAllOutsideItems()
   end,
})
local Button75 = MTab:CreateButton({
   Name = "Break Fallen Trees",
   Callback = function()
	BreakBarricades()
   end,
})
local Toggle17 = MTab:CreateToggle({
   Name = "Hidden Items ESP",
   CurrentValue = false,
   Flag = "Toggle17", 
   Callback = function(Value)
	if Value == true then
		for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
			local highlight = Instance.new("Highlight")
			highlight.Parent = v
			highlight.FillColor = Color3.fromRGB(255, 0, 255)
			highlight.FillTransparency = 0
			highlight.OutlineTransparency = 0
			highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
		end
	else
		for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
			if v:FindFirstChild("Highlight") then
				v:FindFirstChild("Highlight"):Destroy()
			end
		end
	end
	end
})
local Toggle18 = MTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "Toggle18", 
   Callback = function(Value)
	if Value == true then
		Lighting.Brightness = 1
		Lighting.FogEnd = 999999
		Lighting.GlobalShadows = false
	else
		Lighting.Brightness = OriginalBrightness
		Lighting.FogEnd = OriginalFog
		Lighting.GlobalShadows = GlobalShadows
	end
	end
})
Notify('Loaded!', "Script Successfully Loaded!\nJoin Our Discord At (https://discord.com/invite/XHS5WPxMrr) For Support, Questions And Updates!\nThe Script Is Open Source So Feel Free To Look At The Code!", 'rbxassetid://4483345998', 15)
ScriptLoaded = true
OrionLib:Init()
