-- OrionLib GUI with Key System
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Key System Variables
_G.Key = "ASLAN-2024"
_G.KeyInput = "string"

-- Create Main Window
local Window = OrionLib:MakeWindow({
    Name = "ASLAN CHEATS",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Key System Tab
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Key Input Section
KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.KeyInput = Value
    end	  
})

-- Check Key Button
KeyTab:AddButton({
    Name = "Check Key",
    Callback = function()
        if _G.KeyInput == _G.Key then
            OrionLib:MakeNotification({
                Name = "Key System",
                Content = "Correct Key! Access Granted",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            -- Main GUI Logic After Correct Key
            loadMainGui()
        else
            OrionLib:MakeNotification({
                Name = "Key System",
                Content = "Wrong Key! Try Again",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end    
})

function loadMainGui()
    -- Main Features Tab
    local MainTab = Window:MakeTab({
        Name = "Main Features", 
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    -- Blitz Crack Feature
    MainTab:AddButton({
        Name = "Blitz Crack",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Nurysium/LeaksStore/refs/heads/main/bin/BliztHub.lua", true))()
            
            OrionLib:MakeNotification({
                Name = "Blitz Crack",
                Content = "Successfully Activated!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end    
    })
    
    -- Additional Controls
    MainTab:AddSlider({
        Name = "Speed Modifier",
        Min = 0,
        Max = 100,
        Default = 16,
        Color = Color3.fromRGB(0,255,136),
        Increment = 1,
        ValueName = "Speed",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end    
    })

    -- Jump Power Slider
    MainTab:AddSlider({
        Name = "Jump Power",
        Min = 0,
        Max = 200,
        Default = 50,
        Color = Color3.fromRGB(0,255,136),
        Increment = 1,
        ValueName = "Jump Power",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end    
    })

    -- Gravity Power Slider
    MainTab:AddSlider({
        Name = "Gravity Power",
        Min = 0,
        Max = 196.2,
        Default = 196.2,
        Color = Color3.fromRGB(0,255,136),
        Increment = 0.1,
        ValueName = "Gravity",
        Callback = function(Value)
            game.Workspace.Gravity = Value
        end    
    })

    -- Teleport Keybind Section
    local TeleportTab = Window:MakeTab({
        Name = "Teleport",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local selectedKeybind = "F"
    local isTeleportEnabled = false
    local clickConnection

    TeleportTab:AddDropdown({
        Name = "Teleport Keybind",
        Default = "F",
        Options = {"F", "R", "T", "G", "H", "B", "V", "X", "Z"},
        Callback = function(Value)
            selectedKeybind = Value
        end    
    })

    TeleportTab:AddToggle({
        Name = "Enable Teleport",
        Default = false,
        Callback = function(Value)
            isTeleportEnabled = Value
            if isTeleportEnabled then
                clickConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode[selectedKeybind] then
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local character = game.Players.LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
                        end
                    end
                end)
            else
                if clickConnection then
                    clickConnection:Disconnect()
                end
            end
        end    
    })
end

OrionLib:Init() -- Initialize the library
