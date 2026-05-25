--[[
    Atlanta UI - Custom Menu
    
    This file loads your library and creates your custom menu.
    Modify this file however you want WITHOUT touching the library code!
    
    Steps:
    1. Replace LIBRARY_URL with your hosted library link
    2. Customize the menu sections below
    3. Add/remove tabs and elements as needed
]]--

-- ===== CONFIGURATION =====
local LIBRARY_URL = "https://raw.githubusercontent.com/YOUR_USERNAME/atlanta/main/atlanta-library.lua"

-- ===== LOAD LIBRARY =====
local Library
local success, result = pcall(function()
    return loadstring(game:HttpGet(LIBRARY_URL))()
end)

if not success then
    error("Failed to load library: " .. tostring(result))
end

Library = result
print("✓ Library loaded!")

-- ===== CREATE WINDOW =====
local Window = Library:CreateWindow({Title = "Atlanta", Size = UDim2.new(0, 559, 0, 668)})

-- ===== CREATE TABS =====
local CombatTab = Window:AddTab({Title = "Combat", Columns = 2})
local VisualsTab = Window:AddTab({Title = "Visuals", Columns = 2})
local MiscTab = Window:AddTab({Title = "Misc", Columns = 2})

-- ===== COMBAT TAB =====
do
    local Section = CombatTab:AddSection({Title = "Main Features", Side = 1})
    
    Section:AddToggle({
        Text = "Aimbot",
        Default = false,
        Callback = function(state)
            print("Aimbot:", state)
            -- Add your code here
        end
    })
    
    Section:AddToggle({
        Text = "Wallhack",
        Default = false,
        Callback = function(state)
            print("Wallhack:", state)
            -- Add your code here
        end
    })
    
    Section:AddSlider({
        Text = "FOV",
        Min = 0,
        Max = 360,
        Default = 90,
        Callback = function(value)
            print("FOV:", value)
            -- Add your code here
        end
    })
end

do
    local Section = CombatTab:AddSection({Title = "Advanced", Side = 2})
    
    Section:AddSlider({
        Text = "Smoothing",
        Min = 0,
        Max = 100,
        Default = 50,
        Callback = function(value)
            print("Smoothing:", value)
            -- Add your code here
        end
    })
    
    Section:AddDropdown({
        Text = "Mode",
        Options = {"Lock", "Smooth", "Flick"},
        Flag = "aimbot_mode",
        Default = "Lock",
        Callback = function(option)
            print("Mode:", option)
            -- Add your code here
        end
    })
    
    Section:AddButton({
        Text = "Reset",
        Callback = function()
            print("Reset clicked!")
            -- Add your code here
        end
    })
end

-- ===== VISUALS TAB =====
do
    local Section = VisualsTab:AddSection({Title = "ESP", Side = 1})
    
    Section:AddToggle({
        Text = "Enable ESP",
        Default = false,
        Callback = function(state)
            print("ESP:", state)
            -- Add your code here
        end
    })
    
    Section:AddToggle({
        Text = "Box ESP",
        Default = false,
        Callback = function(state)
            print("Box ESP:", state)
            -- Add your code here
        end
    })
    
    Section:AddToggle({
        Text = "Player Names",
        Default = false,
        Callback = function(state)
            print("Names:", state)
            -- Add your code here
        end
    })
    
    Section:AddColorPicker({
        Text = "ESP Color",
        Default = Color3.fromRGB(255, 0, 0),
        Flag = "esp_color",
        Callback = function(color, alpha)
            print("ESP Color:", color)
            -- Add your code here
        end
    })
end

do
    local Section = VisualsTab:AddSection({Title = "Rendering", Side = 2})
    
    Section:AddSlider({
        Text = "Brightness",
        Min = 0,
        Max = 2,
        Default = 1,
        Decimal = 0.1,
        Callback = function(value)
            print("Brightness:", value)
            -- Add your code here
        end
    })
    
    Section:AddToggle({
        Text = "Fullbright",
        Default = false,
        Callback = function(state)
            print("Fullbright:", state)
            -- Add your code here
        end
    })
end

-- ===== MISC TAB =====
do
    local Section = MiscTab:AddSection({Title = "Settings", Side = 1})
    
    Section:AddLabel("Game Settings")
    
    Section:AddSlider({
        Text = "Game Speed",
        Min = 0,
        Max = 2,
        Default = 1,
        Decimal = 0.1,
        Callback = function(value)
            print("Game Speed:", value)
            -- Add your code here
        end
    })
    
    Section:AddToggle({
        Text = "Notifications",
        Default = true,
        Callback = function(state)
            print("Notifications:", state)
            -- Add your code here
        end
    })
end

do
    local Section = MiscTab:AddSection({Title = "Config", Side = 2})
    
    Section:AddButton({
        Text = "Save Config",
        Callback = function()
            print("Config saved!")
            -- Add your code here
        end
    })
    
    Section:AddButton({
        Text = "Load Config",
        Callback = function()
            print("Config loaded!")
            -- Add your code here
        end
    })
    
    Section:AddButton({
        Text = "Reset All",
        Callback = function()
            print("Reset all settings!")
            -- Add your code here
        end
    })
end

-- ===== INITIALIZE =====
Library:InitPanels()
print("✓ Menu created!")
