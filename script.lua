-- Arsenal Cheat (Corlexs Hub)
-- https://discord.gg/rYuhaMDKJ5
-- developer: 5up3_ | Add if script has issues

-- Arsenal Cheat (Corlexs Hub)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService") 
local HttpService = game:GetService("HttpService")  -- Keep for potential future use
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()
local SMOOTHNESS = 0.2 
local FOV_RADIUS = 150 
local MIN_FOV = 50 
local MAX_FOV = 500 
local FOV_TRANSPARENCY = 0.5 
local MIN_TRANS = 0
local MAX_TRANS = 1
local MAX_RANGE = 500 
local FLY_SPEED = 50 
local SPEED_HACK_VALUE = 100 
local DEFAULT_WALK_SPEED = 16

-- Color Palette
local primaryColor = Color3.fromRGB(30, 30, 30)
local secondaryColor = Color3.fromRGB(40, 40, 40)
local accentColor = Color3.fromRGB(0, 170, 255)
local offColor = Color3.fromRGB(170, 0, 0)
local onColor = Color3.fromRGB(0, 170, 0)
local textColor = Color3.fromRGB(255, 255, 255)
local strokeColor = Color3.fromRGB(100, 100, 100)
local shadowColor = Color3.fromRGB(0, 0, 0)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.DisplayOrder = 100  -- Set high to appear over in-game GUIs

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 250) 
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.BackgroundColor3 = secondaryColor
frame.Parent = screenGui
frame.Visible = false 
frame.ClipsDescendants = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new(secondaryColor, primaryColor)
frameGradient.Rotation = 90
frameGradient.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 1
frameStroke.Color = strokeColor
frameStroke.Parent = frame

-- Add shadow to frame
local frameShadow = Instance.new("ImageLabel")
frameShadow.Size = UDim2.new(1, 20, 1, 20)
frameShadow.Position = UDim2.new(0, -10, 0, -10)
frameShadow.BackgroundTransparency = 1
frameShadow.Image = "rbxassetid://6015897843"  -- Roblox shadow asset
frameShadow.ImageColor3 = shadowColor
frameShadow.ImageTransparency = 0.5
frameShadow.ScaleType = Enum.ScaleType.Slice
frameShadow.SliceCenter = Rect.new(49, 49, 450, 450)
frameShadow.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 25) 
titleBar.BackgroundColor3 = primaryColor
titleBar.Parent = frame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new(primaryColor, secondaryColor)
titleGradient.Rotation = 90
titleGradient.Parent = titleBar

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Corlexs Hub"
titleLabel.TextColor3 = textColor
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -25, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.Gotham
closeBtn.Parent = titleBar
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Make frame draggable
local dragging
local dragInput
local dragStart
local startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Key Prompt
local keyPrompt = Instance.new("Frame")
keyPrompt.Size = UDim2.new(0, 250, 0, 140)  -- Increased height for credits button
keyPrompt.Position = UDim2.new(0.5, -125, 0.5, -70)
keyPrompt.BackgroundColor3 = primaryColor
keyPrompt.Parent = screenGui

local keyPromptCorner = Instance.new("UICorner")
keyPromptCorner.CornerRadius = UDim.new(0, 8)
keyPromptCorner.Parent = keyPrompt

local keyPromptGradient = Instance.new("UIGradient")
keyPromptGradient.Color = ColorSequence.new(primaryColor, secondaryColor)
keyPromptGradient.Rotation = 90
keyPromptGradient.Parent = keyPrompt

-- Add shadow to key prompt
local keyPromptShadow = Instance.new("ImageLabel")
keyPromptShadow.Size = UDim2.new(1, 20, 1, 20)
keyPromptShadow.Position = UDim2.new(0, -10, 0, -10)
keyPromptShadow.BackgroundTransparency = 1
keyPromptShadow.Image = "rbxassetid://6015897843"
keyPromptShadow.ImageColor3 = shadowColor
keyPromptShadow.ImageTransparency = 0.5
keyPromptShadow.ScaleType = Enum.ScaleType.Slice
keyPromptShadow.SliceCenter = Rect.new(49, 49, 450, 450)
keyPromptShadow.Parent = keyPrompt

local corlexLabel = Instance.new("TextLabel")
corlexLabel.Size = UDim2.new(0, 200, 0, 25)
corlexLabel.Position = UDim2.new(0.5, -100, 0.15, 0)
corlexLabel.BackgroundTransparency = 1
corlexLabel.Text = "Corlexs Hub"
corlexLabel.TextColor3 = accentColor
corlexLabel.TextSize = 22
corlexLabel.Font = Enum.Font.GothamBlack
corlexLabel.Parent = keyPrompt

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 180, 0, 25)
keyBox.Position = UDim2.new(0.5, -90, 0.35, 0)
keyBox.PlaceholderText = "Enter Key..."
keyBox.BackgroundColor3 = secondaryColor
keyBox.TextColor3 = textColor
keyBox.Font = Enum.Font.Gotham
keyBox.Parent = keyPrompt

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 4)
keyBoxCorner.Parent = keyBox

