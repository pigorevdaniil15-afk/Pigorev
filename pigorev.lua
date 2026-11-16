-- PIGOREV HACK | Custom Neon UI
local P = game:GetService("Players")
local RS = game:GetService("RunService")
local C = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LP = P.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
local KEY = "RagePigorev"
local unlocked = false
local S = {aimPC=0, aimPhone=0, esp=0, sk=0, gl=0, hp=0, bright=0}
local SD, BD, HL, HD = {}, {}, {}, {}
local N = Color3.fromRGB(190, 0, 255)
local fov = 120
local smooth = 0.25
local phoneActive = false

-- ===== ОКНО КЛЮЧА =====
local KG = Instance.new("ScreenGui")
KG.Name = "PigorevKey"
KG.ResetOnSpawn = false
KG.Parent = PG
local KF = Instance.new("Frame", KG)
KF.Size = UDim2.new(0, 280, 0, 190)
KF.Position = UDim2.new(.5, -140, .5, -95)
KF.BackgroundColor3 = Color3.fromRGB(10, 3, 20)
KF.BorderSizePixel = 0
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 18)
local KStroke = Instance.new("UIStroke", KF)
KStroke.Color = Color3.fromRGB(170, 0, 255)
KStroke.Thickness = 2

local KTitle = Instance.new("TextLabel", KF)
KTitle.Size = UDim2.new(1, 0, 0, 48)
KTitle.BackgroundTransparency = 1
KTitle.Text = "PIGOREV HACK"
KTitle.TextColor3 = Color3.fromRGB(240, 190, 255)
KTitle.Font = Enum.Font.GothamBold
KTitle.TextSize = 20

local KBox = Instance.new("TextBox", KF)
KBox.Size = UDim2.new(1, -48, 0, 40)
KBox.Position = UDim2.new(0, 24, 0, 60)
KBox.BackgroundColor3 = Color3.fromRGB(25, 8, 45)
KBox.PlaceholderText = "Введите ключ..."
KBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KBox.Font = Enum.Font.GothamMedium
KBox.TextSize = 14
Instance.new("UICorner", KBox).CornerRadius = UDim.new(0, 10)

local KBtn = Instance.new("TextButton", KF)
KBtn.Size = UDim2.new(1, -48, 0, 38)
KBtn.Position = UDim2.new(0, 24, 0, 115)
KBtn.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
KBtn.Text = "Войти"
KBtn.TextColor3 = Color3.new(1, 1, 1)
KBtn.Font = Enum.Font.GothamBold
KBtn.TextSize = 14
Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 10)

local KStatus = Instance.new("TextLabel", KF)
KStatus.Size = UDim2.new(1, 0, 0, 20)
KStatus.Position = UDim2.new(0, 0, 0, 160)
KStatus.BackgroundTransparency = 1
KStatus.Text = ""
KStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
KStatus.Font = Enum.Font.GothamMedium
KStatus.TextSize = 11

-- ===== ЛОГИКА ЧИТА =====
local function launch()
    KG:Destroy()
    
    local G = Instance.new("ScreenGui")
    G.Name = "PigorevHack"
    G.ResetOnSpawn = false
    G.Parent = PG
    
    -- Кнопка "P" для открытия
    local OpenBtn = Instance.new("TextButton", G)
    OpenBtn.Size = UDim2.new(0, 55, 0, 55)
    OpenBtn.Position = UDim2.new(0, 20, 0.5, 0)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 130)
    OpenBtn.Text = "P"
    OpenBtn.TextColor3 = Color3.new(1, 1, 1)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.TextSize = 22
    OpenBtn.Draggable = true
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
    
    -- Главное меню
    local Main = Instance.new("Frame", G)
    Main.Size = UDim2.new(0, 260, 0, 380)
    Main.Position = UDim2.new(0.5, -130, 0.5, -190)
    Main.BackgroundColor3 = Color3.fromRGB(12, 3, 22)
    Main.BackgroundTransparency = 0.05
    Main.BorderSizePixel = 0
    Main.Visible = false
    Main.Active = true
    Main.Draggable = true
    Main.ClipsDescendants = true -- Чтобы частицы не вылетали за пределы меню
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
    
    -- Неоновая обводка
    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = Color3.fromRGB(170, 0, 255)
    MainStroke.Thickness = 2.5
    MainStroke.Transparency = 0.1

    -- Пульсация обводки
    task.spawn(function()
        while Main.Parent do
            TweenService:Create(MainStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(255, 80, 255), Transparency = 0.4}):Play()
            task.wait(1.2)
            TweenService:Create(MainStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(120, 0, 255), Transparency = 0.1}):Play()
            task.wait(1.2)
        end
    end)

    -- Падающие частицы
    task.spawn(function()
        while Main.Parent do
            local dot = Instance.new("Frame", Main)
            dot.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
            dot.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
            dot.BackgroundTransparency = 0.3
            dot.BorderSizePixel = 0
            dot.Position = UDim2.new(math.random(), 0, -0.05, 0)
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
            
            local endY = UDim2.new(math.random(), 0, 1.05, 0)
            TweenService:Create(dot, TweenInfo.new(math.random(3, 6), Enum.EasingStyle.Linear), {Position = endY}):Play()
            task.delay(math.random(3, 6), function() dot:Destroy() end)
            task.wait(0.15)
        end
    end)

    -- Заголовок
    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.BackgroundTransparency = 1
    Title.Text = "PIGOREV HACK"
    Title.TextColor3 = Color3.fromRGB(240, 190, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.fromRGB(140, 0, 255)
    
    -- Кнопка закрытия
    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -38, 0, 8)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)
    CloseBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
    end)

    -- Функция создания красивых кнопок
    local function CreateBtn(text, yPos, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(1, -40, 0, 38)
        b.Position = UDim2.new(0, 20, 0, yPos)
        b.BackgroundColor3 = Color3.fromRGB(30, 10, 50)
        b.Text = text .. ": OFF"
        b.TextColor3 = Color3.fromRGB(220, 200, 255)
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 13
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
        
        local bStroke = Instance.new("UIStroke", b)
        bStroke.Color = Color3.fromRGB(80, 20, 120)
        bStroke.Thickness = 1
        
        local isOn = false
        b.MouseButton1Click:Connect(function()
            isOn = not isOn
            b.Text = text .. (isOn and ": ON" or ": OFF")
            
            -- Анимация нажатия
            TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = isOn and Color3.fromRGB(80, 0, 120) or Color3.fromRGB(30, 10, 50)}):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = isOn and Color3.fromRGB(200, 0, 255) or Color3.fromRGB(80, 20, 120), Thickness = isOn and 1.5 or 1}):Play()
            
            callback(isOn)
        end)
        return b
    end

    CreateBtn("PC Aim (RMB)", 55, function(v) S.aimPC = v and 1 or 0 end)
    CreateBtn("Phone Aim", 100, function(v) S.aimPhone = v and 1 or 0; phoneActive = v end)
    CreateBtn("Box ESP", 145, function(v) S.esp = v and 1 or 0 end)
    CreateBtn("Skeleton", 190, function(v) S.sk = v and 1 or 0 end)
    CreateBtn("Glow", 235, function(v) S.gl = v and 1 or 0 end)
    CreateBtn("Health Bar", 280, function(v) S.hp = v and 1 or 0 end)
    CreateBtn("Fullbright", 325, function(v) S.bright = v and 1 or 0 end)

    OpenBtn.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    -- ===== ESP INIT =====
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
    end)

    -- ===== AIM LOGIC =====
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
        if S.aimPhone == 1 and phoneActive then smoothAim(getTarget(), 0.15) end
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
    end)
end

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
