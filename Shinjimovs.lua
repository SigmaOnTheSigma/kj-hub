loadstring(game:HttpGet('https://github.com/SigmaOnTheSigma/kj-hub/blob/Movesetid/Moveset'))()

local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

-- Button 1
local baseButton1 = hotbarFrame:FindFirstChild("1").Base
local ToolName1 = baseButton1.ToolName
ToolName1.Text = "Speed Kicks"

-- Button 2
local baseButton2 = hotbarFrame:FindFirstChild("2").Base
local ToolName2 = baseButton2.ToolName
ToolName2.Text = "Light-Speed BodySlam"

-- Button 3
local baseButton3 = hotbarFrame:FindFirstChild("3").Base
local ToolName3 = baseButton3.ToolName
ToolName3.Text = "Power Of Grasp"

-- Button 4
local baseButton4 = hotbarFrame:FindFirstChild("4").Base
local ToolName4 = baseButton4.ToolName
ToolName4.Text = "Super-Speed Counter"

local function waitForGui()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    while true do
        local screenGui = playerGui:FindFirstChild("ScreenGui")
        if screenGui then
            local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
            if magicHealthFrame then
                local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
                if textLabel then
                    textLabel.Text = "Martial Legend"
                    return
                end
            end
        end
        wait(1)
    end
end

waitForGui()
