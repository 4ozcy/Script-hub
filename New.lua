local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local mainWindow = Library:NewWindow("Skidd hub")

local main = mainWindow:NewSection("Map")

main:CreateButton("teleport", function()
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character.HumanoidRootPart

local teleportPosition1 = CFrame.new(287.6754, 439.5106, 480.3295)
local teleportPosition2 = CFrame.new(239.7410, 443.8971, -110.4596)

humanoidRootPart.CFrame = teleportPosition1
wait(3.2)
humanoidRootPart.CFrame = teleportPosition2
    
end)

local main = mainWindow:NewSection("Player")

main:CreateTextbox("Username", function(text)
    targetUsername = text
end)

main:CreateButton("teleport", function()
    local players = getPlayer(targetUsername, game.Players.LocalPlayer)
    
    for i, v in pairs(players) do
        if game.Players[v] and game.Players[v].Character then
            local speaker = game.Players.LocalPlayer
            local humanoid = speaker.Character:FindFirstChildOfClass('Humanoid')

            if humanoid and humanoid.SeatPart then
                humanoid.Sit = false
                wait(0.1)
            end
            
            local speakerRoot = getRoot(speaker.Character)
            local targetRoot = getRoot(game.Players[v].Character)
            speakerRoot.CFrame = targetRoot.CFrame + Vector3.new(3, 1, 0)
        end
    end
end)
