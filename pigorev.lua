-- PIGOREV HACK | Fluent UI Short
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local P = game:GetService("Players")
local RS = game:GetService("RunService")
local C = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local LP = P.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
local KEY = "RagePigorev"
local unlocked = false
local S = {aimPC=0, aimPhone=0, esp=0, sk=0, gl=0, hp=0, name=0, bright=0}
local SD, BD, HL, HD, ND = {}, {}, {}, {}, {}
local N = Color3.fromRGB(190, 0, 255)
local aspect = 1.0
local fov = 120
local smooth = 0.25
local phoneStrength = 0.15
local phoneActive = false

-- ОКНО КЛЮЧА
local KG = Instance.new("ScreenGui")
KG.Name = "PigorevKey"
KG.ResetOnSpawn = false
KG.Parent = PG
local KF = Instance.new("Frame", KG)
KF.Size = UDim2.new(0, 280, 0, 190)
KF.Position = UDim2.new(.5, -140, .5, -95)
KF.BackgroundColor3 = Color3.fromRGB(10, 3, 20)
KF.BorderSizePixel = 0
KF.Active = true
KF.Draggable = true
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 18)
local KTitle = Instance.new("TextLabel", KF)
KTitle.Size = UDim2.new(1, 0, 0, 48)
KTitle.BackgroundTransparency = 1
KTitle.Text = "PIGOREV HACK"
KTitle.TextColor3 = Color3.fromRGB(240, 190, 255)
KTitle.Font = Enum.Font.GothamBold
KTitle.TextSize = 20
local KSub = Instance.new("TextLabel", KF)
KSub.Size = UDim2.new(1, 0, 0, 20)
KSub.Position = UDim2.new(0, 0, 0, 48)
KSub.BackgroundTransparency = 1
KSub.Text = "Введите ключ"
KSub.TextColor3 = Color3.fromRGB(200, 170, 230)
KSub.Font = Enum.Font.GothamMedium
KSub.TextSize = 12
local KBox = Instance.new("TextBox", KF)
KBox.Size = UDim2.new(1, -48, 0, 40)
KBox.Position = UDim2.new(0, 24, 0, 76)
KBox.BackgroundColor3 = Color3.fromRGB(25, 8, 45)
KBox.PlaceholderText = "Ключ..."
KBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KBox.Font = Enum.Font.GothamMedium
KBox.TextSize = 14
Instance.new("UICorner", KBox).CornerRadius = UDim.new(0, 10)
local KBtn = Instance.new("TextButton", KF)
KBtn.Size = UDim2.new(1, -48, 0, 38)
KBtn.Position = UDim2.new(0, 24, 0, 128)
KBtn.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
KBtn.Text = "Войти"
KBtn.TextColor3 = Color3.new(1, 1, 1)
KBtn.Font = Enum.Font.GothamBold
KBtn.TextSize = 14
Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 10)
local KStatus = Instance.new("TextLabel", KF)
KStatus.Size = UDim2.new(1, 0, 0, 20)
KStatus.Position = UDim2.new(0, 0, 0, 168)
KStatus.BackgroundTransparency = 1
KStatus.Text = ""
KStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
KStatus.Font = Enum.Font.GothamMedium
KStatus.TextSize = 11