local submitKey = Instance.new("TextButton")
submitKey.Size = UDim2.new(0, 70, 0, 25)
submitKey.Position = UDim2.new(0.5, -35, 0.55, 0)
submitKey.Text = "Submit"
submitKey.BackgroundColor3 = accentColor
submitKey.TextColor3 = textColor
submitKey.Font = Enum.Font.Gotham
submitKey.Parent = keyPrompt

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 4)
submitCorner.Parent = submitKey

-- Credits button under submit
local creditsBtn = Instance.new("TextButton")
creditsBtn.Size = UDim2.new(0, 70, 0, 25)
creditsBtn.Position = UDim2.new(0.5, -35, 0.75, 0)
creditsBtn.Text = "Credits"
creditsBtn.BackgroundColor3 = accentColor
creditsBtn.TextColor3 = textColor
creditsBtn.Font = Enum.Font.Gotham
creditsBtn.Parent = keyPrompt

local creditsCorner = Instance.new("UICorner")
creditsCorner.CornerRadius = UDim.new(0, 4)
creditsCorner.Parent = creditsBtn

-- Credits frame
local creditsFrame = Instance.new("Frame")
creditsFrame.Size = UDim2.new(0, 200, 0, 100)
creditsFrame.Position = UDim2.new(0, -210, 0, 0)  -- Left of key prompt
creditsFrame.BackgroundColor3 = primaryColor
creditsFrame.Parent = keyPrompt
creditsFrame.Visible = false

local creditsCornerFrame = Instance.new("UICorner")
creditsCornerFrame.CornerRadius = UDim.new(0, 8)
creditsCornerFrame.Parent = creditsFrame

local creditsGradient = Instance.new("UIGradient")
creditsGradient.Color = ColorSequence.new(primaryColor, secondaryColor)
creditsGradient.Rotation = 90
creditsGradient.Parent = creditsFrame

local creditsText = Instance.new("TextLabel")
creditsText.Size = UDim2.new(1, 0, 1, -25)
creditsText.Position = UDim2.new(0, 0, 0, 25)
creditsText.BackgroundTransparency = 1
creditsText.Text = "Developer: 5up3_"
creditsText.TextColor3 = textColor
creditsText.TextSize = 16
creditsText.Font = Enum.Font.GothamBold
creditsText.Parent = creditsFrame

local creditsClose = Instance.new("TextButton")
creditsClose.Size = UDim2.new(0, 25, 0, 25)
creditsClose.Position = UDim2.new(0, 0, 0, 0)
creditsClose.BackgroundTransparency = 1
creditsClose.Text = "X"
creditsClose.TextColor3 = Color3.fromRGB(255, 0, 0)
creditsClose.TextSize = 18
creditsClose.Font = Enum.Font.Gotham
creditsClose.Parent = creditsFrame
creditsClose.MouseButton1Click:Connect(function()
    creditsFrame.Visible = false
end)

creditsBtn.MouseButton1Click:Connect(function()
    creditsFrame.Visible = true
end)

local keyVerified = false

