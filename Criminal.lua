local player = game.Players.LocalPlayer

local char = player.Character

local crimpart = game.Workspace["Criminals Spawn"].SpawnLocation
local pos = "-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0"
local hrp = char.HumanoidRootPart


crimpart.CanCollide = false
crimpart.CFrame = hrp.CFrame
wait(0.1)

crimpart.CFrame = pos
