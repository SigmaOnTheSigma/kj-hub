-- LocalScript (placed in StarterPlayerScripts)

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = gui

-- Make Frame Draggable
local dragging = false
local dragStart = nil
local startPos = nil

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Create Buttons
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 180, 0, 40)
button1.Position = UDim2.new(0, 10, 0, 10)
button1.Text = "Toggle Walk Speed"
button1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button1.Parent = frame

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 180, 0, 40)
button2.Position = UDim2.new(0, 10, 0, 60)
button2.Text = "Rat Dance"
button2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
button2.Parent = frame

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 180, 0, 40)
button3.Position = UDim2.new(0, 10, 0, 110)
button3.Text = "Slickback Dance"
button3.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
button3.Parent = frame

-- Walk Speed Toggle
local normalWalkSpeed = player.Character.Humanoid.WalkSpeed
local isSpeedChanged = false

button1.MouseButton1Click:Connect(function()
    if isSpeedChanged then
        player.Character.Humanoid.WalkSpeed = normalWalkSpeed
        isSpeedChanged = false
    else
        player.Character.Humanoid.WalkSpeed = 75
        isSpeedChanged = true
    end
end)

-- Rat Dance Meme (second button)
button2.MouseButton1Click:Connect(function()
    local character = player.Character
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Make arms move back and forth to simulate dance
    local leftArm = character:WaitForChild("LeftArm")
    local rightArm = character:WaitForChild("RightArm")
    local leftLeg = character:WaitForChild("LeftLeg")
    local rightLeg = character:WaitForChild("RightLeg")
    
    -- Make arms move alternately by rotating them slightly
    leftArm.RotVelocity = Vector3.new(0, 10, 0)
    rightArm.RotVelocity = Vector3.new(0, -10, 0)
    
    -- Simulate leg movement
    leftLeg.RotVelocity = Vector3.new(0, 15, 0)
    rightLeg.RotVelocity = Vector3.new(0, -15, 0)
    
    -- Simple torso shift
    humanoid.HipHeight = 3
    humanoid.PlatformStand = true
    wait(0.5)
    humanoid.PlatformStand = false
    humanoid.HipHeight = 2
end)

-- Slickback Dance Meme (third button)
button3.MouseButton1Click:Connect(function()
    local character = player.Character
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Make the character move in a "slickback" manner
    local head = character:WaitForChild("Head")
    local leftArm = character:WaitForChild("LeftArm")
    local rightArm = character:WaitForChild("RightArm")
    local torso = character:WaitForChild("Torso")
    
    -- Simulate small head tilts for slickback effect
    head.RotVelocity = Vector3.new(0, 10, 0)
    
    -- Move arms in alternating fashion
    leftArm.RotVelocity = Vector3.new(0, -5, 0)
    rightArm.RotVelocity = Vector3.new(0, 5, 0)
    
    -- Slight torso movement to mimic the slickback style
    humanoid.HipHeight = 3
    humanoid.PlatformStand = true
    wait(0.5)
    humanoid.PlatformStand = false
    humanoid.HipHeight = 2
end)