submitKey.MouseButton1Click:Connect(function()
    local enteredKey = keyBox.Text
    local remoteKey = "OnlyKeyz14"  -- Hardcoded key
    if enteredKey == remoteKey then
        keyVerified = true
        keyPrompt:Destroy()
        frame.Visible = true
        -- Notification
        local noti = Instance.new("TextLabel")
        noti.Size = UDim2.new(0, 300, 0, 50)
        noti.Position = UDim2.new(0.5, -150, 0.9, -25)
        noti.BackgroundColor3 = primaryColor
        noti.Text = "Join https://discord.gg/apJQFG3f9M for updates"
        noti.TextColor3 = textColor
        noti.TextSize = 14
        noti.Font = Enum.Font.Gotham
        noti.Parent = screenGui
        local notiCorner = Instance.new("UICorner")
        notiCorner.CornerRadius = UDim.new(0, 8)
        notiCorner.Parent = noti
        wait(5)
        noti:Destroy()
        print([[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⡾⠁⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠙⢧⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀⠘⢷⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢰⡟⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠘⣷⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠙⣷⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⢀⣤⣤⣴⣶⡿⠿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⠶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⢹⣿⠀⠀⠀⠀
⠀⠀⠀⠀⣿⡄⠀⠀⠀⠀⠀⢹⡄⠀⠀⣠⣴⣿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣤⡀⠀⠀⣰⠇⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀
⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠙⠒⠼⣿⣿⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⡶⠚⠁⠀⠀⠀⠀⠀⠀⣾⡿⠀⠀⠀⠀
⠀⠀⠀⠀⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡏⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠃⠀⠀⠀⠀
⣾⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠀⠀⠀⢀⣴
⣿⣧⠀⠀⠀⠸⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣿⡄⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⢀⣾⡏
⣿⣿⣷⡀⠀⠀⠹⣿⣆⠀⠀⠀⠀⠀⠀⣰⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣤⣤⣶⣿⡿⠟⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣼⣿⠃⠀⠀⣠⣿⣿⡇
⣿⡙⢿⣿⣦⡀⠀⠸⣿⣷⣄⣀⠀⠀⣴⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣧⡀⠀⠀⠀⣠⣾⡿⠁⠀⢀⣴⣿⡟⢹⡇
⢹⡇⠀⠻⣿⣿⣆⡀⢸⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠈⠛⠿⢿⣿⣶⣶⣾⣿⣿⠁⢀⣴⣿⣿⠋⠀⢸⠁
⠸⣿⠀⠀⠙⢿⣿⣷⣽⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⢹⣿⣿⣴⣾⣿⠟⠁⠀⠀⣾⠀
⠀⣿⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⠀
⠀⠹⣷⠀⠀⠀⠀⠈⣽⣿⣿⣿⣧⠀⠀⠀⠀⠀⠤⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⠦⠀⠀⠀⠀⠀⠀⠀⢻⣿⡏⠀⠀⠀⠀⠀⣰⠃⠀
⠀⠀⢿⣧⡀⠀⠀⠀⣿⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠸⣿⡇⠀⠀⠀⠀⣀⠟⠀⠀
⠀⠀⠀⠙⢿⣦⣀⠀⢹⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠚⠉⠁⠀⠀⠀⣿⡇⠀⠀⢀⡶⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠙⢿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⣠⠶⢻⣿⠁⠀⠀⠀⠀⠀⠀⢸⡇⣀⡴⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠈⠛⢦⣀⣀⣀⣾⠀⠀⠀⠀⣿⣄⣀⣀⡴⠋⠁⢠⣿⠏⠀⠀⠀⠀⠀⠀⠀⣼⡟⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⠟⠋⠉⠉⠛⠿⠶⠶⠛⠉⠉⠻⣿⡄⠀⠀⢰⣿⠏⠉⠉⠛⠶⠶⠟⠉⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⠀⠀⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⠀⠀⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⣠⡤⠀⠀⠻⠀⠀⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣦⣤⣀⣀⣀⣤⡴⢿⣿⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠓⣦⣤⣀⣀⣠⣤⣶⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣯⡀⠀⠙⠛⢷⡀⠀⠀⠀⢸⣿⠟⠛⠉⠀⢠⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡙⠿⠿⠋⢻⠙⣆⠀⠀⠀⢷⣄⠀⢀⣨⡟⠀⠀⢀⡼⢋⡏⢻⣿⠟⣡⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡄⠀⠀⢸⡷⣬⡳⢦⣤⣤⣤⣈⣉⣉⣁⣠⣤⡴⢋⡴⢾⠃⠀⠀⣤⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣄⠀⠀⢧⠘⣷⡖⠦⣤⣤⣀⣀⣤⡤⠴⢧⡼⢀⡎⠀⠀⣰⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡆⠀⠘⣇⠘⢧⠀⠀⠀⠀⠀⠀⠀⠠⡜⢃⡼⠁⠀⣼⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⡇⠀⠀⠈⠙⠛⠓⠒⠒⠒⠒⠒⠒⠛⠛⠉⠀⠀⠀⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣷⡀⠀⠀⠠⠔⠒⠛⠛⠿⠿⠛⠓⠒⠢⠄⠀⠀⢠⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣷⣶⣶⣶⣶⣶⣶⣶⣾⣾⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

🄲🄾🅁🄻🄴🅉 🅂🄲🅁🄸🄿🅃 🄰🄲🅃🄸🅅🄰🅃🄴🄳
https://discord.gg/apJQFG3f9M
]])
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Wrong Key!"
    end
end)

-- Tab Buttons
local mainHubBtn = Instance.new("TextButton")
mainHubBtn.Size = UDim2.new(0, 90, 0, 25)
mainHubBtn.Position = UDim2.new(0, 10, 0, 30)
mainHubBtn.Text = "Main Hub"
mainHubBtn.BackgroundColor3 = accentColor
mainHubBtn.TextColor3 = textColor
mainHubBtn.Font = Enum.Font.Gotham
mainHubBtn.Parent = frame

local mainBtnCorner = Instance.new("UICorner")
mainBtnCorner.CornerRadius = UDim.new(0, 4)
mainBtnCorner.Parent = mainHubBtn

local mainBtnStroke = Instance.new("UIStroke")
mainBtnStroke.Thickness = 1
mainBtnStroke.Color = strokeColor
mainBtnStroke.Transparency = 0.5
mainBtnStroke.Parent = mainHubBtn

local serverBtn = Instance.new("TextButton")
serverBtn.Size = UDim2.new(0, 90, 0, 25)
serverBtn.Position = UDim2.new(0, 105, 0, 30)
serverBtn.Text = "Server"
serverBtn.BackgroundColor3 = secondaryColor
serverBtn.TextColor3 = textColor
serverBtn.Font = Enum.Font.Gotham
serverBtn.Parent = frame

local serverBtnCorner = Instance.new("UICorner")
serverBtnCorner.CornerRadius = UDim.new(0, 4)
serverBtnCorner.Parent = serverBtn

