--[[
    Atlanta UI - Game Menu Template
    
    Use this as a starting point for your own game menu!
    Just customize the sections and elements below.
]]--

local LIBRARY_URL = "https://raw.githubusercontent.com/YOUR_USERNAME/atlanta/main/atlanta-library.lua"

-- Load library
local Library = loadstring(game:HttpGet(LIBRARY_URL))()
print("✓ Library loaded!")

-- Create window
local Window = Library:CreateWindow({Title = "My Game", Size = UDim2.new(0, 559, 0, 668)})

-- Create tabs
local MainTab = Window:AddTab({Title = "Main", Columns = 1})
local FarmTab = Window:AddTab({Title = "Farm", Columns = 2})
local SettingsTab = Window:AddTab({Title = "Settings", Columns = 1})

-- ===== MAIN TAB =====
do
    local Section = MainTab:AddSection({Title = "Features", Side = 1})
    
    Section:AddLabel("Toggle features on/off")
    
    Section:AddToggle({
        Text = "Auto Click",
        Default = false,
        Callback = function(state)
            -- Your auto click code
        end
    })
    
    Section:AddToggle({
        Text = "Auto Collect",
        Default = false,
        Callback = function(state)
            -- Your auto collect code
        end
    })
    
    Section:AddButton({
        Text = "Teleport Home",
        Callback = function()
            -- Your teleport code
        end
    })
end

-- ===== FARM TAB =====
do
    local Section = FarmTab:AddSection({Title = "Basic", Side = 1})
    
    Section:AddToggle({
        Text = "Enable Farming",
        Default = false,
        Callback = function(state)
            -- Enable/disable farming
        end
    })
    
    Section:AddSlider({
        Text = "Farm Speed",
        Min = 1,
        Max = 100,
        Default = 50,
        Callback = function(value)
            -- Update farm speed
        end
    })
end

do
    local Section = FarmTab:AddSection({Title = "Advanced", Side = 2})
    
    Section:AddToggle({
        Text = "Smart Farming",
        Default = false,
        Callback = function(state)
            -- Smart farming
        end
    })
    
    Section:AddDropdown({
        Text = "Strategy",
        Options = {"Fast", "Safe", "Balanced"},
        Flag = "farm_strategy",
        Default = "Balanced",
        Callback = function(option)
            -- Change farming strategy
        end
    })
end

-- ===== SETTINGS TAB =====
do
    local Section = SettingsTab:AddSection({Title = "General", Side = 1})
    
    Section:AddLabel("Customize your experience")
    
    Section:AddToggle({
        Text = "Show Notifications",
        Default = true,
        Callback = function(state)
            -- Toggle notifications
        end
    })
    
    Section:AddSlider({
        Text = "UI Scale",
        Min = 0.5,
        Max = 2,
        Default = 1,
        Decimal = 0.1,
        Callback = function(value)
            -- Scale UI
        end
    })
    
    Section:AddButton({
        Text = "Save Settings",
        Callback = function()
            -- Save user settings
        end
    })
end

print("✓ Menu ready!")
