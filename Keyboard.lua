local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not keypress() then
   local function keypress(Key)
      game:GetService("VirtualUser"):SetKeyDown(Enum.KeyCode[Key])
      Rayfield:Notify({
   Title = "Notification",
   Content = "Your executor, "..identifyexecutor().." does not support the keypress() function! however, i've made a function that can replace it.",
   Duration = 6.5,
   Image = 4483362458,
})
   end
local Window = Rayfield:CreateWindow({
   Name = "Keyboard GUI",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Keyboard GUI",
   LoadingSubtitle = "THIS IS OPEN-SOURCE!",
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
local Tab = Window:CreateTab("Keys", 4483362458) -- Title, Image
local ButtonA = Tab:CreateButton({
   Name = "A key",
   Callback = function()
      keypress(Enum.KeyCode.A)
   end,
})

local ButtonB = Tab:CreateButton({
   Name = "B key",
   Callback = function()
      keypress(Enum.KeyCode.B)
   end,
})

local ButtonC = Tab:CreateButton({
   Name = "C key",
   Callback = function()
      keypress(Enum.KeyCode.C)
   end,
})

local ButtonD = Tab:CreateButton({
   Name = "D key",
   Callback = function()
      keypress(Enum.KeyCode.D)
   end,
})

local ButtonE = Tab:CreateButton({
   Name = "E key",
   Callback = function()
      keypress(Enum.KeyCode.E)
   end,
})

local ButtonF = Tab:CreateButton({
   Name = "F key",
   Callback = function()
      keypress(Enum.KeyCode.F)
   end,
})

local ButtonG = Tab:CreateButton({
   Name = "G key",
   Callback = function()
      keypress(Enum.KeyCode.G)
   end,
})

local ButtonH = Tab:CreateButton({
   Name = "H key",
   Callback = function()
      keypress(Enum.KeyCode.H)
   end,
})

local ButtonI = Tab:CreateButton({
   Name = "I key",
   Callback = function()
      keypress(Enum.KeyCode.I)
   end,
})

local ButtonJ = Tab:CreateButton({
   Name = "J key",
   Callback = function()
      keypress(Enum.KeyCode.J)
   end,
})

local ButtonK = Tab:CreateButton({
   Name = "K key",
   Callback = function()
      keypress(Enum.KeyCode.K)
   end,
})

local ButtonL = Tab:CreateButton({
   Name = "L key",
   Callback = function()
      keypress(Enum.KeyCode.L)
   end,
})

local ButtonM = Tab:CreateButton({
   Name = "M key",
   Callback = function()
      keypress(Enum.KeyCode.M)
   end,
})

local ButtonN = Tab:CreateButton({
   Name = "N key",
   Callback = function()
      keypress(Enum.KeyCode.N)
   end,
})

local ButtonO = Tab:CreateButton({
   Name = "O key",
   Callback = function()
      keypress(Enum.KeyCode.O)
   end,
})

local ButtonP = Tab:CreateButton({
   Name = "P key",
   Callback = function()
      keypress(Enum.KeyCode.P)
   end,
})

local ButtonQ = Tab:CreateButton({
   Name = "Q key",
   Callback = function()
      keypress(Enum.KeyCode.Q)
   end,
})

local ButtonR = Tab:CreateButton({
   Name = "R key",
   Callback = function()
      keypress(Enum.KeyCode.R)
   end,
})

local ButtonS = Tab:CreateButton({
   Name = "S key",
   Callback = function()
      keypress(Enum.KeyCode.S)
   end,
})

local ButtonT = Tab:CreateButton({
   Name = "T key",
   Callback = function()
      keypress(Enum.KeyCode.T)
   end,
})

local ButtonU = Tab:CreateButton({
   Name = "U key",
   Callback = function()
      keypress(Enum.KeyCode.U)
   end,
})

local ButtonV = Tab:CreateButton({
   Name = "V key",
   Callback = function()
      keypress(Enum.KeyCode.V)
   end,
})

local ButtonW = Tab:CreateButton({
   Name = "W key",
   Callback = function()
      keypress(Enum.KeyCode.W)
   end,
})

local ButtonX = Tab:CreateButton({
   Name = "X key",
   Callback = function()
      keypress(Enum.KeyCode.X)
   end,
})

local ButtonY = Tab:CreateButton({
   Name = "Y key",
   Callback = function()
      keypress(Enum.KeyCode.Y)
   end,
})

local ButtonZ = Tab:CreateButton({
   Name = "Z key",
   Callback = function()
      keypress(Enum.KeyCode.Z)
   end,
})

local Tab2 = Window:CreateTab("Github", 4483362458) -- Title, Image
local Button = Tab2:CreateButton({
   Name = "github.com/HDAdminModule",
   Callback = function()
   setclipboard("https://www.github.com/HDAdminModule")
Rayfield:Notify({
   Title = "Github Copied",
   Content = "Attempted to copy github using setclipboard() (i don't know if it works on ur exec or not)",
   Duration = 3,
   Image = 4483362458,
})
   end,
})
end