-- ЗАПУСК
local function launch()
    KG:Destroy()
    local Window = Fluent:CreateWindow({
        Title = "PIGOREV HACK",
        SubTitle = "premium",
        TabWidth = 160,
        Size = UDim2.fromOffset(520, 400),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.RightControl
    })

    -- AIM
    local AimTab = Window:AddTab({ Title = "Aim", Icon = "crosshair" })
    local PCGroup = AimTab:AddLeftGroupbox("PC Aim")
    PCGroup:AddToggle("PCAim", {Title = "Enable PC Aim", Default = false, Callback = function(v) S.aimPC = v and 1 or 0 end})
    PCGroup:AddSlider("PCSmooth", {Title = "Smoothness", Default = 0.25, Min = 0.05, Max = 1, Rounding = 2, Callback = function(v) smooth = v end})
    PCGroup:AddSlider("PCFOV", {Title = "FOV", Default = 120, Min = 10, Max = 360, Rounding = 0, Callback = function(v) fov = v end})
    
    local PhoneGroup = AimTab:AddRightGroupbox("Phone Aim")
    PhoneGroup:AddToggle("PhoneAim", {Title = "Enable Phone Aim", Default = false, Callback = function(v) S.aimPhone = v and 1 or 0; phoneActive = v end})
    PhoneGroup:AddSlider("PhoneStr", {Title = "Strength", Default = 0.15, Min = 0.05, Max = 0.5, Rounding = 2, Callback = function(v) phoneStrength = v end})

    -- VISUAL
    local Visual = Window:AddTab({ Title = "Visual", Icon = "eye" })
    local ESPGroup = Visual:AddLeftGroupbox("ESP")
    ESPGroup:AddToggle("Box", {Title = "Box ESP", Default = false, Callback = function(v) S.esp = v and 1 or 0 end})
    ESPGroup:AddToggle("Sk", {Title = "Skeleton", Default = false, Callback = function(v) S.sk = v and 1 or 0 end})
    ESPGroup:AddToggle("Gl", {Title = "Glow", Default = false, Callback = function(v) S.gl = v and 1 or 0 end})
    ESPGroup:AddToggle("Hp", {Title = "Health Bar", Default = false, Callback = function(v) S.hp = v and 1 or 0 end})
    ESPGroup:AddToggle("Nm", {Title = "Name ESP", Default = false, Callback = function(v) S.name = v and 1 or 0 end})
    
    local CamGroup = Visual:AddRightGroupbox("Camera")
    CamGroup:AddSlider("Aspect", {Title = "Aspect Ratio", Default = 1.0, Min = 0.5, Max = 2.0, Rounding = 1, Callback = function(v) C.FieldOfView = 70 / v end})

    -- MISC
    local Misc = Window:AddTab({ Title = "Misc", Icon = "settings" })
    Misc:AddToggle("Bright", {Title = "Fullbright", Default = false, Callback = function(v) S.bright = v and 1 or 0 end})

    -- ESP INIT (короткая версия)
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
            HD[p].bg:Remove(); HD[p].f:Remove(); HD[p].o:Remove(); HD[p].txt:Remove()
        end
        HD[p] = nil
        if ND[p] then ND[p]:Remove() end
        ND[p] = nil
    end)

    -- PHONE AIM BUTTON
    local FBtn = Instance.new("TextButton", PG)
    FBtn.Size = UDim2.new(0, 70, 0, 70)
    FBtn.Position = UDim2.new(0, 20, 0.8, 0)
    FBtn.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
    FBtn.Text = "AIM"
    FBtn.TextColor3 = Color3.new(1, 1, 1)
    FBtn.Font = Enum.Font.GothamBold
    FBtn.TextSize = 18
    FBtn.Draggable = true
    FBtn.Visible = UIS.TouchEnabled
    Instance.new("UICorner", FBtn).CornerRadius = UDim.new(1, 0)
    FBtn.MouseButton1Click:Connect(function()
        phoneActive = not phoneActive
        FBtn.BackgroundColor3 = phoneActive and Color3.fromRGB(200, 0, 255) or Color3.fromRGB(70, 0, 120)
    end)

    -- AIM LOGIC
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
    local function smoothAim(target, strength)
        if not target then return end
        local goal = CFrame.new(C.CFrame.Position, target.Position)
        C.CFrame = C.CFrame:Lerp(goal, strength)
    end

    RS.RenderStepped:Connect(function()
        if S.aimPC == 1 and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then smoothAim(getTarget(), smooth) end
        if S.aimPhone == 1 and phoneActive then smoothAim(getTarget(), phoneStrength) end
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
                local h, t = c:FindFirstChild("Head"), c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso")
                local la, ra = c:FindFirstChild("LeftUpperArm") or c:FindFirstChild("Left Arm"), c:FindFirstChild("RightUpperArm") or c:FindFirstChild("Right Arm")
                local ll, rl = c:FindFirstChild("LeftUpperLeg") or c:FindFirstChild("Left Leg"), c:FindFirstChild("RightUpperLeg") or c:FindFirstChild("Right Leg")
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
                D(l[1], h, t); D(l[2], t, la); D(l[3], t, ra); D(l[4], t, ll); D(l[5], t, rl)
            end
        end

        for p, b in pairs(BD) do
            local c = p.Character
            local h, d = c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChild("Head")
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
            local u, h = c and c:FindFirstChildOfClass("Humanoid"), c and c:FindFirstChild("Head")
            if S.hp == 0 or not u or not h or u.Health <= 0 then
                d.bg.Visible = false; d.f.Visible = false; d.o.Visible = false; d.txt.Visible = false
            else
                local v, o = C:WorldToViewportPoint(h.Position + Vector3.new(0, 1, 0))
                if not o then
                    d.bg.Visible = false; d.f.Visible = false; d.o.Visible = false; d.txt.Visible = false
                else
                    local w, h2 = 44, 5
                    local x, y = v.X - w / 2, v.Y
                    local r = math.clamp(u.Health / u.MaxHealth, 0, 1)
                    d.bg.Size = Vector2.new(w, h2)
                    d.bg.Position = Vector2.new(x, y)
                    d.bg.Visible = true
                    d.f.Size = Vector2.new(w * r, h2)
                    d.f.Position = Vector2.new(x, y)
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
    end)
end

-- КЛЮЧ
local function unlock()
    if unlocked then return end
    if KBox.Text == KEY then
        unlocked = true
        KStatus.Text = "Запуск..."
        KStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
        task.wait(.4)
        launch()
    else
        KStatus.Text = "Неверный ключ"
    end
end
KBtn.MouseButton1Click:Connect(unlock)
KBox.FocusLost:Connect(function(enter) if enter then unlock() end end)
