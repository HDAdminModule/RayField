local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "[Dig To Earth's Core] HDAdmin's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Dig To Earth's Core",
   LoadingSubtitle = "by HDAdminModule",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
  setclipboard("https://lootdest.org/s?07SBujh9")
   KeySettings = {
      Title = "Key System",
      Subtitle = "yes",
      Note = "https://lootdest.org/s?07SBujh9", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"G3ozx5xtEqGAGi3VdsQGKGHxuwqSJDTn38vEUEREQweQ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local STab = Window:CreateTab("Main", "rewind")
local Toggle = STab:CreateToggle({
   Name = "Repeat x99 Cash or x10 Cash",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      while Value do
        game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(8)
        wait(.1)
      end
  Rayfield:Notify({
     Title = "Notification",
     Content = "A wait() function has been added to prevent lagging",
     Duration = 6.5,
     Image = 4483362458,
  })
   end,
})
local Slider = STab:CreateSlider({
   Name = "Give Gems",
   Range = {0, 999},
   Increment = 10,
   Suffix = "Gems",
   CurrentValue = 999,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      _G.Gems = Value
    Rayfield:Notify({
     Title = "Notification",
     Content = "Value of gems has been changed successfully!",
     Duration = 6.5,
     Image = 4483362458,
    })
   end,
})
local Button = STab:CreateButton({
   Name = "Give Gems from Slider",
   Callback = function()
   game.ReplicatedStorage.Remotes.GemEvent:FireServer(_G.Gems)
   end,
})
local SMTab = Window:CreateTab("Spin Manipulation", 4483362458) -- Title, Image
local Button = SMTab:CreateButton({
   Name = "Dominus Pet",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(4)
   end,
})
local Button = SMTab:CreateButton({
   Name = "x99 Cash / x10 Cash",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(8)
   end,
})
local Button = SMTab:CreateButton({
   Name = "2.5K Cash",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(2)
   end,
})
local Button = SMTab:CreateButton({
   Name = "1K Cash",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(6)
   end,
})
local Button = SMTab:CreateButton({
   Name = "250 Gems",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(5)
   end,
})
local Button = SMTab:CreateButton({
   Name = "100 Gems",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(1)
   end,
})
local Button = SMTab:CreateButton({
   Name = "75 Gems",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(9)
   end,
})
local Button = SMTab:CreateButton({
   Name = "10 Spins",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(10)
   end,
})
local Button = SMTab:CreateButton({
   Name = "3 Spins",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(7)
   end,
})
local Button = SMTab:CreateButton({
   Name = "1 Spin",
   Callback = function()
   game.ReplicatedStorage.Remotes.SpinPrizeEvent:FireServer(3)
   end,
})
