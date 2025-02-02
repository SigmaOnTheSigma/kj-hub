local player = game.Players.LocalPlayer

local char = player.Character

local crimpart = game.Workspace["Criminals Spawn"].SpawnLocation

local hrp = char.HumanoidRootPart


crimpart.CanCollide = false
crimpart.CFrame = hrp.CFrame
