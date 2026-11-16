-- PIGOREV HACK | Premium Custom UI + Fly/Speed/Tracers
local P = game:GetService("Players")
local RS = game:GetService("RunService")
local C = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LP = P.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")
local KEY = "RagePigorev"
local unlocked = false
local S = {aimPC=0, aimPhone=0, esp=0, sk=0, gl=0, hp=0, bright=0, fly=0, speed=0, tracers=0, fovcircle=0}
local SD, BD, HL, HD, TD, FovCircle = {}, {}, {}, {}, {}, nil
local N = Color3.fromRGB(200, 0, 255)
local fov = 120
local smooth = 0.25
local phoneActive = false
local flySpeed = 50
local walkSpeed = 16
local baseSpeed = 16

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
    Main.Size = UDim2.new(0, 480, 0, 340)
    Main.Position = UDim2.new(0.5, -240, 0.5, -170)
    Main.BackgroundColor3 = Color3.fromRGB(10, 3, 18)
    Main.BackgroundTransparency = 0.1
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

    -- Пульсация обводки
    task.spawn(function()
        while Main.Parent do
            TweenService:Create(MainStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(255, 80, 255), Transparency = 0.4}):Play()
            task.wait(1.5)
            TweenService:Create(MainStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(120, 0, 255), Transparency = 0.1}):Play()
            task.wait(1.5)
        end
    end)

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
        btn.Size = UDim2.new(0, 110, 1, 0)
        btn.Position = UDim2.new(0, (index-1)*115, 0, 0)
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
    local PlayerTab, PlayerPage = CreateTab("Player", 3)
    local MiscTab, MiscPage = CreateTab("Misc", 4)

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
    SelectTab("Aim")

    AimTab.MouseButton1Click:Connect(function() SelectTab("Aim") end)
    VisualTab.MouseButton1Click:Connect(function() SelectTab("Visual") end)
    PlayerTab.MouseButton1Click:Connect(function() SelectTab("Player") end)
    MiscTab.MouseButton1Click:Connect(function() SelectTab("Misc") end)

    -- ===== ФУНКЦИИ UI =====
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

    local function CreateSlider(parent, text, min, max, default, yPos, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, -10, 0, 45)
        frame.Position = UDim2.new(0, 5, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(30, 10, 50)
        frame.BorderSizePixel = 0
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
        
        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, -10, 0, 20)
        label.Position = UDim2.new(0, 5, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text .. ": " .. default
        label.TextColor3 = Color3.fromRGB(220, 200, 255)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 12

        local bar = Instance.new("Frame", frame)
        bar.Size = UDim2.new(1, -20, 0, 6)
        bar.Position = UDim2.new(0, 10, 0, 30)
        bar.BackgroundColor3 = Color3.fromRGB(60, 20, 90)
        bar.BorderSizePixel = 0
        Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new("Frame", bar)
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(200, 0, 255)
        fill.BorderSizePixel = 0
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local dragging = false
        local function update(input)
            local rel = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            local val = math.floor((min + rel * (max - min)) * 10) / 10
            fill.Size = UDim2.new(rel, 0, 1, 0)
            label.Text = text .. ": " .. val
            callback(val)
        end

        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                update(input)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                update(input)
            end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end

    -- ===== ЗАПОЛНЕНИЕ ВКЛАДОК =====
    -- Aim
    CreateToggle(AimPage, "PC Aim (RMB)", 5, function(v) S.aimPC = v and 1 or 0 end)
    CreateToggle(AimPage, "Phone Aim", 50, function(v) S.aimPhone = v and 1 or 0; phoneActive = v end)
    CreateSlider(AimPage, "Aim FOV", 10, 360, 120, 95, function(v) fov = v end)

    -- Visual
    CreateToggle(VisualPage, "Box ESP", 5, function(v) S.esp = v and 1 or 0 end)
    CreateToggle(VisualPage, "Skeleton", 50, function(v) S.sk = v and 1 or 0 end)
    CreateToggle(VisualPage, "Glow", 95, function(v) S.gl = v and 1 or 0 end)
    CreateToggle(VisualPage, "Health Bar", 140, function(v) S.hp = v and 1 or 0 end)
    CreateToggle(VisualPage, "Tracers", 185, function(v) S.tracers = v and 1 or 0 end)
    CreateToggle(VisualPage, "FOV Circle", 230, function(v) S.fovcircle = v and 1 or 0 end)

    -- Player
    CreateToggle(PlayerPage, "Fly (WASD/Space)", 5, function(v) S.fly = v and 1 or 0 end)
    CreateSlider(PlayerPage, "Fly Speed", 10, 300, 50, 50, function(v) flySpeed = v end)
    CreateToggle(PlayerPage, "Speed Hack", 95, function(v) 
        S.speed = v and 1 or 0 
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = S.speed == 1 and walkSpeed or baseSpeed end
    end)
    CreateSlider(PlayerPage, "Walk Speed", 16, 200, 50, 140, function(v) 
        walkSpeed = v 
        if S.speed == 1 then
            local char = LP.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = v end
        end
    end)

    -- Misc
    CreateToggle(MiscPage, "Fullbright", 5, function(v) S.bright = v and 1 or 0 end)

    OpenBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

    -- ===== ФУНКЦИИ ESP И ТРЕЙСЕРОВ =====
    local function A(p)
        if p == LP then return end
        local l = {}
        for i = 1, 5 do
            local v = Drawing.new("Line")
            v.Thickness = 3
            v.Color = N
            l[i] = v
        end
        SD[p] = l
        
        local b_outline = Drawing.new("Square")
        b_outline.Thickness = 3
        b_outline.Color = Color3.fromRGB(0, 0, 0)
        b_outline.Filled = false
        
        local b = Drawing.new("Square")
        b.Thickness = 2
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
        txt.Size = 12
        txt.Center = true
        txt.Outline = true
        txt.Color = Color3.fromRGB(255, 255, 255)
        txt.OutlineColor = Color3.fromRGB(0, 0, 0)
        txt.Visible = false
        HD[p] = {bg = g, f = f, o = o, txt = txt}
        
        local t = Drawing.new("Line")
        t.Thickness = 2
        t.Color = N
        t.Visible = false
        TD[p] = t

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
        if TD[p] then TD[p]:Remove() end
        TD[p] = nil
    end)

    -- FOV Circle
    FovCircle = Drawing.new("Circle")
    FovCircle.Thickness = 1.5
    FovCircle.Color = N
    FovCircle.Filled = false
    FovCircle.Visible = false

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

    -- ===== FLY LOGIC =====
    local flyBV, flyBG
    local function toggleFly(on)
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if on then
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.Velocity = Vector3.new(0, 0, 0)
            flyBV.Parent = hrp
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBG.P = 9e4
            flyBG.Parent = hrp
        else
            if flyBV then flyBV:Destroy() end
            if flyBG then flyBG:Destroy() end
        end
    end

    RS.RenderStepped:Connect(function()
        -- Aim
        if S.aimPC == 1 and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then smoothAim(getTarget(), smooth) end
        if S.aimPhone == 1 and phoneActive then smoothAim(getTarget(), 0.15) end
        
        -- FOV Circle
        if S.fovcircle == 1 then
            FovCircle.Visible = true
            FovCircle.Position = UIS:GetMouseLocation()
            FovCircle.Radius = fov
        else
            FovCircle.Visible = false
        end

        -- Fullbright
        if S.bright == 1 then
            game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        end

        -- Fly Logic
        if S.fly == 1 then
            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                if not flyBV then toggleFly(true) end
                local dir = Vector3.new()
                if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + C.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - C.CFrame.L
