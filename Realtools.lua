local function createTool(toolName, animationId, speedOnActivate, speedOnDeactivate)
    -- Create a tool
    local tool = Instance.new("Tool")
    tool.Name = toolName
    tool.RequiresHandle = true

    -- Create a handle for the tool
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 5, 1)
    handle.Anchored = false
    handle.CanCollide = false
    handle.Parent = tool

    -- Create an Animator for the tool
    local animator = Instance.new("Animator")
    animator.Parent = handle

    -- Create an animation
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animationId
    animation.Parent = animator

    -- Function to set the player's walk speed
    local function setWalkSpeed(speed)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speed
            end
        end
    end

    -- Play animation and change walk speed when tool is activated
    tool.Activated:Connect(function()
        local track = animator:LoadAnimation(animation)
        track:Play()

        -- Change walk speed to the specified value
        setWalkSpeed(speedOnActivate)

        track.Stopped:Connect(function()
            track:Stop()
        end)
    end)

    -- Stop animation and reset walk speed when tool is deactivated or unequipped
    tool.Deactivated:Connect(function()
        local track = animator:LoadAnimation(animation)
        track:Stop()

        -- Reset walk speed to the default value
        setWalkSpeed(speedOnDeactivate)
    end)

    -- Reset walk speed when tool is unequipped
    tool.Equipped:Connect(function()
        -- Do nothing when equipped (no speed change)
    end)

    tool.Unequipped:Connect(function()
        -- Reset walk speed when tool is unequipped
        setWalkSpeed(speedOnDeactivate)
    end)

    return tool
end

-- Create the first tool "Fast Running" with animation ID 18897115785 and speed change
local tool1 = createTool("Fast Running", "18897115785", 99, 23)
tool1.Parent = game.Players.LocalPlayer.Backpack

-- Create the second tool "Wall Combo" with animation ID 18715756612
local tool2 = createTool("Wall Combo", "18715756612", 23, 23) -- No speed change for this tool
tool2.Parent = game.Players.LocalPlayer.Backpack

-- Create the third tool "Head First" with animation ID 18464362124
local tool3 = createTool("Head First", "18464362124", 23, 23) -- No speed change for this tool
tool3.Parent = game.Players.LocalPlayer.Backpack
