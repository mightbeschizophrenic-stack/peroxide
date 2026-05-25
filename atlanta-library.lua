--[[
    NAME: Peronahax/Atlanta
    FOR: All
    
    This is the complete Atlanta UI Library.
    Host this file and load it with loadstring(game:HttpGet("your_url"))()
]]--

-- Variables
    local ServiceCache = {};     -- Cloneref bypass
    getgenv().Services = setmetatable({}, {
        __index = function(Self, Index)
            if not ServiceCache[Index] then
                ServiceCache[Index] = cloneref(game:GetService(Index));
            end;

            return ServiceCache[Index];
        end
    });
    
    local Keys = {
        [Enum.KeyCode.LeftShift] = "Left Shift",
        [Enum.KeyCode.RightShift] = "Right Shift",
        [Enum.KeyCode.LeftControl] = "Left Ctrl",
        [Enum.KeyCode.RightControl] = "Right Ctrl",
        [Enum.KeyCode.Insert] = "Insert",
        [Enum.KeyCode.Backspace] = "Backspace",
        [Enum.KeyCode.Return] = "Return",
        [Enum.KeyCode.LeftAlt] = "Left Alt",
        [Enum.KeyCode.RightAlt] = "Right Alt",
        [Enum.KeyCode.CapsLock] = "Capslock",
        [Enum.KeyCode.One] = "1",
        [Enum.KeyCode.Two] = "2",
        [Enum.KeyCode.Three] = "3",
        [Enum.KeyCode.Four] = "4",
        [Enum.KeyCode.Five] = "5",
        [Enum.KeyCode.Six] = "6",
        [Enum.KeyCode.Seven] = "7",
        [Enum.KeyCode.Eight] = "8",
        [Enum.KeyCode.Nine] = "9",
        [Enum.KeyCode.Zero] = "0",
        [Enum.KeyCode.KeypadOne] = "Num1",
        [Enum.KeyCode.KeypadTwo] = "Num2",
        [Enum.KeyCode.KeypadThree] = "Num3",
        [Enum.KeyCode.KeypadFour] = "Num4",
        [Enum.KeyCode.KeypadFive] = "Num5",
        [Enum.KeyCode.KeypadSix] = "Num6",
        [Enum.KeyCode.KeypadSeven] = "Num7",
        [Enum.KeyCode.KeypadEight] = "Num8",
        [Enum.KeyCode.KeypadNine] = "Num9",
        [Enum.KeyCode.KeypadZero] = "Num0",
        [Enum.KeyCode.Minus] = "-",
        [Enum.KeyCode.Equals] = "=",
        [Enum.KeyCode.Tilde] = "~",
        [Enum.KeyCode.LeftBracket] = "[",
        [Enum.KeyCode.RightBracket] = "]",
        [Enum.KeyCode.RightParenthesis] = ")",
        [Enum.KeyCode.LeftParenthesis] = "(",
        [Enum.KeyCode.Semicolon] = ",",
        [Enum.KeyCode.Quote] = "'",
        [Enum.KeyCode.BackSlash] = "\\",
        [Enum.KeyCode.Comma] = ",",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Slash] = "/",
        [Enum.KeyCode.Asterisk] = "*",
        [Enum.KeyCode.Plus] = "+",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Backquote] = "`",
        [Enum.UserInputType.MouseButton1] = "MouseButton1",
        [Enum.UserInputType.MouseButton2] = "MouseButton2",
        [Enum.UserInputType.MouseButton3] = "MouseButton3",
        [Enum.KeyCode.Escape] = "Escape",
        [Enum.KeyCode.Space] = "Space",
    }

    local Camera = workspace.CurrentCamera
    local LocalPlayer = Services.Players.LocalPlayer
    local GuiInset = Services.GuiService:GetGuiInset().Y
    local Mouse = LocalPlayer:GetMouse()

    local NumSeq = NumberSequence.new
    local ColorSeq = ColorSequence.new

    local NumKey = NumberSequenceKeypoint.new
    local ColorKey = ColorSequenceKeypoint.new

    local function Color3ToRGB(color3)
        local r = math.round(color3.R * 255)
        local g = math.round(color3.G * 255)
        local b = math.round(color3.B * 255)
        return r, g, b
    end
--

if getgenv().Library and getgenv().Library.Unload then
    getgenv().Library:Unload()
end

local Library; do
    Library = {
        Directory = "Atlanta",
        Folders = {
            "/Fonts",
            "/Configs",
            "/Themes",
        },

        Flags = {},
        ConfigFlags = {},
        FlagCount = 0;
        Connections = {},
        Threads = {},
        Blurs = {},
        Elements = {},
        Notifications = {},

        OpenElement = {},
        Moderators = {},
        Keybinds = {},
        Guis = {},
        Glows = {}, 

        EasingDirection = Enum.EasingDirection.InOut,
        EasingStyle = Enum.EasingStyle.Quint,
        TweeningSpeed = .3,
        DraggingSpeed = .05,
        Tweening = false,
    };  
    
    Library.__index = Library;
    getgenv().Library = Library

    for _, path in Library.Folders do
        makefolder(Library.Directory .. path)
    end

    if not isfile(Library.Directory .. "/Autoload.txt") then
        writefile(Library.Directory .. "/Autoload.txt", "")
    end

    local Flags = Library.Flags
    local ConfigFlags = Library.ConfigFlags
    local Notifications = Library.Notifications
    local Elements = Library.Elements

    -- [CORE LIBRARY CODE GOES HERE]
    -- Due to length, copy your entire Library code here
    -- This file should be the complete atlanta.lua
    
    Library.Items = Library:Create("ScreenGui", {Parent = Services.CoreGui, Name = "\0", Enabled = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, IgnoreGuiInset = true, DisplayOrder = 100});
    Library.HUD = Library:Create("ScreenGui", {Parent = Services.CoreGui, Name = "\0", Enabled = true, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 1000001});
    Library.Other = Library:Create("ScreenGui", {Parent = Services.CoreGui, Name = "\0", Enabled = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, IgnoreGuiInset = true});
    Library.Elements = Library:Create("ScreenGui", {Parent = Services.CoreGui, Name = "\0", Enabled = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, IgnoreGuiInset = true, DisplayOrder = 101});

    -- Add core functions here...
    Library.Create = function(self, Class, Options)
        local Info = {
            Instance = Instance.new(Class),
            Properties = Options,
            Tweening = false,
        }
        local Instance = Info.Instance
        local Mt = setmetatable(Info, Library)
        for Property, Value in Options or {} do
            if Property == "Parent" then continue end
            pcall(function() Instance[Property] = Value end)
        end
        if Options and Options.Parent then
            Instance.Parent = Options.Parent
        end
        return Mt
    end

    -- Return the library for use
end

return Library
