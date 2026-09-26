--[[ ThaiPhan Hub v14 — Full Build + Scroll Picker + Tool Hitbox 3D (fixed) ]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera

pcall(function()
    local p = (gethui and gethui()) or CoreGui
    local o = p:FindFirstChild("ThaiPhanHub")
    if o then o:Destroy() end
end)

-- cleanup folder cũ nếu còn sót
pcall(function()
    local old = workspace:FindFirstChild("ThaiPhan_ToolHitbox")
    if old then old:Destroy() end
end)

local S = {
    Speed=false, SpeedVal=16,
    Jump=false, JumpVal=50,
    InfJump=false, Noclip=false,
    Fly=false, FlySpd=50,
    ESPp=false, ESPn=false,

    ESPTool=false,          -- MẶC ĐỊNH TẮT
    ToolBoxOwn=false,       -- MẶC ĐỊNH TẮT
    ToolBoxOthers=false,    -- MẶC ĐỊNH TẮT

    ClickTP=false,
    Assassin=false, AssassinDist=3,
    AutoNeck=false, HitRange=15, HitDelay=0.1,
}

local ESPp_t, ESPn_t = {}, {}
local ESPTool_t = {}      -- [tool] = {targets = {...}}
local FlyConn, FlyBV, FlyBG
local TPTarget, AsTarget
local lastHit = 0

local function newDraw(c)
    local ok, o = pcall(function() return Drawing.new(c) end)
    if ok then return o end
end

local function getNPCs()
    local t = {}
    for _, v in ipairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(v) then
            table.insert(t, v)
        end
    end
    return t
end

local function mkESP(ad, nm, isP)
    local nt = newDraw("Text")
    if not nt then return nil end
    nt.Size=14 nt.Center=true nt.Outline=true
    nt.Color = isP and Color3.fromRGB(255,255,255) or Color3.fromRGB(180,180,180)
    nt.Text=nm nt.Visible=false
    local dt = newDraw("Text")
    dt.Size=12 dt.Center=true dt.Outline=true
    dt.Color=Color3.fromRGB(220,220,220) dt.Visible=false
    local hb = newDraw("Square")
    hb.Thickness=1 hb.Filled=true hb.Color=Color3.fromRGB(20,20,20) hb.Visible=false
    local hf = newDraw("Square")
    hf.Thickness=1 hf.Filled=true hf.Color=Color3.fromRGB(255,255,255) hf.Visible=false
    return {nt=nt, dt=dt, hb=hb, hf=hf}
end

local function killESP(e)
    if not e then return end
    for _, o in pairs(e) do
        if type(o)=="userdata" or type(o)=="table" then
            pcall(function() o.Visible=false end)
            pcall(function() o:Remove() end)
            pcall(function() o:Destroy() end)
        end
    end
end

-- ================= TOOL HITBOX 3D =================
local ToolFolder
local function ensureFolder()
    if ToolFolder and ToolFolder.Parent then return ToolFolder end
    local old = workspace:FindFirstChild("ThaiPhan_ToolHitbox")
    if old then old:Destroy() end
    ToolFolder = Instance.new("Folder")
    ToolFolder.Name = "ThaiPhan_ToolHitbox"
    ToolFolder.Parent = workspace
    return ToolFolder
end

local function makeBoxPart(size, cf)
    local p = Instance.new("Part")
    p.Anchored = true
    p.CanCollide = false
    p.CanQuery = false
    p.CanTouch = false
    p.Massless = true
    p.Size = size
    p.CFrame = cf
    p.Material = Enum.Material.Neon
    p.Color = Color3.fromRGB(0, 255, 120)
    p.Transparency = 0.7
    p.CastShadow = false
    p.TopSurface = Enum.SurfaceType.Smooth
    p.BottomSurface = Enum.SurfaceType.Smooth
    return p
end

-- tính offsets của 12 cạnh theo size
local function getEdgeOffsets(sz)
    local t = 0.08
    return {
        {Vector3.new(sz.X, t, t), Vector3.new(0,  sz.Y/2,  sz.Z/2)},
        {Vector3.new(sz.X, t, t), Vector3.new(0,  sz.Y/2, -sz.Z/2)},
        {Vector3.new(sz.X, t, t), Vector3.new(0, -sz.Y/2,  sz.Z/2)},
        {Vector3.new(sz.X, t, t), Vector3.new(0, -sz.Y/2, -sz.Z/2)},
        {Vector3.new(t, sz.Y, t), Vector3.new( sz.X/2, 0,  sz.Z/2)},
        {Vector3.new(t, sz.Y, t), Vector3.new(-sz.X/2, 0,  sz.Z/2)},
        {Vector3.new(t, sz.Y, t), Vector3.new( sz.X/2, 0, -sz.Z/2)},
        {Vector3.new(t, sz.Y, t), Vector3.new(-sz.X/2, 0, -sz.Z/2)},
        {Vector3.new(t, t, sz.Z), Vector3.new( sz.X/2,  sz.Y/2, 0)},
        {Vector3.new(t, t, sz.Z), Vector3.new(-sz.X/2,  sz.Y/2, 0)},
        {Vector3.new(t, t, sz.Z), Vector3.new( sz.X/2, -sz.Y/2, 0)},
        {Vector3.new(t, t, sz.Z), Vector3.new(-sz.X/2, -sz.Y/2, 0)},
    }
end

local function makeWireBox(srcPart, folder)
    local sz = srcPart.Size
    local cf = srcPart.CFrame
    local offsets = getEdgeOffsets(sz)
    local wires = {}
    for _, o in ipairs(offsets) do
        local p = makeBoxPart(o[1], cf * CFrame.new(o[2]))
        p.Parent = folder
        table.insert(wires, p)
    end
    return wires
end

local function killToolESP(e)
    if not e then return end
    if e.targets then
        for _, tgt in ipairs(e.targets) do
            for _, p in ipairs(tgt.wires) do
                pcall(function() p:Destroy() end)
            end
        end
    end
end

local function buildToolESP(tool, folder)
    local entry = {targets = {}}

    local function addTarget(part)
        local wires = makeWireBox(part, folder)
        table.insert(entry.targets, {src = part, wires = wires, size = part.Size})
    end

    local handle = tool:FindFirstChild("Handle")
    if handle and handle:IsA("BasePart") then
        addTarget(handle)
    end
    for _, d in ipairs(tool:GetDescendants()) do
        if d:IsA("BasePart") and d ~= handle then
            addTarget(d)
        end
    end

    return entry
end

-- chỉ lấy tool đang EQUIP (trong Character)
local function getEquippedTools()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        local c = plr.Character
        if c then
            for _, t in ipairs(c:GetChildren()) do
                if t:IsA("Tool") then
                    table.insert(list, {tool=t, owner=plr})
                end
            end
        end
    end
    for _, npc in ipairs(getNPCs()) do
        for _, t in ipairs(npc:GetChildren()) do
            if t:IsA("Tool") then
                table.insert(list, {tool=t, owner=nil})
            end
        end
    end
    return list
end

local function updateToolESP()
    -- tắt hoàn toàn khi toggle OFF
    if not S.ESPTool then
        for tool, e in pairs(ESPTool_t) do
            killToolESP(e)
            ESPTool_t[tool] = nil
        end
        if ToolFolder then
            pcall(function() ToolFolder:Destroy() end)
            ToolFolder = nil
        end
        return
    end

    local folder = ensureFolder()
    local equipped = getEquippedTools()
    local alive = {}

    for _, info in ipairs(equipped) do
        local tool = info.tool
        local owner = info.owner

        -- lọc theo cài đặt
        if owner == LP then
            if not S.ToolBoxOwn then continue end
        else
            if not S.ToolBoxOthers then continue end
        end

        -- check tool có Handle/parts không
        local hasParts = false
        for _, d in ipairs(tool:GetDescendants()) do
            if d:IsA("BasePart") then hasParts = true break end
        end
        if not hasParts then continue end

        alive[tool] = true

        if not ESPTool_t[tool] then
            ESPTool_t[tool] = buildToolESP(tool, folder)
        end
        local e = ESPTool_t[tool]
        if not e then continue end

        for _, tgt in ipairs(e.targets) do
            local src = tgt.src
            -- part nguồn còn sống không?
            if src and src.Parent then
                -- rebuild nếu size đổi
                if tgt.size ~= src.Size then
                    for _, p in ipairs(tgt.wires) do pcall(function() p:Destroy() end) end
                    tgt.wires = makeWireBox(src, folder)
                    tgt.size = src.Size
                end
                -- cập nhật vị trí từng cạnh
                local sz = src.Size
                local cf = src.CFrame
                local offsets = getEdgeOffsets(sz)
                for i, p in ipairs(tgt.wires) do
                    if offsets[i] then
                        p.Size = offsets[i][1]
                        p.CFrame = cf * CFrame.new(offsets[i][2])
                    end
                end
            else
                -- part mất → xóa wire luôn
                for _, p in ipairs(tgt.wires) do pcall(function() p:Destroy() end) end
                tgt.wires = {}
            end
        end
    end

    -- dọn tool không còn equip / bị cất
    for tool, e in pairs(ESPTool_t) do
        if not alive[tool] or not tool.Parent then
            killToolESP(e)
            ESPTool_t[tool] = nil
        end
    end
end

-- ================= KHÁC =================
local function tpTo(cf)
    local c = LP.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    if h then h.CFrame = cf end
end

local function tpPlayer(t)
    if not t or not t.Character then return end
    local h = t.Character:FindFirstChild("HumanoidRootPart")
    if h then tpTo(h.CFrame * CFrame.new(0,0,3)) end
end

local function tpMouse()
    local m = LP:GetMouse()
    if m and m.Hit then tpTo(m.Hit + Vector3.new(0,3,0)) end
end

local function assassinTick()
    if not S.Assassin or not AsTarget or not AsTarget.Character then return end
    local th = AsTarget.Character:FindFirstChild("HumanoidRootPart")
    if not th then return end
    local c = LP.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    if not h then return end
    local behind = th.CFrame * CFrame.new(0, 0, S.AssassinDist)
    h.CFrame = CFrame.new(behind.Position, behind.Position + th.CFrame.LookVector)
end

local function getNeck(char)
    if not char then return nil end
    return char:FindFirstChild("Head") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
end

local function autoNeckTick()
    if not S.AutoNeck or not AsTarget or not AsTarget.Character then return end
    local myChar = LP.Character
    if not myChar then return end
    local myHum = myChar:FindFirstChildOfClass("Humanoid")
    local myHrp = myChar:FindFirstChild("HumanoidRootPart")
    if not myHum or not myHrp then return end
    local neck = getNeck(AsTarget.Character)
    if not neck then return end

    if tick() - lastHit < S.HitDelay then return end
    lastHit = tick()

    local neckPos = neck.Position
    local dir = myHrp.Position - neckPos
    if dir.Magnitude < 0.1 then dir = Vector3.new(0, 0, 1) end
    dir = dir.Unit
    local hitPos = neckPos + dir * 1.5
    myHrp.CFrame = CFrame.new(hitPos, neckPos)

    local m = LP:GetMouse()
    if m then
        pcall(function() m.Target = neck end)
        pcall(function() m.Hit = CFrame.new(neckPos) end)
    end

    local tool = myChar:FindFirstChildOfClass("Tool") or LP.Backpack:FindFirstChildOfClass("Tool")
    if tool then
        if tool.Parent ~= myChar then
            pcall(function() myHum:EquipTool(tool) end)
            task.wait(0.03)
        end
        pcall(function() tool:Activate() end)
    end
end

local function updateESP()
    if S.ESPp then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr == LP then continue end
            local c = plr.Character
            if not c then continue end
            local h = c:FindFirstChild("HumanoidRootPart")
            local hum = c:FindFirstChildOfClass("Humanoid")
            if not h or not hum then continue end
            if not ESPp_t[plr] then ESPp_t[plr] = mkESP(h, plr.Name, true) end
            local e = ESPp_t[plr]
            if not e then continue end
            local pos, on = Cam:WorldToViewportPoint(h.Position)
            if on then
                e.nt.Position = Vector2.new(pos.X, pos.Y - 40)
                e.dt.Text = string.format("[%d studs]", (Cam.CFrame.Position - h.Position).Magnitude)
                e.dt.Position = Vector2.new(pos.X, pos.Y - 25)
                e.nt.Visible=true e.dt.Visible=true
                local hp = hum.Health / math.max(hum.MaxHealth,1)
                local bx, by = pos.X - 25, pos.Y - 15
                e.hb.Size = Vector2.new(50,4) e.hb.Position = Vector2.new(bx,by) e.hb.Visible=true
                e.hf.Size = Vector2.new(50*hp,4) e.hf.Position = Vector2.new(bx,by) e.hf.Visible=true
            else
                e.nt.Visible=false e.dt.Visible=false e.hb.Visible=false e.hf.Visible=false
            end
        end
        for plr, e in pairs(ESPp_t) do
            if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
                killESP(e) ESPp_t[plr] = nil
            end
        end
    else
        for plr, e in pairs(ESPp_t) do killESP(e) ESPp_t[plr] = nil end
    end

    if S.ESPn then
        for _, npc in ipairs(getNPCs()) do
            local h = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso") or npc:FindFirstChild("UpperTorso")
            local hum = npc:FindFirstChildOfClass("Humanoid")
            if not h or not hum then continue end
            if not ESPn_t[npc] then ESPn_t[npc] = mkESP(h, npc.Name, false) end
            local e = ESPn_t[npc]
            if not e then continue end
            local pos, on = Cam:WorldToViewportPoint(h.Position)
            if on then
                e.nt.Position = Vector2.new(pos.X, pos.Y - 40)
                e.dt.Text = string.format("[%d studs]", (Cam.CFrame.Position - h.Position).Magnitude)
                e.dt.Position = Vector2.new(pos.X, pos.Y - 25)
                e.nt.Visible=true e.dt.Visible=true
                local hp = hum.Health / math.max(hum.MaxHealth,1)
                local bx, by = pos.X - 25, pos.Y - 15
                e.hb.Size = Vector2.new(50,4) e.hb.Position = Vector2.new(bx,by) e.hb.Visible=true
                e.hf.Size = Vector2.new(50*hp,4) e.hf.Position = Vector2.new(bx,by) e.hf.Visible=true
            else
                e.nt.Visible=false e.dt.Visible=false e.hb.Visible=false e.hf.Visible=false
            end
        end
        for npc, e in pairs(ESPn_t) do
            if not npc.Parent then killESP(e) ESPn_t[npc] = nil end
        end
    else
        for npc, e in pairs(ESPn_t) do killESP(e) ESPn_t[npc] = nil end
    end
end

local function stopFly()
    if FlyConn then FlyConn:Disconnect() FlyConn = nil end
    if FlyBV then FlyBV:Destroy() FlyBV = nil end
    if FlyBG then FlyBG:Destroy() FlyBG = nil end
end

local function startFly()
    stopFly()
    local c = LP.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not h or not hum then return end
    FlyBV = Instance.new("BodyVelocity")
    FlyBV.MaxForce = Vector3.new(9e9,9e9,9e9)
    FlyBV.Velocity = Vector3.zero
    FlyBV.Parent = h
    FlyBG = Instance.new("BodyGyro")
    FlyBG.MaxTorque = Vector3.new(9e9,9e9,9e9)
    FlyBG.P = 1000 FlyBG.D = 50
    FlyBG.CFrame = h.CFrame
    FlyBG.Parent = h
    FlyConn = RunService.RenderStepped:Connect(function()
        local cc = workspace.CurrentCamera
        local mv = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then mv += cc.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then mv -= cc.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then mv -= cc.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then mv += cc.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then mv += Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then mv -= Vector3.new(0,1,0) end
        if mv.Magnitude > 0 then mv = mv.Unit * S.FlySpd end
        FlyBV.Velocity = mv
        FlyBG.CFrame = cc.CFrame
    end)
end

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if not S.ClickTP then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        task.wait(0.05)
        tpMouse()
    end
end)

