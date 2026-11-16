-- PIGOREV HACK | Horizontal UI + Thick ESP
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
local N = Color3.fromRGB(200, 0, 255)
local fov = 120
local smooth = 0.25
local phoneActive = false

-- ===== ОКНО КЛЮЧА (оставляем как было) =====
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
    
    -- Главное горизонтальное меню
    local Main = Instance.new("Frame", G)
    Main.Size = UDim2.new(0, 450, 0, 300) -- Горизонтальный размер
    Main.Position = UDim2.new(0.5, -225, 0.5, -150)
    Main.BackgroundColor3 = Color3.fromRGB(12, 3, 22)
    Main.BackgroundTransparency = 0.05
    Main.BorderSizePixel = 0
    Main.Visible = false
    Main.Active = true
    Main.Draggable = true
    Main.ClipsDescendants = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
    
    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = Color3.fromRGB(170, 0, 255)
    MainStroke.Thickness = 2.5
    MainStroke.Transparency = 0.1

    -- Заголовок
    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 40)
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
    CloseBtn.Position = UDim2.new(1, -38, 0, 5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)
    CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

    -- ===== ВЕРХНИЕ ВКЛАДКИ =====
    local TabContainer = Instance.new("Frame", Main)
    TabContainer.Size = UDim2.new(1, -20, 0, 35)
    TabContainer.Position = UDim2.new(0, 10, 0, 45)
    TabContainer.BackgroundTransparency = 1
    
    local Tabs = {}
    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, -20, 1, -90)
    Content.Position = UDim2.new(0, 10, 0, 85)
    Content.BackgroundColor3 = Color3.fromRGB(18, 6, 30)
    Content.BorderSizePixel = 0
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 10)

    local function CreateTab(name, index)
        local btn = Instance.new("TextButton", TabContainer)
        btn.Size = UDim2.new(0, 100, 1, 0)
        btn.Position = UDim2.new(0, (index-1)*105, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(25, 8, 45)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(180, 150, 220)
        btn.Font = Enum.Font.GothamMedium
        btn.TextSize = 14
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        
        local page = Instance.new("ScrollingFrame", Content)
        page.Size = UDim2.new(1, -10, 1, -10)
        page.Position = UDim2.new(0, 5, 0, 5)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.ScrollBarThickness = 4
        page.ScrollBarImageColor3 = Color3.fromRGB(170, 0, 255)
        page.Visible = false
        
        Tabs[name] = {btn = btn, page = page}
        return btn, page
    end

    local AimTab, AimPage = CreateTab("Aim", 1)
    local VisualTab, VisualPage = CreateTab("Visual", 2)
    local MiscTab, MiscPage = CreateTab("Misc", 3)

    -- Функция переключения вкладок
    local function SelectTab(selectedName)
        for name, data in pairs(Tabs) do
            if name == selectedName then
                data.btn.BackgroundColor3 = Color3.fromRGB(60, 15, 90)
                data.btn.TextColor3 = Color3.fromRGB(255, 200, 255)
                data.page.Visible = true
            else
                data.btn.BackgroundColor3 = Color3.fromRGB(25, 8, 45)
                data.btn.TextColor3 = Color3.fromRGB(180, 150, 220)
                data.page.Visible = false
            end
        end
    end
    SelectTab("Aim") -- По умолчанию открываем Aim

    AimTab.MouseButton1Click:Connect(function() SelectTab("Aim") end)
    VisualTab.MouseButton1Click:Connect(function() SelectTab("Visual") end)
    MiscTab.MouseButton1Click:Connect(function() SelectTab("Misc") end)

    -- ===== ФУНКЦИЯ СОЗДАНИЯ КНОПОК ВНУТРИ ВКЛАДОК =====
    local function CreateToggle(parent, text, yPos, callback)
        local b = Instance.new("TextButton", parent)
        b.Size = UDim2.new(1, -10, 0, 36)
        b.Position = UDim2.new(0, 5, 0, yPos)
        b.BackgroundColor3 = Color3.fromRGB(30, 10, 50)
        b.Text = text .. ": OFF"
        b.TextColor3 = Color3.fromRGB(220, 200, 255)
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 13
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        
        local bStroke = Instance.new("UIStroke", b)
        bStroke.Color = Color3.fromRGB(80, 20, 120)
        
        local isOn = false
        b.MouseButton1Click:Connect(function()
            isOn = not isOn
            b.Text = text .. (isOn and ": ON" or ": OFF")
            TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = isOn and Color3.fromRGB(80, 0, 120) or Color3.fromRGB(30, 10, 50)}):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = isOn and Color3.fromRGB(200, 0, 255) or Color3.fromRGB(80, 20, 120)}):Play()
            callback(isOn)
        end)
        return b
    end

    -- Заполняем вкладку Aim
    CreateToggle(AimPage, "PC Aim (RMB)", 5, function(v) S.aimPC = v and 1 or 0 end)
    CreateToggle(AimPage, "Phone Aim", 50, function(v) S.aimPhone = v and 1 or 0; phoneActive = v end)
    local fovText = Instance.new("TextLabel", AimPage)
    fovText.Size = UDim2.new(1, -10, 0, 20)
    fovText.Position = UDim2.new(0, 5, 0, 95)
    fovText.BackgroundTransparency = 1
    fovText.Text = "FOV: 120"
    fovText.TextColor3 = Color3.fromRGB(200, 170, 230)
    fovText.TextXAlignment = Enum.TextXAlignment.Left
    fovText.Font = Enum.Font.Gotham
    -- (Здесь можно добавить слайдер, но для простоты пока оставим кнопки)

    -- Заполняем вкладку Visual
    CreateToggle(VisualPage, "Box ESP", 5, function(v) S.esp = v and 1 or 0 end)
    CreateToggle(VisualPage, "Skeleton", 50, function(v) S.sk = v and 1 or 0 end)
    CreateToggle(VisualPage, "Glow", 95, function(v) S.gl = v and 1 or 0 end)
    CreateToggle(VisualPage, "Health Bar", 140, function(v) S.hp = v and 1 or 0 end)

    -- Заполняем вкладку Misc
    CreateToggle(MiscPage, "Fullbright", 5, function(v) S.bright = v and 1 or 0 end)

    OpenBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

    -- ===== УЛУЧШЕННЫЙ, ЯРКИЙ ESP =====
    local function A(p)
        if p == LP then return end
        local l = {}
        for i = 1, 5 do
            local v = Drawing.new("Line")
            v.Thickness = 3 -- Сделали толще
            v.Color = N
            l[i] = v
        end
        SD[p] = l
        
        -- Черная обводка для рамки (сзади)
        local b_outline = Drawing.new("Square")
        b_outline.Thickness = 3
        b_outline.Color = Color3.fromRGB(0, 0, 0)
        b_outline.Filled = false
        
        local b = Drawing.new("Square")
        b.Thickness = 2 -- Сделали толще
        b.Color = N
        BD[p] = {box = b, outline = b_outline}
        
        local g = Drawing.new("Square")
        g.Filled = true
        g.Color = Color3.fromRGB(20, 0, 35)
        g.Transparency = .4
        local f = Drawing.new("Square")
        f.Filled = true
        f.Color = N
        f.Transparency = .85
        local o = Drawing.new("Square")
        o.Thickness = 2
        o.Color = Color3.fromRGB(230, 100, 255)
        o.Transparency = .7
        local txt = Drawing.new("Text")
        txt.Size = 12 -- Чуть крупнее текст
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
        if BD[p] then BD[p].box:Remove(); BD[p].outline:Remove() end
        if HL[p] then HL[p]:Destroy() end
        if HD[p] then
            HD[p].bg:Remove(); HD[p].f:Remove(); HD[p].o:Remove(); HD[p].txt:Remove()
        end
        HD[p] = nil
    end)

    -- ===== ЛОГИКА AIM =====
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
                        if d < bestDist then bestDist = d; best = head end
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

        -- Отрисовка скелетона
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
                            v.From = Vector2.new(p1.X, p1.Y); v.To = Vector2.new(p2.X, p2.Y); v.Visible = true; return
                        end
                    end
                    v.Visible = false
                end
                D(l[1], h, t); D(l[2], t, la); D(l[3], t, ra); D(l[4], t, ll); D(l[5], t, rl)
            end
        end

        -- Отрисовка Box ESP (с черным контуром)
        for p, bTable in pairs(BD) do
            local c = p.Character
            local h, d = c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChild("Head")
            if S.esp == 0 or not h or not d then
                bTable.box.Visible = false; bTable.outline.Visible = false
            else
                local p1, o = C:WorldToViewportPoint(h.Position)
                local p2 = C:WorldToViewportPoint(d.Position + Vector3.new(0, .5, 0))
                if o then
                    local s = math.abs(p2.Y - p1.Y)
                    local pos = Vector2.new(p1.X - s / 4, p2.Y)
                    local size = Vector2.new(s / 2, s)
                    
                    bTable.outline.Size = size
                    bTable.outline.Position = pos
                    bTable.outline.Visible = true
                    
                    bTable.box.Size = size
                    bTable.box.Position = pos
                    bTable.box.Visible = true
                else
                    bTable.box.Visible = false; bTable.outline.Visible = false
                end
            end
        end

        -- Отрисовка HP бара
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
                    local w, h2 = 50, 6 -- Чуть шире и толще
                    local x, y = v.X - w / 2, v.Y
                    local r = math.clamp(u.Health / u.MaxHealth, 0, 1)
                    d.bg.Size = Vector2.new(w, h2); d.bg.Position = Vector2.new(x, y); d.bg.Visible = true
                    d.f.Size = Vector2.new(w * r, h2); d.f.Position = Vector2.new(x, y); d.f.Visible = true
                    d.o.Size = Vector2.new(w, h2); d.o.Position = Vector2.new(x, y); d.o.Visible = true
                    d.txt.Text = math.floor(u.Health) .. " / " .. math.floor(u.MaxHealth)
                    d.txt.Position = Vector2.new(x + w / 2, y - h2 - 4); d.txt.Visible = true
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
