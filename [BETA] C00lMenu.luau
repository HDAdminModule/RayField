game.Players.LocalPlayer.Humanoid.UseJumpPower = true
local speaker = game.Players.LocalPlayer --im using this because of infinite yield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "[BETA] C00lMenu V0.1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "[BETA] C00lMenu",
   LoadingSubtitle = "by github.com/HDAdminModule",
   Theme = "Bloom", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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
Rayfield:Notify({
   Title = "Notification",
   Content = "Hey "..game.Players.LocalPlayer.Name.."! Thanks for using C00lMenu!",
   Duration = 6.5,
   Image = 4483362458,
})
local PTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Toggle = PTab:CreateToggle({
   Name = "Shiftlock",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.DevEnableMouseLock = Value
   end,
})
local Button = PTab:CreateButton({
   Name = "Enable ESP (Permenanent)",
   Callback = function()
       while wait(.25) do
        for _, v in game.Players:GetPlayers() do
            local ESP = Instance.New("Highlight",v.Character)
          if v.Character.Name == game.Players.LocalPlayer.Name then
            ESP:Destroy()
          end
        end
      end
   end,
})
local Button = PTab:CreateButton({
   Name = "Enable ESP (One-Time Use)",
   Callback = function()
        for _, v in game.Players:GetPlayers() do
            local ESP = Instance.New("Highlight",v.Character)
          if v.Character.Name == game.Players.LocalPlayer.Name then
            ESP:Destroy()
          end
      end
   end,
})
local Slider = PTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 999},
   Increment = 1,
   Suffix = "sped",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      while wait(.25) do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})
local Slider = PTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 999},
   Increment = 1,
   Suffix = "jup",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      while wait(.25) do
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "GODMODE!!!!!!!",
   Callback = function()
   	local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, speaker.Character
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent, speaker.Character = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	speaker.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char.FindFirstChild(Char, "Animate")
	if Script then
		Script.Disabled = true
		wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth
   end,
})