RunService.Heartbeat:Connect(function()
    local c = LP.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            if S.Speed then hum.WalkSpeed = S.SpeedVal end
            if S.Jump then hum.UseJumpPower = true hum.JumpPower = S.JumpVal end
        end
        if S.Noclip then
            for _, p in ipairs(c:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
            end
        end
    end
    updateESP()
    updateToolESP()
    assassinTick()
    autoNeckTick()
end)

UIS.JumpRequest:Connect(function()
    if S.InfJump then
        local c = LP.Character
        if c then
            local hum = c:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end)

-- ========== UI ==========
local parentGui = (gethui and gethui()) or CoreGui
local gui = Instance.new("ScreenGui")
gui.Name = "ThaiPhanHub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
pcall(function() gui.Parent = parentGui end)

local BG=Color3.fromRGB(15,15,15)
local BG2=Color3.fromRGB(28,28,28)
local W=Color3.fromRGB(255,255,255)
local GR=Color3.fromRGB(180,180,180)
local DK=Color3.fromRGB(60,60,60)
local BK=Color3.fromRGB(0,0,0)

local orb = Instance.new("TextButton")
orb.Name = "Orb"
orb.Size = UDim2.new(0, 78, 0, 78)
orb.Position = UDim2.new(0, 30, 0.4, 0)
orb.BackgroundColor3 = BK
orb.Text = "TP"
orb.TextColor3 = W
orb.TextScaled = true
orb.Font = Enum.Font.GothamBlack
orb.BorderSizePixel = 0
orb.AutoButtonColor = false
orb.Active = true
orb.Parent = gui

local oc = Instance.new("UICorner")
oc.CornerRadius = UDim.new(1, 0)
oc.Parent = orb

local opad = Instance.new("UIPadding")
opad.PaddingTop = UDim.new(0, 16)
opad.PaddingBottom = UDim.new(0, 16)
opad.PaddingLeft = UDim.new(0, 16)
opad.PaddingRight = UDim.new(0, 16)
opad.Parent = orb

local ost = Instance.new("UIStroke")
ost.Color = W
ost.Thickness = 3
ost.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ost.Parent = orb

local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 290, 0, 540)
menu.Position = UDim2.new(0, 30, 0.4, 92)
menu.BackgroundColor3 = BG
menu.BorderSizePixel = 0
menu.Visible = false
menu.Active = true
menu.Parent = gui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 12)
mc.Parent = menu

