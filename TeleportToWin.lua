local player = game.Players.LocalPlayer
local char = player.Character
local hrp = char.HumanoidRootPart
local teleportto = game.Workspace["Purchase Station"].PurchasePlate

hrp.CFrame = teleportto.CFrame
