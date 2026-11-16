-- PIGOREV HACK | Premium
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local P = game:GetService("Players")
local RS = game:GetService("RunService")
local C = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local LP = P.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
local KEY = "RagePigorev"
local unlocked = false
local S = {aim=0, esp=0, sk=0, gl=0, hp=0, name=0, bright=0}
local SD, BD, HL, HD, ND = {}, {}, {}, {}, {}
local N = Color3.fromRGB(190, 0, 255)
local aspect = 1.0
local fov = 120

-- ===== ОКНО КЛЮЧА =====
local KG = Instance.new("ScreenGui")
KG.Name = "PigorevKey"
KG.ResetOnSpawn = false
KG.IgnoreGuiInset = true
KG.Parent = PG

local KF = Instance.new("Frame", KG)
KF.Size = UDim2.new(0, 280, 0, 190)
KF.Position = UDim2.new(.5, -140, .5, -95)
KF.BackgroundColor3 = Color3.fromRGB(10, 3, 20)
KF.BackgroundTransparency = .03
KF.BorderSizePixel = 0
KF.Active = true
KF.Draggable = true
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 18)
local KFS = Instance.new("UIStroke", KF)
KFS.Color = Color3.fromRGB(170, 0, 255)
KFS.Thickness = 2.5
KFS.Transparency = .05
KFS.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local KGrad = Instance.new("UIGradient", KF)
KGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 10, 60)),
    ColorSequenceKeypoint.new(.5, Color3.fromRGB(14, 3, 28)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 1, 12))}
local KGlow = Instance.new("ImageLabel", KG)
KGlow.Size = UDim2.new(0, 340, 0, 250)
KGlow.Position = UDim2.new(.5, -170, .5, -125)
KGlow.BackgroundTransparency = 1
KGlow.Image = "rbxassetid://5028857084"
KGlow.ImageColor3 = Color3.fromRGB(150, 0, 255)
KGlow.ImageTransparency = .5
KGlow.ZIndex = 0
local KTitle = Instance.new("TextLabel", KF)
KTitle.Size = UDim2.new(1, 0, 0, 48)
KTitle.BackgroundTransparency = 1
KTitle.Text = "PIGOREV HACK"
KTitle.TextColor3 = Color3.fromRGB(240, 190, 255)
KTitle.Font = Enum.Font.GothamBold
KTitle.TextSize = 20
KTitle.TextStrokeTransparency = .1
KTitle.TextStrokeColor3 = Color3.fromRGB(140, 0, 255)
local KSub = Instance.new("TextLabel", KF)
KSub.Size = UDim2.new(1, 0, 0, 20)
KSub.Position = UDim2.new(0, 0, 0, 48)
KSub.BackgroundTransparency = 1
KSub.Text = "Введите ключ доступа"
KSub.TextColor3 = Color3.fromRGB(200, 170, 230)
KSub.Font = Enum.Font.GothamMedium
KSub.TextSize = 12
local KBox = Instance.new("TextBox", KF)
KBox.Size = UDim2.new(1, -48, 0, 40)
KBox.Position = UDim2.new(0, 24, 0, 76)
KBox.BackgroundColor3 = Color3.fromRGB(25, 8, 45)
KBox.Text = ""
KBox.PlaceholderText = "Ключ..."
KBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KBox.PlaceholderColor3 = Color3.fromRGB(140, 110, 170)
KBox.Font = Enum.Font.GothamMedium
KBox.TextSize = 14
KBox.ClearTextOnFocus = false
Instance.new("UICorner", KBox).CornerRadius = UDim.new(0, 10)
local KBoxS = Instance.new("UIStroke", KBox)
KBoxS.Color = Color3.fromRGB(120, 0, 180)
KBoxS.Thickness = 1.5
KBoxS.Transparency = .15
local KBtn = Instance.new("TextButton", KF)
KBtn.Size = UDim2.new(1, -48, 0, 38)
KBtn.Position = UDim2.new(0, 24, 0, 128)
KBtn.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
KBtn.Text = "Войти"
KBtn.TextColor3 = Color3.new(1, 1, 1)
KBtn.Font = Enum.Font.GothamBold
KBtn.TextSize = 14
KBtn.AutoButtonColor = false
Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 10)
local KBtnS = Instance.new("UIStroke", KBtn)
KBtnS.Color = Color3.fromRGB(200, 0, 255)
KBtnS.Thickness = 1.5
KBtnS.Transparency = .1
local KStatus = Instance.new("TextLabel", KF)
KStatus.Size = UDim2.new(1, 0, 0, 20)
KStatus.Position = UDim2.new(0, 0, 0, 168)
KStatus.BackgroundTransparency = 1
KStatus.Text = ""
KStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
KStatus.Font = Enum.Font.GothamMedium
KStatus.TextSize = 11
KBtn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(KBtn, TweenInfo.new(.15), {BackgroundColor3 = Color3.fromRGB(120, 0, 190)}):Play()
end)
KBtn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(KBtn, TweenInfo.new(.15), {BackgroundColor3 = Color3.fromRGB(90, 0, 140)}):Play()
end)