local mst = Instance.new("UIStroke")
mst.Color = GR
mst.Thickness = 1.5
mst.Parent = menu

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 44)
title.BackgroundColor3 = W
title.Text = "THAIPHAN HUB"
title.TextColor3 = BK
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.BorderSizePixel = 0
title.Parent = menu

local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 12)
tc.Parent = title

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -20, 0, 16)
sub.Position = UDim2.new(0, 10, 0, 46)
sub.BackgroundTransparency = 1
sub.Text = "— FULL EDITION —"
sub.TextColor3 = GR
sub.Font = Enum.Font.Gotham
sub.TextSize = 11
sub.Parent = menu

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -76)
scroll.Position = UDim2.new(0, 10, 0, 66)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.ScrollBarImageColor3 = W
scroll.CanvasSize = UDim2.new(0, 0, 0, 3000)
scroll.Parent = menu

local lay = Instance.new("UIListLayout")
lay.Padding = UDim.new(0, 6)
lay.SortOrder = Enum.SortOrder.LayoutOrder
lay.Parent = scroll

local pd = Instance.new("UIPadding")
pd.PaddingTop = UDim.new(0, 5)
pd.PaddingBottom = UDim.new(0, 10)
pd.Parent = scroll

local function mkToggle(text, default, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -6, 0, 34)
    b.BackgroundColor3 = BG2
    b.Text = "[ OFF ]  " .. text
    b.TextColor3 = GR
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = scroll
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    local st = Instance.new("UIStroke")
    st.Color = DK
    st.Thickness = 1.5
    st.Parent = b
    local s = default
    if s then
        b.BackgroundColor3=W st.Color=W b.Text="[ ON ]  "..text b.TextColor3=BK
    end
    b.MouseButton1Click:Connect(function()
        s = not s
        if s then
            b.BackgroundColor3=W st.Color=W b.Text="[ ON ]  "..text b.TextColor3=BK
        else
            b.BackgroundColor3=BG2 st.Color=DK b.Text="[ OFF ]  "..text b.TextColor3=GR
        end
        cb(s)
    end)