local serverBtnStroke = Instance.new("UIStroke")
serverBtnStroke.Thickness = 1
serverBtnStroke.Color = strokeColor
serverBtnStroke.Transparency = 0.5
serverBtnStroke.Parent = serverBtn

local donationsBtn = Instance.new("TextButton")
donationsBtn.Size = UDim2.new(0, 90, 0, 25)
donationsBtn.Position = UDim2.new(0, 200, 0, 30)
donationsBtn.Text = "Donations"
donationsBtn.BackgroundColor3 = secondaryColor
donationsBtn.TextColor3 = textColor
donationsBtn.Font = Enum.Font.Gotham
donationsBtn.Parent = frame

local donationsBtnCorner = Instance.new("UICorner")
donationsBtnCorner.CornerRadius = UDim.new(0, 4)
donationsBtnCorner.Parent = donationsBtn

local donationsBtnStroke = Instance.new("UIStroke")
donationsBtnStroke.Thickness = 1
donationsBtnStroke.Color = strokeColor
donationsBtnStroke.Transparency = 0.5
donationsBtnStroke.Parent = donationsBtn

-- Content Frames
local mainContent = Instance.new("ScrollingFrame")
mainContent.Size = UDim2.new(1, -20, 1, -60)
mainContent.Position = UDim2.new(0, 10, 0, 60)
mainContent.BackgroundTransparency = 1
mainContent.ScrollBarThickness = 6
mainContent.ScrollingDirection = Enum.ScrollingDirection.Y
mainContent.CanvasSize = UDim2.new(0, 0, 0, 180)  -- Increased for new elements
mainContent.Parent = frame

local serverContent = Instance.new("ScrollingFrame")
serverContent.Size = UDim2.new(1, -20, 1, -60)
serverContent.Position = UDim2.new(0, 10, 0, 60)
serverContent.BackgroundTransparency = 1
serverContent.ScrollBarThickness = 6
serverContent.ScrollingDirection = Enum.ScrollingDirection.Y
serverContent.CanvasSize = UDim2.new(0, 0, 0, 50)
serverContent.Visible = false
serverContent.Parent = frame

local donationsContent = Instance.new("ScrollingFrame")
donationsContent.Size = UDim2.new(1, -20, 1, -60)
donationsContent.Position = UDim2.new(0, 10, 0, 60)
donationsContent.BackgroundTransparency = 1
donationsContent.ScrollBarThickness = 6
donationsContent.ScrollingDirection = Enum.ScrollingDirection.Y
donationsContent.CanvasSize = UDim2.new(0, 0, 0, 100)
donationsContent.Visible = false
donationsContent.Parent = frame

-- Server Tab Content
local serverLabel = Instance.new("TextLabel")
serverLabel.Size = UDim2.new(1, 0, 0, 30)
serverLabel.BackgroundTransparency = 1
serverLabel.Text = "https://discord.gg/apJQFG3f9M"
serverLabel.TextColor3 = accentColor
serverLabel.Font = Enum.Font.Code
serverLabel.TextScaled = true
serverLabel.Parent = serverContent

-- Donations Tab Content
local devsLabel = Instance.new("TextLabel")
devsLabel.Size = UDim2.new(1, 0, 0, 20)
devsLabel.Position = UDim2.new(0, 0, 0, 0)
devsLabel.BackgroundTransparency = 1
devsLabel.Text = "Devs: 5up3_"
devsLabel.TextColor3 = textColor
devsLabel.Font = Enum.Font.GothamBold
devsLabel.TextSize = 16
devsLabel.Parent = donationsContent

local cashappLabel = Instance.new("TextLabel")
cashappLabel.Size = UDim2.new(1, 0, 0, 20)
cashappLabel.Position = UDim2.new(0, 0, 0, 25)
cashappLabel.BackgroundTransparency = 1
cashappLabel.Text = "Cashapp: xe1ex"
cashappLabel.TextColor3 = accentColor
cashappLabel.Font = Enum.Font.Code
cashappLabel.TextSize = 14
cashappLabel.Parent = donationsContent

local litecoinLabel = Instance.new("TextLabel")
litecoinLabel.Size = UDim2.new(1, 0, 0, 20)
litecoinLabel.Position = UDim2.new(0, 0, 0, 50)
litecoinLabel.BackgroundTransparency = 1
litecoinLabel.Text = "LiteCoin: LiAs5iEaff9ZN1EEJFRVV2f9hGQhHcjTqq"
litecoinLabel.TextColor3 = accentColor
litecoinLabel.Font = Enum.Font.Code
litecoinLabel.TextSize = 14
litecoinLabel.Parent = donationsContent

