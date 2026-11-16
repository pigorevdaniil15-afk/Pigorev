local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "PIGOREV HACK",
    LoadingTitle = "Загрузка...",
    Theme = "Amethyst",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("Visual", 4483362458)

Tab:CreateToggle({
    Name = "Box ESP",
    CurrentValue = false,
    Flag = "BoxESP",
    Callback = function(value)
        -- Тут будет твой код ESP (пока пусто для теста)
        print("ESP: " .. tostring(value))
    end
})

Tab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(value)
        print("Fly: " .. tostring(value))
    end
})

Tab:CreateSlider({
    Name = "Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "ws",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(value)
        print("Speed: " .. value)
    end
})