end

local function mkSlider(text, mn, mx, dflt, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -6, 0, 48)
    f.BackgroundColor3 = BG2
    f.BorderSizePixel = 0
    f.Parent = scroll
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = f
    local st = Instance.new("UIStroke")
    st.Color = DK
    st.Thickness = 1.5
    st.Parent = f
    local lb = Instance.new("TextLabel")
    lb.Size = UDim2.new(1, -12, 0, 22)
    lb.Position = UDim2.new(0, 6, 0, 2)
    lb.BackgroundTransparency = 1
    lb.Text = text .. ": " .. dflt
    lb.TextColor3 = W
    lb.Font = Enum.Font.GothamBold
    lb.TextSize = 13
    lb.Parent = f
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -20, 0, 10)
    bar.Position = UDim2.new(0, 10, 0, 30)
    bar.BackgroundColor3 = BK
    bar.BorderSizePixel = 0
    bar.Parent = f
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = bar
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((dflt - mn) / (mx - mn), 0, 1, 0)
    fill.BackgroundColor3 = W
    fill.BorderSizePixel = 0
    fill.Parent = bar
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(1, 0)
    fc.Parent = fill
    local drag = false
    local function setX(x)
        local rel = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local v = math.floor(mn + (mx - mn) * rel + 0.5)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        lb.Text = text .. ": " .. v
        cb(v)
    end
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            drag = true
            setX(input.Position.X)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            setX(input.Position.X)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)