-- Tab Switching
local function showMain()
    mainContent.Visible = true
    serverContent.Visible = false
    donationsContent.Visible = false
    TweenService:Create(mainHubBtn, TweenInfo.new(0.3), {BackgroundColor3 = accentColor}):Play()
    TweenService:Create(serverBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
    TweenService:Create(donationsBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
end

local function showServer()
    mainContent.Visible = false
    serverContent.Visible = true
    donationsContent.Visible = false
    TweenService:Create(mainHubBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
    TweenService:Create(serverBtn, TweenInfo.new(0.3), {BackgroundColor3 = accentColor}):Play()
    TweenService:Create(donationsBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
end

local function showDonations()
    mainContent.Visible = false
    serverContent.Visible = false
    donationsContent.Visible = true
    TweenService:Create(mainHubBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
    TweenService:Create(serverBtn, TweenInfo.new(0.3), {BackgroundColor3 = secondaryColor}):Play()
    TweenService:Create(donationsBtn, TweenInfo.new(0.3), {BackgroundColor3 = accentColor}):Play()
end

mainHubBtn.MouseButton1Click:Connect(showMain)
serverBtn.MouseButton1Click:Connect(showServer)
donationsBtn.MouseButton1Click:Connect(showDonations)

-- Main Hub Toggles
local aimbotToggle = Instance.new("TextButton")
aimbotToggle.Size = UDim2.new(0, 140, 0, 30)
aimbotToggle.Position = UDim2.new(0, 10, 0, 0)
aimbotToggle.Text = "Aimbot: OFF"
aimbotToggle.BackgroundColor3 = offColor
aimbotToggle.TextColor3 = textColor
aimbotToggle.Font = Enum.Font.Gotham
aimbotToggle.Parent = mainContent

local aimbotCorner = Instance.new("UICorner")
aimbotCorner.CornerRadius = UDim.new(0, 6)
aimbotCorner.Parent = aimbotToggle

local aimbotStroke = Instance.new("UIStroke")
aimbotStroke.Thickness = 1
aimbotStroke.Color = strokeColor
aimbotStroke.Transparency = 0.8
aimbotStroke.Parent = aimbotToggle

local wallhackToggle = Instance.new("TextButton")
wallhackToggle.Size = UDim2.new(0, 140, 0, 30)
wallhackToggle.Position = UDim2.new(0, 160, 0, 0)
wallhackToggle.Text = "Wallhack: OFF"
wallhackToggle.BackgroundColor3 = offColor
wallhackToggle.TextColor3 = textColor
wallhackToggle.Font = Enum.Font.Gotham
wallhackToggle.Parent = mainContent

local wallhackCorner = Instance.new("UICorner")
wallhackCorner.CornerRadius = UDim.new(0, 6)
wallhackCorner.Parent = wallhackToggle

local wallhackStroke = Instance.new("UIStroke")
wallhackStroke.Thickness = 1
wallhackStroke.Color = strokeColor
wallhackStroke.Transparency = 0.8
wallhackStroke.Parent = wallhackToggle

local flyToggle = Instance.new("TextButton")
flyToggle.Size = UDim2.new(0, 140, 0, 30)
flyToggle.Position = UDim2.new(0, 10, 0, 35)
flyToggle.Text = "Fly: OFF"
flyToggle.BackgroundColor3 = offColor
flyToggle.TextColor3 = textColor
flyToggle.Font = Enum.Font.Gotham
flyToggle.Parent = mainContent

local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 6)
flyCorner.Parent = flyToggle

local flyStroke = Instance.new("UIStroke")
flyStroke.Thickness = 1
flyStroke.Color = strokeColor
flyStroke.Transparency = 0.8
flyStroke.Parent = flyToggle

local speedToggle = Instance.new("TextButton")
speedToggle.Size = UDim2.new(0, 140, 0, 30)
speedToggle.Position = UDim2.new(0, 160, 0, 35)
speedToggle.Text = "Speed Hack: OFF"
speedToggle.BackgroundColor3 = offColor
speedToggle.TextColor3 = textColor
speedToggle.Font = Enum.Font.Gotham
speedToggle.Parent = mainContent

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 6)
speedCorner.Parent = speedToggle

local speedStroke = Instance.new("UIStroke")
speedStroke.Thickness = 1
speedStroke.Color = strokeColor
speedStroke.Transparency = 0.8
speedStroke.Parent = speedToggle

-- Aimbot target selection
local targetPartLabel = Instance.new("TextLabel")
targetPartLabel.Size = UDim2.new(0, 50, 0, 25)
targetPartLabel.Position = UDim2.new(0, 10, 0, 140)
targetPartLabel.BackgroundTransparency = 1
targetPartLabel.Text = "Aimbot Target: Head"
targetPartLabel.TextColor3 = textColor
targetPartLabel.TextSize = 14
targetPartLabel.Font = Enum.Font.Gotham
targetPartLabel.Parent = mainContent

local targetPart = "Head"  -- Default

local headBtn = Instance.new("TextButton")
headBtn.Size = UDim2.new(0, 50, 0, 25)
headBtn.Position = UDim2.new(0, 10, 0, 160)
headBtn.Text = "Head"
headBtn.BackgroundColor3 = accentColor
headBtn.TextColor3 = textColor
headBtn.Font = Enum.Font.Gotham
headBtn.Parent = mainContent

local headCorner = Instance.new("UICorner")
headCorner.CornerRadius = UDim.new(0, 4)
headCorner.Parent = headBtn

headBtn.MouseButton1Click:Connect(function()
    targetPart = "Head"
    targetPartLabel.Text = "Aimbot Target: Head"
end)

local torsoBtn = Instance.new("TextButton")
torsoBtn.Size = UDim2.new(0, 50, 0, 25)
torsoBtn.Position = UDim2.new(0, 65, 0, 160)
torsoBtn.Text = "Torso"
torsoBtn.BackgroundColor3 = secondaryColor
torsoBtn.TextColor3 = textColor
torsoBtn.Font = Enum.Font.Gotham
torsoBtn.Parent = mainContent

local torsoCorner = Instance.new("UICorner")
torsoCorner.CornerRadius = UDim.new(0, 4)
torsoCorner.Parent = torsoBtn

torsoBtn.MouseButton1Click:Connect(function()
    targetPart = "HumanoidRootPart"
    targetPartLabel.Text = "Aimbot Target: Torso"
end)

local armsBtn = Instance.new("TextButton")
armsBtn.Size = UDim2.new(0, 50, 0, 25)
armsBtn.Position = UDim2.new(0, 120, 0, 160)
armsBtn.Text = "Arms"
armsBtn.BackgroundColor3 = secondaryColor
armsBtn.TextColor3 = textColor
armsBtn.Font = Enum.Font.Gotham
armsBtn.Parent = mainContent

local armsCorner = Instance.new("UICorner")
armsCorner.CornerRadius = UDim.new(0, 4)
armsCorner.Parent = armsBtn

armsBtn.MouseButton1Click:Connect(function()
    targetPart = "LeftArm"  -- Or RightArm, but for simplicity
    targetPartLabel.Text = "Aimbot Target: Arms"
end)

local legsBtn = Instance.new("TextButton")
legsBtn.Size = UDim2.new(0, 50, 0, 25)
legsBtn.Position = UDim2.new(0, 175, 0, 160)
legsBtn.Text = "Legs"
legsBtn.BackgroundColor3 = secondaryColor
legsBtn.TextColor3 = textColor
legsBtn.Font = Enum.Font.Gotham
legsBtn.Parent = mainContent

local legsCorner = Instance.new("UICorner")
legsCorner.CornerRadius = UDim.new(0, 4)
legsCorner.Parent = legsBtn

legsBtn.MouseButton1Click:Connect(function()
    targetPart = "LeftLeg"  -- Or RightLeg
    targetPartLabel.Text = "Aimbot Target: Legs"
end)

local aimbotEnabled = false
local wallhackEnabled = false
local flyEnabled = false
local speedEnabled = false
local isShooting = false

-- Fly variables
local bodyVelocity = nil
local bodyGyro = nil
local moveDirection = Vector3.new(0, 0, 0)

-- FOV Circle GUI
local fovCircle = Instance.new("Frame")
fovCircle.Size = UDim2.new(0, FOV_RADIUS * 2, 0, FOV_RADIUS * 2)
fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.BackgroundTransparency = 1
fovCircle.Parent = screenGui
fovCircle.Visible = false

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = fovCircle

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = accentColor
uiStroke.Transparency = FOV_TRANSPARENCY
uiStroke.Parent = fovCircle

-- FOV Radius Slider
local sliderLabel = Instance.new("TextLabel")
sliderLabel.Size = UDim2.new(0, 140, 0, 15)
sliderLabel.Position = UDim2.new(0, 10, 0, 70)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "FOV Radius: " .. FOV_RADIUS
sliderLabel.TextColor3 = textColor
sliderLabel.TextSize = 14
sliderLabel.Font = Enum.Font.Gotham
sliderLabel.Parent = mainContent

local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(0, 180, 0, 8)
sliderFrame.Position = UDim2.new(0, 10, 0, 85)
sliderFrame.BackgroundColor3 = primaryColor
sliderFrame.Parent = mainContent

local sliderFrameCorner = Instance.new("UICorner")
sliderFrameCorner.CornerRadius = UDim.new(0, 4)
sliderFrameCorner.Parent = sliderFrame

local sliderKnob = Instance.new("TextButton")
sliderKnob.Size = UDim2.new(0, 16, 0, 16)
sliderKnob.Position = UDim2.new((FOV_RADIUS - MIN_FOV) / (MAX_FOV - MIN_FOV), -8, 0, -4)
sliderKnob.BackgroundColor3 = accentColor
sliderKnob.Text = ""
sliderKnob.Parent = sliderFrame

local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(0.5, 0)
knobCorner.Parent = sliderKnob

-- FOV Transparency Slider
local transSliderLabel = Instance.new("TextLabel")
transSliderLabel.Size = UDim2.new(0, 140, 0, 15)
transSliderLabel.Position = UDim2.new(0, 10, 0, 105)
transSliderLabel.BackgroundTransparency = 1
transSliderLabel.Text = "FOV Transparency: " .. string.format("%.2f", FOV_TRANSPARENCY)
transSliderLabel.TextColor3 = textColor
transSliderLabel.TextSize = 14
transSliderLabel.Font = Enum.Font.Gotham
transSliderLabel.Parent = mainContent

local transSliderFrame = Instance.new("Frame")
transSliderFrame.Size = UDim2.new(0, 180, 0, 8)
transSliderFrame.Position = UDim2.new(0, 10, 0, 120)
transSliderFrame.BackgroundColor3 = primaryColor
transSliderFrame.Parent = mainContent

local transSliderFrameCorner = Instance.new("UICorner")
transSliderFrameCorner.CornerRadius = UDim.new(0, 4)
transSliderFrameCorner.Parent = transSliderFrame

local transSliderKnob = Instance.new("TextButton")
transSliderKnob.Size = UDim2.new(0, 16, 0, 16)
transSliderKnob.Position = UDim2.new((FOV_TRANSPARENCY - MIN_TRANS) / (MAX_TRANS - MIN_TRANS), -8, 0, -4)
transSliderKnob.BackgroundColor3 = accentColor
transSliderKnob.Text = ""
transSliderKnob.Parent = transSliderFrame

local transKnobCorner = Instance.new("UICorner")
transKnobCorner.CornerRadius = UDim.new(0.5, 0)
transKnobCorner.Parent = transSliderKnob

-- Slider drag logic
local radiusDragging = false
sliderKnob.MouseButton1Down:Connect(function()
    radiusDragging = true
end)

local transDragging = false
transSliderKnob.MouseButton1Down:Connect(function()
    transDragging = true
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        radiusDragging = false
        transDragging = false
    end
end)

RunService.RenderStepped:Connect(function()
    if radiusDragging then
        local mouseX = UserInputService:GetMouseLocation().X
        local sliderStart = sliderFrame.AbsolutePosition.X
        local sliderWidth = sliderFrame.AbsoluteSize.X
        local relativeX = math.clamp(mouseX - sliderStart, 0, sliderWidth)
        local fraction = relativeX / sliderWidth
        FOV_RADIUS = math.round(MIN_FOV + fraction * (MAX_FOV - MIN_FOV))
        sliderKnob.Position = UDim2.new(fraction, -8, 0, -4)
        sliderLabel.Text = "FOV Radius: " .. FOV_RADIUS
        fovCircle.Size = UDim2.new(0, FOV_RADIUS * 2, 0, FOV_RADIUS * 2)
    end
    if transDragging then
        local mouseX = UserInputService:GetMouseLocation().X
        local sliderStart = transSliderFrame.AbsolutePosition.X
        local sliderWidth = transSliderFrame.AbsoluteSize.X
        local relativeX = math.clamp(mouseX - sliderStart, 0, sliderWidth)
        local fraction = relativeX / sliderWidth
        FOV_TRANSPARENCY = MIN_TRANS + fraction * (MAX_TRANS - MIN_TRANS)
        transSliderKnob.Position = UDim2.new(fraction, -8, 0, -4)
        transSliderLabel.Text = "FOV Transparency: " .. string.format("%.2f", FOV_TRANSPARENCY)
        uiStroke.Transparency = FOV_TRANSPARENCY
    end
end)

-- Aimbot Functionality
aimbotToggle.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    local targetColor = aimbotEnabled and onColor or offColor
    TweenService:Create(aimbotToggle, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
    aimbotToggle.Text = "Aimbot: " .. (aimbotEnabled and "ON" or "OFF")
    fovCircle.Visible = aimbotEnabled
end)

-- Wallhack Functionality (improved with better visuals: fill transparency and outline)
wallhackToggle.MouseButton1Click:Connect(function()
    wallhackEnabled = not wallhackEnabled
    local targetColor = wallhackEnabled and onColor or offColor
    TweenService:Create(wallhackToggle, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
    wallhackToggle.Text = "Wallhack: " .. (wallhackEnabled and "ON" or "OFF")
    if wallhackEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Team ~= player.Team and p.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                highlight.FillTransparency = 0.5  -- Semi-transparent fill for better look
                highlight.OutlineTransparency = 0  -- Solid outline
                highlight.Parent = p.Character
                highlight.Name = "WallhackHighlight"
            end
        end
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("WallhackHighlight") then
                p.Character.WallhackHighlight:Destroy()
            end
        end
    end
end)

-- Fly Functionality
flyToggle.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    local targetColor = flyEnabled and onColor or offColor
    TweenService:Create(flyToggle, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
    flyToggle.Text = "Fly: " .. (flyEnabled and "ON" or "OFF")
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    if flyEnabled then
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = root
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.CFrame = root.CFrame
        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bodyGyro.Parent = root
        char.Humanoid.PlatformStand = true
    else
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        char.Humanoid.PlatformStand = false
    end
end)

-- Fly controls
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not flyEnabled then return end
    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = moveDirection + Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = moveDirection + Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = moveDirection + Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = moveDirection + Vector3.new(1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveDirection = moveDirection + Vector3.new(0, 1, 0)
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        moveDirection = moveDirection + Vector3.new(0, -1, 0)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed or not flyEnabled then return end
    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = moveDirection - Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = moveDirection - Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = moveDirection - Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = moveDirection - Vector3.new(1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveDirection = moveDirection - Vector3.new(0, 1, 0)
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        moveDirection = moveDirection - Vector3.new(0, -1, 0)
    end
end)

RunService.RenderStepped:Connect(function()
    if flyEnabled and bodyVelocity and bodyGyro then
        bodyGyro.CFrame = camera.CFrame
        local camLook = camera.CFrame.LookVector
        local camRight = camera.CFrame.RightVector
        local camUp = Vector3.new(0, 1, 0)
        local move = Vector3.new()
        move = move + moveDirection.X * camRight
        move = move - moveDirection.Z * camLook
        move = move + moveDirection.Y * camUp
        if move.Magnitude > 0 then
            move = move.Unit
        end
        bodyVelocity.Velocity = move * FLY_SPEED
    end
end)

-- Speed Hack Functionality
local function setSpeed(speed)
    local char = player.Character
    if char then
        local humanoid = char:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.WalkSpeed = speed
        end
    end
end

speedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    local targetColor = speedEnabled and onColor or offColor
    TweenService:Create(speedToggle, TweenInfo.new(0.3), {BackgroundColor3 = targetColor}):Play()
    speedToggle.Text = "Speed Hack: " .. (speedEnabled and "ON" or "OFF")
    if speedEnabled then
        setSpeed(SPEED_HACK_VALUE)
    else
        setSpeed(DEFAULT_WALK_SPEED)
    end
end)

player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        if speedEnabled then
            humanoid.WalkSpeed = SPEED_HACK_VALUE
        else
            humanoid.WalkSpeed = DEFAULT_WALK_SPEED
        end
    end
end)

Players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Connect(function(char)
        if wallhackEnabled and newPlayer.Team ~= player.Team then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Parent = char
            highlight.Name = "WallhackHighlight"
        end
    end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        isShooting = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not radiusDragging and not transDragging then
        isShooting = false
    end
end)

RunService.RenderStepped:Connect(function()
    if aimbotEnabled and isShooting then
        local closestEnemy = nil
        local closestDist = math.huge
        local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Team ~= player.Team and p.Character and p.Character:FindFirstChild(targetPart) then
                local humanoid = p.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local root = p.Character[targetPart]
                    local worldDist = (root.Position - camera.CFrame.Position).Magnitude
                    if worldDist < MAX_RANGE then
                        local viewportPos, onScreen = camera:WorldToViewportPoint(root.Position)
                        if onScreen then
                            local screenPos = Vector2.new(viewportPos.X, viewportPos.Y)
                            local screenDist = (screenPos - center).Magnitude
                            if screenDist <= FOV_RADIUS and screenDist < closestDist then
                                closestDist = screenDist 
                                closestEnemy = root
                            end
                        end
                    end
                end
            end
        end
        if closestEnemy then
            local targetCFrame = CFrame.new(camera.CFrame.Position, closestEnemy.Position)
            camera.CFrame = camera.CFrame:Lerp(targetCFrame, SMOOTHNESS)
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Y then
        if keyVerified then
            frame.Visible = not frame.Visible
        end
    end
end)

-- Mobile toggle button
local mobileToggle = Instance.new("TextButton")
mobileToggle.Size = UDim2.new(0, 50, 0, 50)
mobileToggle.Position = UDim2.new(1, -60, 1, -60)
mobileToggle.BackgroundColor3 = accentColor
mobileToggle.Text = "Menu"
mobileToggle.TextColor3 = textColor
mobileToggle.Font = Enum.Font.Gotham
mobileToggle.Parent = screenGui
mobileToggle.Visible = UserInputService.TouchEnabled  -- Show only on mobile

local mobileCorner = Instance.new("UICorner")
mobileCorner.CornerRadius = UDim.new(1, 0)
mobileCorner.Parent = mobileToggle

mobileToggle.MouseButton1Click:Connect(function()
    if keyVerified then
        frame.Visible = not frame.Visible
    end
end)

-- Hover effects for toggles with scale animation
local function addHoverEffect(button)
    local originalColor = button.BackgroundColor3
    local originalSize = button.Size
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor:Lerp(accentColor, 0.2), Size = originalSize + UDim2.new(0, 5, 0, 5)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor, Size = originalSize}):Play()
    end)
end

addHoverEffect(aimbotToggle)
addHoverEffect(wallhackToggle)
addHoverEffect(flyToggle)
addHoverEffect(speedToggle)
addHoverEffect(submitKey)
addHoverEffect(mainHubBtn)
addHoverEffect(serverBtn)
addHoverEffect(donationsBtn)
addHoverEffect(closeBtn)
addHoverEffect(mobileToggle)
addHoverEffect(creditsBtn)
addHoverEffect(creditsClose)
addHoverEffect(headBtn)
addHoverEffect(torsoBtn)
addHoverEffect(armsBtn)
addHoverEffect(legsBtn)

showMain()

showMain()
