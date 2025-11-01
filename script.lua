-- Arsenal Cheat (Corlexs Hub)
-- https://discord.gg/rYuhaMDKJ5
-- developer: 5up3_ | Add if script has issues

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService") 
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

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 250) 
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui
frame.Visible = false 
frame.ClipsDescendants = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 1
frameStroke.Color = Color3.fromRGB(100, 100, 100)
frameStroke.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 25) 
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.Parent = frame
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Corlexs Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16 -- Smaller text
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = titleBar
-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25) -- Reduced size
closeBtn.Position = UDim2.new(1, -25, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18 -- Smaller
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
if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
if input.UserInputType == Enum.UserInputType.MouseMovement then
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
keyPrompt.Size = UDim2.new(0, 250, 0, 120) -- Reduced size for compactness
keyPrompt.Position = UDim2.new(0.5, -125, 0.5, -60)
keyPrompt.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyPrompt.Parent = screenGui
local keyPromptCorner = Instance.new("UICorner")
keyPromptCorner.CornerRadius = UDim.new(0, 8)
keyPromptCorner.Parent = keyPrompt

local corlexLabel = Instance.new("TextLabel")
corlexLabel.Size = UDim2.new(0, 200, 0, 25)
corlexLabel.Position = UDim2.new(0.5, -100, 0.2, 0)
corlexLabel.BackgroundTransparency = 1
corlexLabel.Text = "Corlexs Hub"
corlexLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
corlexLabel.TextSize = 22
corlexLabel.Font = Enum.Font.GothamBlack -- Amazing font
corlexLabel.Parent = keyPrompt
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 180, 0, 25) -- Reduced size
keyBox.Position = UDim2.new(0.5, -90, 0.45, 0)
keyBox.PlaceholderText = "Enter Key..."
keyBox.Parent = keyPrompt
local submitKey = Instance.new("TextButton")
submitKey.Size = UDim2.new(0, 70, 0, 25) -- Reduced size
submitKey.Position = UDim2.new(0.5, -35, 0.7, 0)
submitKey.Text = "Submit"
submitKey.Parent = keyPrompt
submitKey.MouseButton1Click:Connect(function()
if keyBox.Text == "OnlyKeyz14" then
keyPrompt:Destroy()
frame.Visible = true
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
⣿⣧⠀⠀⠀⠸⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣿⡄⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⢀⣾⡏
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
https://discord.gg/rYuhaMDKJ5
]])
else
keyBox.Text = ""
keyBox.PlaceholderText = "Wrong Key!"
end
end)
-- Tab Buttons (with rounded corners, make them stand out with brighter colors and strokes)
local mainHubBtn = Instance.new("TextButton")
mainHubBtn.Size = UDim2.new(0, 90, 0, 25) -- Reduced size
mainHubBtn.Position = UDim2.new(0, 10, 0, 30) -- Adjusted position
mainHubBtn.Text = "Main Hub"
mainHubBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80) -- Brighter to stand out
mainHubBtn.Parent = frame
local mainBtnCorner = Instance.new("UICorner")
mainBtnCorner.CornerRadius = UDim.new(0, 4)
mainBtnCorner.Parent = mainHubBtn
local mainBtnStroke = Instance.new("UIStroke")
mainBtnStroke.Thickness = 1
mainBtnStroke.Color = Color3.fromRGB(255, 255, 255)
mainBtnStroke.Transparency = 0.5
mainBtnStroke.Parent = mainHubBtn
local serverBtn = Instance.new("TextButton")
serverBtn.Size = UDim2.new(0, 90, 0, 25)
serverBtn.Position = UDim2.new(0, 105, 0, 30)
serverBtn.Text = "Server"
serverBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80) -- Brighter to stand out
serverBtn.Parent = frame
local serverBtnCorner = Instance.new("UICorner")
serverBtnCorner.CornerRadius = UDim.new(0, 4)
serverBtnCorner.Parent = serverBtn
local serverBtnStroke = Instance.new("UIStroke")
serverBtnStroke.Thickness = 1
serverBtnStroke.Color = Color3.fromRGB(255, 255, 255)
serverBtnStroke.Transparency = 0.5
serverBtnStroke.Parent = serverBtn
local donationsBtn = Instance.new("TextButton")
donationsBtn.Size = UDim2.new(0, 90, 0, 25)
donationsBtn.Position = UDim2.new(0, 200, 0, 30)
donationsBtn.Text = "Donations"
donationsBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80) -- Brighter to stand out
donationsBtn.Parent = frame
local donationsBtnCorner = Instance.new("UICorner")
donationsBtnCorner.CornerRadius = UDim.new(0, 4)
donationsBtnCorner.Parent = donationsBtn
local donationsBtnStroke = Instance.new("UIStroke")
donationsBtnStroke.Thickness = 1
donationsBtnStroke.Color = Color3.fromRGB(255, 255, 255)
donationsBtnStroke.Transparency = 0.5
donationsBtnStroke.Parent = donationsBtn
-- Content Frames (changed to ScrollingFrames for scrollability)
local mainContent = Instance.new("ScrollingFrame")
mainContent.Size = UDim2.new(1, -20, 1, -60) -- Adjusted for compactness
mainContent.Position = UDim2.new(0, 10, 0, 60)
mainContent.BackgroundTransparency = 1
mainContent.ScrollBarThickness = 6
mainContent.ScrollingDirection = Enum.ScrollingDirection.Y
mainContent.CanvasSize = UDim2.new(0, 0, 0, 150) -- Increased to account for added space
mainContent.Parent = frame
local serverContent = Instance.new("ScrollingFrame")
serverContent.Size = UDim2.new(1, -20, 1, -60)
serverContent.Position = UDim2.new(0, 10, 0, 60)
serverContent.BackgroundTransparency = 1
serverContent.ScrollBarThickness = 6
serverContent.ScrollingDirection = Enum.ScrollingDirection.Y
serverContent.CanvasSize = UDim2.new(0, 0, 0, 50) -- Adjusted for content
serverContent.Visible = false
serverContent.Parent = frame
local donationsContent = Instance.new("ScrollingFrame")
donationsContent.Size = UDim2.new(1, -20, 1, -60)
donationsContent.Position = UDim2.new(0, 10, 0, 60)
donationsContent.BackgroundTransparency = 1
donationsContent.ScrollBarThickness = 6
donationsContent.ScrollingDirection = Enum.ScrollingDirection.Y
donationsContent.CanvasSize = UDim2.new(0, 0, 0, 100) -- Adjusted for content
donationsContent.Visible = false
donationsContent.Parent = frame
-- Server Tab Content
local serverLabel = Instance.new("TextLabel")
serverLabel.Size = UDim2.new(1, 0, 0, 30) -- Adjusted to fit in scroll
serverLabel.BackgroundTransparency = 1
serverLabel.Text = "gg/rYuhaMDKJ5"
serverLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
serverLabel.Font = Enum.Font.Code
serverLabel.TextScaled = true
serverLabel.Parent = serverContent
-- Donations Tab Content
local devsLabel = Instance.new("TextLabel")
devsLabel.Size = UDim2.new(1, 0, 0, 20) -- Reduced height
devsLabel.Position = UDim2.new(0, 0, 0, 0)
devsLabel.BackgroundTransparency = 1
devsLabel.Text = "Devs: OnlyKeyz, Corlex"
devsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
devsLabel.Font = Enum.Font.SourceSansBold
devsLabel.TextSize = 16 -- Smaller
devsLabel.Parent = donationsContent
local cashappLabel = Instance.new("TextLabel")
cashappLabel.Size = UDim2.new(1, 0, 0, 20)
cashappLabel.Position = UDim2.new(0, 0, 0, 25)
cashappLabel.BackgroundTransparency = 1
cashappLabel.Text = "Cashapp: xe1ex"
cashappLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
cashappLabel.Font = Enum.Font.Code
cashappLabel.TextSize = 14 -- Smaller
cashappLabel.Parent = donationsContent
local litecoinLabel = Instance.new("TextLabel")
litecoinLabel.Size = UDim2.new(1, 0, 0, 20)
litecoinLabel.Position = UDim2.new(0, 0, 0, 50)
litecoinLabel.BackgroundTransparency = 1
litecoinLabel.Text = "LiteCoin: LiAs5iEaff9ZN1EEJFRVV2f9hGQhHcjTqq"
litecoinLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
litecoinLabel.Font = Enum.Font.Code
litecoinLabel.TextSize = 14 -- Smaller
litecoinLabel.Parent = donationsContent
-- Tab Switching
local function showMain()
mainContent.Visible = true
serverContent.Visible = false
donationsContent.Visible = false
end
local function showServer()
mainContent.Visible = false
serverContent.Visible = true
donationsContent.Visible = false
end
local function showDonations()
mainContent.Visible = false
serverContent.Visible = false
donationsContent.Visible = true
end
mainHubBtn.MouseButton1Click:Connect(showMain)
serverBtn.MouseButton1Click:Connect(showServer)
donationsBtn.MouseButton1Click:Connect(showDonations)
-- Main Hub Toggles (with rounded corners and strokes, reduced sizes and tighter spacing)
local aimbotToggle = Instance.new("TextButton")
aimbotToggle.Size = UDim2.new(0, 140, 0, 30) -- Reduced size
aimbotToggle.Position = UDim2.new(0, 10, 0, 0) -- Adjusted
aimbotToggle.Text = "Aimbot: OFF"
aimbotToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
aimbotToggle.Parent = mainContent
local aimbotCorner = Instance.new("UICorner")
aimbotCorner.CornerRadius = UDim.new(0, 6)
aimbotCorner.Parent = aimbotToggle
local aimbotStroke = Instance.new("UIStroke")
aimbotStroke.Thickness = 1
aimbotStroke.Color = Color3.fromRGB(255, 255, 255)
aimbotStroke.Transparency = 0.8
aimbotStroke.Parent = aimbotToggle
local wallhackToggle = Instance.new("TextButton")
wallhackToggle.Size = UDim2.new(0, 140, 0, 30)
wallhackToggle.Position = UDim2.new(0, 160, 0, 0) -- Side by side
wallhackToggle.Text = "Wallhack: OFF"
wallhackToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
wallhackToggle.Parent = mainContent
local wallhackCorner = Instance.new("UICorner")
wallhackCorner.CornerRadius = UDim.new(0, 6)
wallhackCorner.Parent = wallhackToggle
local wallhackStroke = Instance.new("UIStroke")
wallhackStroke.Thickness = 1
wallhackStroke.Color = Color3.fromRGB(255, 255, 255)
wallhackStroke.Transparency = 0.8
wallhackStroke.Parent = wallhackToggle
local flyToggle = Instance.new("TextButton")
flyToggle.Size = UDim2.new(0, 140, 0, 30)
flyToggle.Position = UDim2.new(0, 10, 0, 35) -- Tighter spacing
flyToggle.Text = "Fly: OFF"
flyToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
flyToggle.Parent = mainContent
local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 6)
flyCorner.Parent = flyToggle
local flyStroke = Instance.new("UIStroke")
flyStroke.Thickness = 1
flyStroke.Color = Color3.fromRGB(255, 255, 255)
flyStroke.Transparency = 0.8
flyStroke.Parent = flyToggle
local speedToggle = Instance.new("TextButton")
speedToggle.Size = UDim2.new(0, 140, 0, 30)
speedToggle.Position = UDim2.new(0, 160, 0, 35)
speedToggle.Text = "Speed Hack: OFF"
speedToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
speedToggle.Parent = mainContent
local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 6)
speedCorner.Parent = speedToggle
local speedStroke = Instance.new("UIStroke")
speedStroke.Thickness = 1
speedStroke.Color = Color3.fromRGB(255, 255, 255)
speedStroke.Transparency = 0.8
speedStroke.Parent = speedToggle
local aimbotEnabled = false
local wallhackEnabled = false
local flyEnabled = false
local speedEnabled = false
local isShooting = false -- Track if player is shooting
-- Fly variables
local bodyVelocity = nil
local bodyGyro = nil
local moveDirection = Vector3.new(0, 0, 0)
-- FOV Circle GUI (visible when aimbot is enabled)
local fovCircle = Instance.new("Frame")
fovCircle.Size = UDim2.new(0, FOV_RADIUS * 2, 0, FOV_RADIUS * 2)
fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.BackgroundTransparency = 1 -- Invisible fill
fovCircle.Parent = screenGui
fovCircle.Visible = false -- Hidden by default
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = fovCircle
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Transparency = FOV_TRANSPARENCY
uiStroke.Parent = fovCircle
-- FOV Radius Slider in Main Hub
local sliderLabel = Instance.new("TextLabel")
sliderLabel.Size = UDim2.new(0, 140, 0, 15) -- Reduced
sliderLabel.Position = UDim2.new(0, 10, 0, 70)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "FOV Radius: " .. FOV_RADIUS
sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.TextSize = 14 -- Smaller
sliderLabel.Parent = mainContent
local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(0, 180, 0, 8) -- Reduced
sliderFrame.Position = UDim2.new(0, 10, 0, 85)
sliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
sliderFrame.Parent = mainContent
local sliderKnob = Instance.new("TextButton")
sliderKnob.Size = UDim2.new(0, 16, 0, 16) -- Reduced
sliderKnob.Position = UDim2.new((FOV_RADIUS - MIN_FOV) / (MAX_FOV - MIN_FOV), -8, 0, -4)
sliderKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
sliderKnob.Text = ""
sliderKnob.Parent = sliderFrame
-- Make knob round
local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(0.5, 0)
knobCorner.Parent = sliderKnob
-- FOV Transparency Slider in Main Hub
local transSliderLabel = Instance.new("TextLabel")
transSliderLabel.Size = UDim2.new(0, 140, 0, 15)
transSliderLabel.Position = UDim2.new(0, 10, 0, 105) -- Added space
transSliderLabel.BackgroundTransparency = 1
transSliderLabel.Text = "FOV Transparency: " .. string.format("%.2f", FOV_TRANSPARENCY)
transSliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transSliderLabel.TextSize = 14
transSliderLabel.Parent = mainContent
local transSliderFrame = Instance.new("Frame")
transSliderFrame.Size = UDim2.new(0, 180, 0, 8)
transSliderFrame.Position = UDim2.new(0, 10, 0, 120) -- Added space
transSliderFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
transSliderFrame.Parent = mainContent
local transSliderKnob = Instance.new("TextButton")
transSliderKnob.Size = UDim2.new(0, 16, 0, 16)
transSliderKnob.Position = UDim2.new((FOV_TRANSPARENCY - MIN_TRANS) / (MAX_TRANS - MIN_TRANS), -8, 0, -4)
transSliderKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
transSliderKnob.Text = ""
transSliderKnob.Parent = transSliderFrame
-- Make knob round
local transKnobCorner = Instance.new("UICorner")
transKnobCorner.CornerRadius = UDim.new(0.5, 0)
transKnobCorner.Parent = transSliderKnob
-- Slider drag logic for radius
local radiusDragging = false
sliderKnob.MouseButton1Down:Connect(function()
radiusDragging = true
end)
-- Slider drag logic for transparency
local transDragging = false
transSliderKnob.MouseButton1Down:Connect(function()
transDragging = true
end)
UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
-- Aimbot Functionality (Toggle) - Also toggles FOV circle visibility
aimbotToggle.MouseButton1Click:Connect(function()
aimbotEnabled = not aimbotEnabled
aimbotToggle.Text = "Aimbot: " .. (aimbotEnabled and "ON" or "OFF")
aimbotToggle.BackgroundColor3 = aimbotEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
fovCircle.Visible = aimbotEnabled
end)
-- Wallhack Functionality (Highlights enemies through walls)
wallhackToggle.MouseButton1Click:Connect(function()
wallhackEnabled = not wallhackEnabled
wallhackToggle.Text = "Wallhack: " .. (wallhackEnabled and "ON" or "OFF")
wallhackToggle.BackgroundColor3 = wallhackEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
if wallhackEnabled then
for _, p in ipairs(Players:GetPlayers()) do
if p ~= player and p.Team ~= player.Team and p.Character then
local highlight = Instance.new("Highlight")
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
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
flyToggle.Text = "Fly: " .. (flyEnabled and "ON" or "OFF")
flyToggle.BackgroundColor3 = flyEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
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
-- Update fly every frame (fixed to use camera-relative movement and normalized speed)
RunService.RenderStepped:Connect(function()
if flyEnabled and bodyVelocity and bodyGyro then
bodyGyro.CFrame = camera.CFrame
local camLook = camera.CFrame.LookVector
local camRight = camera.CFrame.RightVector
local camUp = Vector3.new(0, 1, 0)
local move = Vector3.new()
move = move + moveDirection.X * camRight
move = move - moveDirection.Z * camLook -- Negative Z for forward (W)
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
local humanoid = char:WaitForChild("Humanoid", 5) -- Wait for Humanoid with timeout
if humanoid then
humanoid.WalkSpeed = speed
end
end
end
speedToggle.MouseButton1Click:Connect(function()
speedEnabled = not speedEnabled
speedToggle.Text = "Speed Hack: " .. (speedEnabled and "ON" or "OFF")
speedToggle.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
if speedEnabled then
setSpeed(SPEED_HACK_VALUE)
else
setSpeed(DEFAULT_WALK_SPEED)
end
end)

player.CharacterAdded:Connect(function(char)
local humanoid = char:WaitForChild("Humanoid", 5) -- Wait for Humanoid
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
highlight.Parent = char
highlight.Name = "WallhackHighlight"
end
end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
isShooting = true
end
end)
UserInputService.InputEnded:Connect(function(input, gameProcessed)
if input.UserInputType == Enum.UserInputType.MouseButton1 and not radiusDragging and not transDragging then
isShooting = false
end
end)

RunService.RenderStepped:Connect(function()
if aimbotEnabled and isShooting then
local closestEnemy = nil
local closestDist = math.huge
local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
for _, p in ipairs(Players:GetPlayers()) do
if p ~= player and p.Team ~= player.Team and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
local root = p.Character.HumanoidRootPart
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
if closestEnemy then

local targetCFrame = CFrame.new(camera.CFrame.Position, closestEnemy.Position)

camera.CFrame = camera.CFrame:Lerp(targetCFrame, SMOOTHNESS)
end
end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.Y then
frame.Visible = not frame.Visible
end
end)

showMain()
