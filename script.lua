local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "✨Zeynqq Made this, Join dc https://discord.gg/fqcxC8wJAG✨",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "🎇Zenith hub presents:🎇",
    LoadingSubtitle = "💫by Zeynqq💫",
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
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
    Title = "You've Injected, GoodLuck 🚀",
    Content = "💟follow zeynqq.tt on tiktok💟",
    Duration = 6.5,
    Image = 4483362458,
 })

 local MainTab = Window:CreateTab("🎮Main🎮", nil) -- Title, Image
 local Section = MainTab:CreateSection("Aimbot")

 local Button = MainTab:CreateButton({
    Name = "Aimbot (TapShoot) 🛠",
    Callback = function()
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer
        local Holding = false
        
        _G.AimbotEnabled = true
        _G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
        _G.AimPart = "Head" -- Where the aimbot script would lock at.
        _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
        
        _G.CircleSides = 64 -- How many sides the FOV circle would have.
        _G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
        _G.CircleTransparency = 0.7 -- Transparency of the circle.
        _G.CircleRadius = 212 -- The radius of the circle / FOV.
        _G.CircleFilled = false -- Determines whether or not the circle is filled.
        _G.CircleVisible = true -- Determines whether or not the circle is visible.
        _G.CircleThickness = 0 -- The thickness of the circle.
        
        local FOVCircle = Drawing.new("Circle")
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Filled = _G.CircleFilled
        FOVCircle.Color = _G.CircleColor
        FOVCircle.Visible = _G.CircleVisible
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Transparency = _G.CircleTransparency
        FOVCircle.NumSides = _G.CircleSides
        FOVCircle.Thickness = _G.CircleThickness
        
        local function GetClosestPlayer()
            local MaximumDistance = _G.CircleRadius
            local Target = nil
        
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= LocalPlayer.Name then
                    if _G.TeamCheck == true then
                        if v.Team ~= LocalPlayer.Team then
                            if v.Character ~= nil then
                                if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                    if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                        local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                        
                                        if VectorDistance < MaximumDistance then
                                            Target = v
                                        end
                                    end
                                end
                            end
                        end
                    else
                        if v.Character ~= nil then
                            if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                    local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                    local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                    
                                    if VectorDistance < MaximumDistance then
                                        Target = v
                                    end
                                end
                            end
                        end
                    end
                end
            end
        
            return Target
        end
        
        UserInputService.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = false
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
            FOVCircle.Radius = _G.CircleRadius
            FOVCircle.Filled = _G.CircleFilled
            FOVCircle.Color = _G.CircleColor
            FOVCircle.Visible = _G.CircleVisible
            FOVCircle.Radius = _G.CircleRadius
            FOVCircle.Transparency = _G.CircleTransparency
            FOVCircle.NumSides = _G.CircleSides
            FOVCircle.Thickness = _G.CircleThickness
        
            if Holding == true and _G.AimbotEnabled == true then
                TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
            end
        end)
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "SilentAim (TapShoot) ⚔",
    Callback = function()
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer
        local AimbotEnabled = false
        
        local TeamCheck = true -- If set to true then the script would only lock your aim at enemy team members.
        local AimParts = {"Torso", "UpperTorso", "LowerTorso", "Head"} -- Where the aimbot script would lock at (first item - highest priority).
        local Sensitivity = 0.0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
        
        local CircleSides = 64 -- How many sides the FOV circle would have.
        local CircleColor = Color3.fromRGB(255, 0, 0) -- (RGB) Color that the FOV circle would appear as.
        local CircleTransparency = 0.25 -- Transparency of the circle.
        local CircleRadius = 150 -- The radius of the circle / FOV.
        local CircleFilled = false -- Determines whether or not the circle is filled.
        local CircleVisible = true -- Determines whether or not the circle is visible.
        local CircleThickness = 0 -- The thickness of the circle.
        local ToggleAimbotKey = Enum.KeyCode.F15 -- The key that turns aimbot on/off
        local ToggleTeamCheckKey = Enum.KeyCode.F14 -- The key that toggles the team chech condition
        
        local FOVCircle = Drawing.new("Circle")
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOVCircle.Radius = CircleRadius
        FOVCircle.Filled = CircleFilled
        FOVCircle.Color = CircleColor
        FOVCircle.Visible = CircleVisible
        FOVCircle.Radius = CircleRadius
        FOVCircle.Transparency = CircleTransparency
        FOVCircle.NumSides = CircleSides
        FOVCircle.Thickness = CircleThickness
        
        local function CheckHealth(player)
            if player then
                if player.Character then
                    if player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Humanoid").Health then
                        return player.Character:FindFirstChild("Humanoid").Health
                    end
                    if player.Character.Health then
                        return player.Character.Health
                    end
                end
            end
        
            return -1
        end
        
        local function FindAimPart(character)
            for _, v in ipairs(AimParts) do
                if character:FindFirstChild(v) ~= nil then
                    return character[v]
                end
            end
        
            return nil
        end
        
        local function GetClosestPlayer()
            local MaximumDistance = CircleRadius
            local Target = nil
            local depth = math.huge
        
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= LocalPlayer.Name then
                    if TeamCheck == false or v.Team ~= LocalPlayer.Team then
                        if v.Team ~= LocalPlayer.Team then
                            if v.Character ~= nil then
                                if CheckHealth(v) ~= 0 then
                                    local aimPart = FindAimPart(v.Character)
                                    if aimPart then
                                        local vector3, onScreen = Camera:WorldToViewportPoint(aimPart.Position)
                                        if vector3.Z >= 0 then
                                            local MousePoint = UserInputService:GetMouseLocation()
                                            local VectorDistance = math.sqrt(math.pow(vector3.X - MousePoint.X, 2) + math.pow(vector3.Y - MousePoint.Y, 2))
        
                                            if VectorDistance < MaximumDistance then
                                                if vector3.Z < depth then
                                                    Target = aimPart
                                                    depth = vector3.Z
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        
            return Target
        end
        
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == ToggleAimbotKey then
                AimbotEnabled = not AimbotEnabled
            end
            if input.KeyCode == ToggleTeamCheckKey then
                TeamCheck = not TeamCheck
            end
        end)
        
        local mousemoverel = (mousemoverel or (Input and Input.MouseMove)) or nil
        
        local function updateMouse(target)
            if not target then return end
            local Mouse = game.Players.LocalPlayer:GetMouse()
        
            local posVector3 = Camera:WorldToScreenPoint(target.Position)
            local x, y = posVector3.X - Mouse.X, posVector3.Y - Mouse.Y
        
            if math.abs(x) > 4 then
                x = math.sign(x) * math.max(math.sqrt(math.abs(x)), 4)
            end
            if math.abs(y) > 4 then
                y = math.sign(y) * math.max(math.sqrt(math.abs(y)), 4)
            end
        
            if KRNL_LOADED then
                if x < 0 then
                    x = x + 1 + 0xFFFFFFFF
                end
                if y < 0 then
                    y = y + 1 + 0xFFFFFFFF
                end
            end
        
            mousemoverel(x, y)
        end
        
        RunService.RenderStepped:Connect(function()
            FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
            FOVCircle.Radius = CircleRadius
            FOVCircle.Filled = CircleFilled
            FOVCircle.Color = CircleColor
            FOVCircle.Visible = CircleVisible
            FOVCircle.Radius = CircleRadius
            FOVCircle.Transparency = CircleTransparency
            FOVCircle.NumSides = CircleSides
            FOVCircle.Thickness = CircleThickness
        
            if AimbotEnabled == true then
                target = GetClosestPlayer()
                if target ~= nil then
                    if mousemoverel ~= nil then
                        updateMouse(target)
                    else
                        TweenService:Create(Camera, TweenInfo.new(Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, target.Position)}):Play()
                    end
                end
            end
        end)
    end,
 })

 local WallsTab = Window:CreateTab("👓WallHacks👓", nil) -- Title, Image
 local Section = WallsTab:CreateSection("🎆ESP🎆")

 local Button = WallHacksTab:CreateButton({
    Name = "Glow Esp",
    Callback = function()
    -- Ensure you have the necessary permissions and tools to run this script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Table to store existing highlights
local existingHighlights = {}

-- Function to create ESP for a player
local function createESP(player)
    if player.Character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color for glow
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0.5
        existingHighlights[player] = highlight
    end
end

-- Function to refresh ESP for all players
local function refreshESP()
    -- Remove highlights from players who have left
    for player, highlight in pairs(existingHighlights) do
        if not Players:FindFirstChild(player.Name) or not player.Character then
            if highlight then
                highlight:Destroy()
            end
            existingHighlights[player] = nil
        end
    end

    -- Add or update highlights for current players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if not existingHighlights[player] then
                createESP(player)
            end
        end
    end
end

-- Periodically refresh ESP every 30 seconds
local refreshInterval = 30
local lastRefreshTime = 0

RunService.RenderStepped:Connect(function()
    local currentTime = tick()
    if currentTime - lastRefreshTime >= refreshInterval then
        refreshESP()
        lastRefreshTime = currentTime
    end
end)

-- Initial ESP refresh
refreshESP()

    end,
 })

 local MiscTab = Window:CreateTab("🎲Misc🎲", 4483362458) -- Title, Image
 local Section = MiscTab:CreateSection("🎁")

 local Button = MiscTab:CreateButton({
    Name = "Fly",
    Callback = function()
        local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
        if humanoid.RigType == Enum.HumanoidRigType.R15 then
           game:GetService('Players').LocalPlayer.Character.Humanoid.Name = "Humanoida"
        repeat wait()
           until game:GetService"Players".LocalPlayer and game:GetService"Players".LocalPlayer.Character and game:GetService"Players".LocalPlayer.Character:findFirstChild("UpperTorso") and game:GetService"Players".LocalPlayer.Character:findFirstChild("Humanoida")
        local mouse = game:GetService"Players".LocalPlayer:GetMouse()
        repeat wait() until mouse
           local plr   = game:GetService"Players".LocalPlayer
           local torso = plr.Character.UpperTorso
        local flying   = true
        local deb      = true
        local ctrl     = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 100
        local speed    = 0
        function Fly()
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat wait()
           plr.Character.Humanoida.PlatformStand = true
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
        speed = speed+.5+(speed/maxspeed)
        if speed > maxspeed then
        speed = maxspeed
        end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
        speed = speed-1
        if speed < 0 then
        speed = 0
        end
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
        bv.velocity = ((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*speed
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
        bv.velocity = ((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*speed
        else
        bv.velocity = Vector3.new(0,0.1,0)
        end
        bg.cframe = game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoida.PlatformStand = false
        end
        mouse.KeyDown:connect(function(key)
        if key:lower() == "e" then
        if flying then flying = false
        else
        flying = true
        Fly()
        end
        elseif key:lower() == "w" then
        ctrl.f = 1
        elseif key:lower() == "s" then
        ctrl.b = -1
        elseif key:lower() == "a" then
        ctrl.l = -1
        elseif key:lower() == "d" then
        ctrl.r = 1
        end
        end)
        mouse.KeyUp:connect(function(key)
        if key:lower() == "w" then
        ctrl.f = 0
        elseif key:lower() == "s" then
        ctrl.b = 0
        elseif key:lower() == "a" then
        ctrl.l = 0
        elseif key:lower() == "d" then
        ctrl.r = 0
        end
        end)
        Fly()  
        else
         repeat wait()
          until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
        local mouse = game.Players.LocalPlayer:GetMouse()
        repeat wait() until mouse
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0
         
        function Fly()
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat wait()
        plr.Character.Humanoid.PlatformStand = true
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
        speed = speed+.5+(speed/maxspeed)
        if speed > maxspeed then
        speed = maxspeed
        end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
        speed = speed-1
        if speed < 0 then
        speed = 0
        end
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        else
        bv.velocity = Vector3.new(0,0.1,0)
        end
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        end
        mouse.KeyDown:connect(function(key)
        if key:lower() == "e" then
        if flying then flying = false
        else
        flying = true
        Fly()
        end
        elseif key:lower() == "w" then
        ctrl.f = 1
        elseif key:lower() == "s" then
        ctrl.b = -1
        elseif key:lower() == "a" then
        ctrl.l = -1
        elseif key:lower() == "d" then
        ctrl.r = 1
        end
        end)
        mouse.KeyUp:connect(function(key)
        if key:lower() == "w" then
        ctrl.f = 0
        elseif key:lower() == "s" then
        ctrl.b = 0
        elseif key:lower() == "a" then
        ctrl.l = 0
        elseif key:lower() == "d" then
        ctrl.r = 0
        end
        end)
        Fly()  
        end
    end,
 })

 local Button = MiscTab:CreateButton({
    Name = "SuperSpeed",
    Callback = function()
        getgenv().Enabled = true -- change to false then execute again to turn off
        getgenv().Speed = 100 -- change speed to the number you want
        loadstring(game:HttpGet("https://raw.githubusercontent.com/eclipsology/SimpleSpeed/main/SimpleSpeed.lua"))()
    end,
 })

 local Button = MiscTab:CreateButton({
    Name = "FlingAll",
    Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Script Executed";
            Text = "Fling All";
            Duration = 6;
        })
         
        local Targets = {"All"} -- "All", "Target Name", "arian_was_here"
         
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
         
        local AllBool = false
         
        local GetPlayer = function(Name)
            Name = Name:lower()
            if Name == "all" or Name == "others" then
                AllBool = true
                return
            elseif Name == "random" then
                local GetPlayers = Players:GetPlayers()
                if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
                return GetPlayers[math.random(#GetPlayers)]
            elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
                for _,x in next, Players:GetPlayers() do
                    if x ~= Player then
                        if x.Name:lower():match("^"..Name) then
                            return x;
                        elseif x.DisplayName:lower():match("^"..Name) then
                            return x;
                        end
                    end
                end
            else
                return
            end
        end
         
        local Message = function(_Title, _Text, Time)
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
        end
         
        local SkidFling = function(TargetPlayer)
            local Character = Player.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Humanoid and Humanoid.RootPart
         
            local TCharacter = TargetPlayer.Character
            local THumanoid
            local TRootPart
            local THead
            local Accessory
            local Handle
         
            if TCharacter:FindFirstChildOfClass("Humanoid") then
                THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
            end
            if THumanoid and THumanoid.RootPart then
                TRootPart = THumanoid.RootPart
            end
            if TCharacter:FindFirstChild("Head") then
                THead = TCharacter.Head
            end
            if TCharacter:FindFirstChildOfClass("Accessory") then
                Accessory = TCharacter:FindFirstChildOfClass("Accessory")
            end
            if Accessoy and Accessory:FindFirstChild("Handle") then
                Handle = Accessory.Handle
            end
         
            if Character and Humanoid and RootPart then
                if RootPart.Velocity.Magnitude < 50 then
                    getgenv().OldPos = RootPart.CFrame
                end
                if THumanoid and THumanoid.Sit and not AllBool then
                    return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
                end
                if THead then
                    workspace.CurrentCamera.CameraSubject = THead
                elseif not THead and Handle then
                    workspace.CurrentCamera.CameraSubject = Handle
                elseif THumanoid and TRootPart then
                    workspace.CurrentCamera.CameraSubject = THumanoid
                end
                if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                    return
                end
         
                local FPos = function(BasePart, Pos, Ang)
                    RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                    Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                    RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                    RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                end
         
                local SFBasePart = function(BasePart)
                    local TimeToWait = 2
                    local Time = tick()
                    local Angle = 0
         
                    repeat
                        if RootPart and THumanoid then
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle = Angle + 100
         
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                                task.wait()
         
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            end
                        else
                            break
                        end
                    until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
                end
         
                workspace.FallenPartsDestroyHeight = 0/0
         
                local BV = Instance.new("BodyVelocity")
                BV.Name = "EpixVel"
                BV.Parent = RootPart
                BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
         
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
         
                if TRootPart and THead then
                    if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                        SFBasePart(THead)
                    else
                        SFBasePart(TRootPart)
                    end
                elseif TRootPart and not THead then
                    SFBasePart(TRootPart)
                elseif not TRootPart and THead then
                    SFBasePart(THead)
                elseif not TRootPart and not THead and Accessory and Handle then
                    SFBasePart(Handle)
                else
                    return Message("Error Occurred", "Target is missing everything", 5)
                end
         
                BV:Destroy()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                workspace.CurrentCamera.CameraSubject = Humanoid
         
                repeat
                    RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                    Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                    Humanoid:ChangeState("GettingUp")
                    table.foreach(Character:GetChildren(), function(_, x)
                        if x:IsA("BasePart") then
                            x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                        end
                    end)
                    task.wait()
                until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                workspace.FallenPartsDestroyHeight = getgenv().FPDH
            else
                return Message("Error Ocurrido", "El Script A Fallado", 5)
            end
        end
         
        if not Welcome then Message("By Augus X", "", 6) end
        getgenv().Welcome = true
        if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
         
        if AllBool then
            for _,x in next, Players:GetPlayers() do
                SkidFling(x)
            end
        end
         
        for _,x in next, Targets do
            if GetPlayer(x) and GetPlayer(x) ~= Player then
                if GetPlayer(x).UserId ~= 2924145477 then
                    local TPlayer = GetPlayer(x)
                    if TPlayer then
                        SkidFling(TPlayer)
                    end
                else
                    Message("ERROR AL ASER FLING", "", 8)
                end
            elseif not GetPlayer(x) and not AllBool then
                Message("ERROR OCURRIDO", "NO SE LE ISO FLING", 8)
            end
        end      
    end,
 })