-- ===== ЗАПУСК =====
local function launch()
    KG:Destroy()

    local Window = Rayfield:CreateWindow({
        Name = "PIGOREV HACK",
        LoadingTitle = "Загрузка...",
        LoadingSubtitle = "Premium",
        ConfigurationSaving = {Enabled = false}
    })

    -- Combat
    local Combat = Window:CreateTab("Combat", 4483362458)
    Combat:CreateToggle({
        Name = "Silent Aim",
        CurrentValue = false,
        Flag = "Aim",
        Callback = function(v) S.aim = v and 1 or 0 end
    })
    Combat:CreateSlider({
        Name = "FOV",
        Range = {10, 360},
        Increment = 5,
        Suffix = "°",
        CurrentValue = 120,
        Flag = "FOV",
        Callback = function(v) fov = v end
    })

    -- Visual
    local Visual = Window:CreateTab("Visual", 4483362458)
    Visual:CreateToggle({Name = "Box ESP", CurrentValue = false, Flag = "Box", Callback = function(v) S.esp = v and 1 or 0 end})
    Visual:CreateToggle({Name = "Skeleton", CurrentValue = false, Flag = "Sk", Callback = function(v) S.sk = v and 1 or 0 end})
    Visual:CreateToggle({Name = "Glow", CurrentValue = false, Flag = "Gl", Callback = function(v) S.gl = v and 1 or 0 end})
    Visual:CreateToggle({Name = "Health Bar", CurrentValue = false, Flag = "Hp", Callback = function(v) S.hp = v and 1 or 0 end})
    Visual:CreateToggle({Name = "Name ESP", CurrentValue = false, Flag = "Nm", Callback = function(v) S.name = v and 1 or 0 end})
    Visual:CreateSlider({
        Name = "Aspect Ratio",
        Range = {0.5, 2.0},
        Increment = 0.1,
        Suffix = "x",
        CurrentValue = 1.0,
        Flag = "Aspect",
        Callback = function(v) aspect = v; C.FieldOfView = 70 / v end
    })

    -- Misc
    local Misc = Window:CreateTab("Misc", 4483362458)
    Misc:CreateToggle({Name = "Fullbright", CurrentValue = false, Flag = "Bright", Callback = function(v) S.bright = v and 1 or 0 end})

    -- ESP init
    local function A(p)
        if p == LP then return end
        local l = {}
        for i = 1, 5 do
            local v = Drawing.new("Line")
            v.Thickness = 2
            v.Color = N
            l[i] = v
        end
        SD[p] = l
        local b = Drawing.new("Square")
        b.Thickness = 1.5
        b.Color = N
        BD[p] = b
        local g = Drawing.new("Square")
        g.Filled = true
        g.Color = Color3.fromRGB(20, 0, 35)
        g.Transparency = .4
        local f = Drawing.new("Square")
        f.Filled = true
        f.Color = N
        f.Transparency = .85
        local o = Drawing.new("Square")
        o.Thickness = 1.5
        o.Color = Color3.fromRGB(230, 100, 255)
        o.Transparency = .7
        local txt = Drawing.new("Text")
        txt.Size = 11
        txt.Center = true
        txt.Outline = true
        txt.Color = Color3.fromRGB(255, 255, 255)
        txt.OutlineColor = Color3.fromRGB(0, 0, 0)
        txt.Visible = false
        HD[p] = {bg = g, f = f, o = o, txt = txt}
        local nm = Drawing.new("Text")
        nm.Size = 12
        nm.Center = true
        nm.Outline = true
        nm.Color = N
        nm.OutlineColor = Color3.fromRGB(0, 0, 0)
        nm.Visible = false
        ND[p] = nm
        p.CharacterAdded:Connect(function()
            task.wait(.5)
            if S.gl == 1 and p.Character then
                local h = Instance.new("Highlight")
                h.FillColor = N
                h.OutlineColor = Color3.fromRGB(255, 100, 255)
                h.FillTransparency = .55
                h.OutlineTransparency = .1
                h.Parent = p.Character
                HL[p] = h
            end
        end)
    end
    for _, p in ipairs(P:GetPlayers()) do A(p) end
    P.PlayerAdded:Connect(A)
    P.PlayerRemoving:Connect(function(p)
        for _, v in ipairs(SD[p] or {}) do v:Remove() end
        SD[p] = nil
        if BD[p] then BD[p]:Remove() end
        if HL[p] then HL[p]:Destroy() end
        if HD[p] then
            HD[p].bg:Remove()
            HD[p].f:Remove()
            HD[p].o:Remove()
            HD[p].txt:Remove()
        end
        HD[p] = nil
        if ND[p] then ND[p]:Remove() end
        ND[p] = nil
    end)

    -- Silent Aim
    local function getTarget()
        local best, bestDist = nil, fov
        local mouse = UIS:GetMouseLocation()
        for _, p in ipairs(P:GetPlayers()) do
            if p ~= LP and p.Character then
                local head = p.Character:FindFirstChild("Head")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if head and hum and hum.Health > 0 then
                    local pos, on = C:WorldToViewportPoint(head.Position)
                    if on then
                        local d = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                        if d < bestDist then
                            bestDist = d
                            best = head
                        end
                    end
                end
            end
        end
        return best
    end

    -- Render
    RS.RenderStepped:Connect(function()
        if S.aim == 1 then
            local target = getTarget()
            if target then
                local aimPos = target.Position
                local camPos = C.CFrame.Position
                C.CFrame = CFrame.new(camPos, aimPos)
            end
        end

        if S.bright == 1 then
            game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        end

        for p, l in pairs(SD) do
            local c = p.Character
            local u = c and c:FindFirstChildOfClass("Humanoid")
            if S.sk == 0 or not u or u.Health <= 0 then
                for _, v in ipairs(l) do v.Visible = false end
            else
                local h = c:FindFirstChild("Head")
                local t = c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso")
                local la = c:FindFirstChild("LeftUpperArm") or c:FindFirstChild("Left Arm")
                local ra = c:FindFirstChild("RightUpperArm") or c:FindFirstChild("Right Arm")
                local ll = c:FindFirstChild("LeftUpperLeg") or c:FindFirstChild("Left Leg")
                local rl = c:FindFirstChild("RightUpperLeg") or c:FindFirstChild("Right Leg")
                local function D(v, x, y)
                    if x and y then
                        local p1, o1 = C:WorldToViewportPoint(x.Position)
                        local p2, o2 = C:WorldToViewportPoint(y.Position)
                        if o1 and o2 then
                            v.From = Vector2.new(p1.X, p1.Y)
                            v.To = Vector2.new(p2.X, p2.Y)
                            v.Visible = true
                            return
                        end
                    end
                    v.Visible = false
                end
                D(l[1], h, t)
                D(l[2], t, la)
                D(l[3], t, ra)
                D(l[4], t, ll)
                D(l[5], t, rl)
            end
        end

        for p, b in pairs(BD) do
            local c = p.Character
            local h = c and c:FindFirstChild("HumanoidRootPart")
            local d = c and c:FindFirstChild("Head")
            if S.esp == 0 or not h or not d then
                b.Visible = false
            else
                local p1, o = C:WorldToViewportPoint(h.Position)
                local p2 = C:WorldToViewportPoint(d.Position + Vector3.new(0, .5, 0))
                if o then
                    local s = math.abs(p2.Y - p1.Y)
                    b.Size = Vector2.new(s / 2, s)
                    b.Position = Vector2.new(p1.X - s / 4, p2.Y)
                    b.Visible = true
                else
                    b.Visible = false
                end
            end
        end

        for p, d in pairs(HD) do
            local c = p.Character
            local u = c and c:FindFirstChildOfClass("Humanoid")
            local h = c and c:FindFirstChild("Head")
            if S.hp == 0 or not u or not h or u.Health <= 0 then
                d.bg.Visible = false
                d.f.Visible = false
                d.o.Visible = false
                d.txt.Visible = false
            else
                local v, o = C:WorldToViewportPoint(h.Position + Vector3.new(0, 1, 0))
                if not o then
                    d.bg.Visible = false
                    d.f.Visible = false
                    d.o.Visible = false
                    d.txt.Visible = false
                else
                    local w, h2 = 44, 5
                    local x, y = v.X - w / 2, v.Y
                    local r = math.clamp(u.Health / u.MaxHealth, 0, 1)
                    d.bg.Size = Vector2.new(w, h2)
                    d.bg.Position = Vector2.new(x, y)
                    d.bg.Visible = true
                    d.f.Size = Vector2.new(w * r, h2)
                    d.f.Position = Vector2.new(x, y)
                    d.f.Color = Color3.fromRGB(math.floor(190 + 65 * (1 - r)), math.floor(80 * r), 255)
                    d.f.Visible = true
                    d.o.Size = Vector2.new(w, h2)
                    d.o.Position = Vector2.new(x, y)
                    d.o.Visible = true
                    d.txt.Text = math.floor(u.Health) .. " / " .. math.floor(u.MaxHealth)
                    d.txt.Position = Vector2.new(x + w / 2, y - h2 - 4)
                    d.txt.Visible = true
                end
            end
        end

        for p, nm in pairs(ND) do
            local c = p.Character
            local h = c and c:FindFirstChild("Head")
            if S.name == 0 or not h then
                nm.Visible = false
            else
                local v, o = C:WorldToViewportPoint(h.Position + Vector3.new(0, 2.2, 0))
                if o then
                    nm.Text = p.Name
                    nm.Position = Vector2.new(v.X, v.Y)
                    nm.Visible = true
                else
                    nm.Visible = false
                end
            end
        end

        for _, p in ipairs(P:GetPlayers()) do
            if p ~= LP then
                if S.gl == 1 and not HL[p] and p.Character then
                    local h = Instance.new("Highlight")
                    h.FillColor = N
                    h.OutlineColor = Color3.fromRGB(255, 100, 255)
                    h.FillTransparency = .55
                    h.OutlineTransparency = .1
                    h.Parent = p.Character
                    HL[p] = h
                elseif S.gl == 0 and HL[p] then
                    HL[p]:Destroy()
                    HL[p] = nil
                end
            end
        end
    end)
end

-- ===== КЛЮЧ =====
local function unlock()
    if unlocked then return end
    if KBox.Text == KEY then
        unlocked = true
        KStatus.Text = "Ключ верный. Запуск..."
        KStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
        task.wait(.4)
        launch()
    else
        KStatus.Text = "Неверный ключ"
        KStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
        game:GetService("TweenService"):Create(KBox, TweenInfo.new(.08), {Position = UDim2.new(0, 28, 0, 76)}):Play()
        task.delay(.08, function()
            game:GetService("TweenService"):Create(KBox, TweenInfo.new(.08), {Position = UDim2.new(0, 24, 0, 76)}):Play()
        end)
    end
end

KBtn.MouseButton1Click:Connect(unlock)
KBox.FocusLost:Connect(function(enter)
    if enter then unlock() end
end)