end

local function mkHeader(t)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -6, 0, 26)
    l.BackgroundTransparency = 1
    l.Text = "◆ " .. t .. " ◆"
    l.TextColor3 = W
    l.Font = Enum.Font.GothamBlack
    l.TextSize = 14
    l.Parent = scroll
end

local function mkButton(t, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -6, 0, 34)
    b.BackgroundColor3 = W
    b.Text = t
    b.TextColor3 = BK
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = scroll
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    b.MouseButton1Click:Connect(cb)
end

local function mkLabel(t)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -6, 0, 16)
    l.BackgroundTransparency = 1
    l.Text = t
    l.TextColor3 = GR
    l.Font = Enum.Font.Gotham
    l.TextSize = 11
    l.Parent = scroll
end

-- === PICKER CÓ SCROLL ===
local function mkPicker(lt, onPick)
    mkLabel(lt)
    local h, itemH, padH, maxShow = 34, 28, 8, 6
    local wrap = Instance.new("Frame")
    wrap.Size = UDim2.new(1, -6, 0, h)
    wrap.BackgroundColor3 = BG2
    wrap.BorderSizePixel = 0
    wrap.ClipsDescendants = true
    wrap.Parent = scroll
    local wc = Instance.new("UICorner")
    wc.CornerRadius = UDim.new(0, 8)
    wc.Parent = wrap
    local wst = Instance.new("UIStroke")
    wst.Color = DK
    wst.Thickness = 1.5
    wst.Parent = wrap

    local disp = Instance.new("TextButton")
    disp.Size = UDim2.new(1, 0, 0, h)
    disp.BackgroundTransparency = 1
    disp.Text = "▼  Select player..."
    disp.TextColor3 = GR
    disp.Font = Enum.Font.GothamBold
    disp.TextSize = 13
    disp.BorderSizePixel = 0
    disp.Parent = wrap

    local holder = Instance.new("ScrollingFrame")
    holder.Size = UDim2.new(1, 0, 0, 0)
    holder.Position = UDim2.new(0, 0, 0, h)
    holder.BackgroundTransparency = 1
    holder.BorderSizePixel = 0
    holder.ScrollBarThickness = 4
    holder.ScrollBarImageColor3 = W
    holder.CanvasSize = UDim2.new(0, 0, 0, 0)
    holder.ScrollingDirection = Enum.ScrollingDirection.Y
    holder.Visible = false
    holder.Parent = wrap

    local hlay = Instance.new("UIListLayout")
    hlay.Padding = UDim.new(0, 2)
    hlay.SortOrder = Enum.SortOrder.LayoutOrder
    hlay.Parent = holder

    local hpad = Instance.new("UIPadding")
    hpad.PaddingTop = UDim.new(0, 4)
    hpad.PaddingBottom = UDim.new(0, 4)
    hpad.Parent = holder

    local expanded = false

    local function build()
        for _, ch in ipairs(holder:GetChildren()) do
            if ch:IsA("TextButton") or ch:IsA("TextLabel") then ch:Destroy() end
        end

        local count = 0
        for i, plr in ipairs(Players:GetPlayers()) do
            if plr == LP then continue end
            count = count + 1

            local opt = Instance.new("TextButton")
            opt.Size = UDim2.new(1, -8, 0, itemH)
            opt.BackgroundColor3 = BG
            opt.Text = plr.Name
            opt.TextColor3 = W
            opt.Font = Enum.Font.Gotham
            opt.TextSize = 13
            opt.BorderSizePixel = 0
            opt.AutoButtonColor = false
            opt.LayoutOrder = i
            opt.Parent = holder

            local oc2 = Instance.new("UICorner")
            oc2.CornerRadius = UDim.new(0, 6)
            oc2.Parent = opt

            opt.MouseButton1Click:Connect(function()
                disp.Text = "▼  " .. plr.Name
                disp.TextColor3 = W
                expanded = false
                wrap.Size = UDim2.new(1, -6, 0, h)
                holder.Visible = false
                onPick(plr)
            end)
        end

        if count == 0 then
            local none = Instance.new("TextLabel")
            none.Size = UDim2.new(1, -8, 0, itemH)
            none.BackgroundTransparency = 1
            none.Text = "No other players"
            none.TextColor3 = GR
            none.Font = Enum.Font.Gotham
            none.TextSize = 12
            none.Parent = holder
            count = 1
        end

        local listH = math.min(count, maxShow) * (itemH + 2) + padH
        local canvasH = count * (itemH + 2) + padH

        wrap.Size = UDim2.new(1, -6, 0, h + listH)
        holder.Size = UDim2.new(1, 0, 0, listH)
        holder.CanvasSize = UDim2.new(0, 0, 0, canvasH)
        holder.Visible = true
    end

    disp.MouseButton1Click:Connect(function()
        if expanded then
            expanded = false
            wrap.Size = UDim2.new(1, -6, 0, h)
            holder.Visible = false
        else
            expanded = true
            build()
        end
    end)
end

-- BUILD
mkHeader("MOVEMENT")
mkToggle("Speed", S.Speed, function(v) S.Speed = v end)
mkSlider("Speed Value", 16, 300, 16, function(v) S.SpeedVal = v end)
mkToggle("Jump Power", S.Jump, function(v) S.Jump = v end)
mkSlider("Jump Value", 50, 500, 50, function(v) S.JumpVal = v end)
mkToggle("Infinite Jump", S.InfJump, function(v) S.InfJump = v end)
mkToggle("Noclip", S.Noclip, function(v) S.Noclip = v end)
mkToggle("Fly", S.Fly, function(v) S.Fly = v if v then startFly() else stopFly() end end)
mkSlider("Fly Speed", 10, 300, 50, function(v) S.FlySpd = v end)

mkHeader("ESP")
mkToggle("ESP Player", S.ESPp, function(v) S.ESPp = v end)
mkToggle("ESP NPC", S.ESPn, function(v) S.ESPn = v end)
mkToggle("ESP Tool Hitbox (3D)", S.ESPTool, function(v) S.ESPTool = v end)
mkToggle("Tool Box — My Tool", S.ToolBoxOwn, function(v) S.ToolBoxOwn = v end)
mkToggle("Tool Box — Others", S.ToolBoxOthers, function(v) S.ToolBoxOthers = v end)
mkLabel("Wireframe 3D xanh neon = hitbox tool đang cầm")

mkHeader("TELEPORT")
mkPicker("Select target:", function(p) TPTarget = p end)
mkButton("TELEPORT TO PLAYER", function()
    if TPTarget then tpPlayer(TPTarget) end
end)
mkToggle("Click Teleport", S.ClickTP, function(v) S.ClickTP = v end)
mkLabel("ON → tap where to teleport")

mkHeader("ASSASSINATE")
mkPicker("Select target:", function(p) AsTarget = p end)
mkToggle("Assassinate", S.Assassin, function(v) S.Assassin = v if v then assassinTick() end end)
mkSlider("Assassin Distance", 2, 30, 3, function(v) S.AssassinDist = v end)
mkToggle("Auto Neck Hit", S.AutoNeck, function(v) S.AutoNeck = v end)
mkSlider("Hit Range", 5, 100, 15, function(v) S.HitRange = v end)
mkSlider("Hit Delay (ms)", 50, 1000, 100, function(v) S.HitDelay = v / 1000 end)
mkLabel("Distance: stand-behind gap | Delay: swing speed")

-- ORB DRAG + CLICK
local orbDrag = false
local orbSP, orbSM, orbDT = nil, nil, 0

orb.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        orbDrag = true
        orbSP = orb.Position
        orbSM = input.Position
        orbDT = tick()
    end
end)

UIS.InputChanged:Connect(function(input)
    if orbDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - orbSM
        orb.Position = UDim2.new(orbSP.X.Scale, orbSP.X.Offset + d.X, orbSP.Y.Scale, orbSP.Y.Offset + d.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if orbDrag and (tick() - orbDT) < 0.3 then
            menu.Visible = not menu.Visible
        end
        orbDrag = false
    end
end)

-- MENU DRAG
local menuDrag = false
local menuSP, menuSM = nil, nil

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        menuDrag = true
        menuSP = menu.Position
        menuSM = input.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if menuDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - menuSM
        menu.Position = UDim2.new(menuSP.X.Scale, menuSP.X.Offset + d.X, menuSP.Y.Scale, menuSP.Y.Offset + d.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        menuDrag = false
    end
end)

LP.CharacterAdded:Connect(function()
    if S.Fly then task.wait(0.5) startFly() end
end)

print("[ThaiPhan Hub v14] loaded — Tool Hitbox 3D (fixed)")