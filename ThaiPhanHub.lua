local _0xE40D = game:GetService("Players")
local _0xFC1F = game:GetService("RunService")
local _0xD517 = game:GetService("UserInputService")
local _0xE81E = game:GetService("TweenService")
local _0xF642 = _0xE40D.LocalPlayer
local _0x705C = workspace.CurrentCamera
for _0xC9F8,n in ipairs({"ThaiPhanHubUI"}) do
local _0xE60D = game.CoreGui:FindFirstChild(n)
if _0xE60D then _0xE60D:Destroy() end
endlocal _0x634A ="ThaiPhanDepTraiSo1"local _0xF800 ="https://discord.gg/rW6X2jszJc"local _0x6147 = {
BG = Color3.fromRGB(8, 8, 10),
PANEL = Color3.fromRGB(16, 16, 18),
DIM = Color3.fromRGB(140, 140, 150),
TEXT = Color3.fromRGB(240, 240, 245),
WHITE = Color3.fromRGB(255, 255, 255),
BLACK = Color3.fromRGB(0, 0, 0),
}local _0x15B6 = {
SpeedOn = false, SpeedVal = 16,
ESPP = false, ESPN = false, ESPHit = false,
Noclip = false,
TeleTarget = nil,
AsTarget = nil,
Assassin = false, AssassinDist = 3,
AutoNeck = false, HitRange = 15, HitDelay = 0.1,
}
local _0xDA0B = {}
local _0xC275 = {}
local _0x1FED = {}
local _0x6E56 = 0local _0xB921 = Instance.new("ScreenGui")
_0xB921.Name ="ThaiPhanHubUI"_0xB921.ResetOnSpawn = false
_0xB921.IgnoreGuiInset = true
_0xB921.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0xB921.Parent = game.CoreGuilocal function _0x0A4A(frame, handle)
handle = handle or frame
local _0x8EFC, _0x1D1C, _0x2045 = false, nil, nil
handle.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x8EFC = true
_0x1D1C = i.Position
_0x2045 = frame.Position
i.Changed:Connect(function()
if i.UserInputState == Enum.UserInputState.End then
_0x8EFC = false
end
end)
end
end)
_0xD517.InputChanged:Connect(function(i)
if _0x8EFC and (i.UserInputType == Enum.UserInputType.MouseMovement
or i.UserInputType == Enum.UserInputType.Touch) then
local _0x8713 = i.Position - _0x1D1C
frame.Position = UDim2.new(
_0x2045.X.Scale, _0x2045.X.Offset + _0x8713.X,
_0x2045.Y.Scale, _0x2045.Y.Offset + _0x8713.Y
)
end
end)
end
local function _0x53D7(parent, color, thickness, transparency)
local _0x81AA = Instance.new("UIStroke", parent)
_0x81AA.Color = color or _0x6147.WHITE
_0x81AA.Thickness = thickness or 1
_0x81AA.Transparency = transparency or 0
_0x81AA.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
return _0x81AA
end
local function _0xAA96(parent, r)
local _0xE06D = Instance.new("UICorner", parent)
_0xE06D.CornerRadius = UDim.new(0, r or 10)
return _0xE06D
end
local function _0xAFAA(parent, c1, c2, rot)
local _0xC307 = Instance.new("UIGradient", parent)
_0xC307.Color = ColorSequence.new(c1, c2)
_0xC307.Rotation = rot or 90
return _0xC307
endlocal _0xEF70 = Instance.new("Frame")
_0xEF70.Name ="KeySystem"_0xEF70.Size = UDim2.fromOffset(360, 260)
_0xEF70.Position = UDim2.new(0.5, -180, 0.5, -130)
_0xEF70.BackgroundColor3 = _0x6147.BG
_0xEF70.BorderSizePixel = 0
_0xEF70.Active = true
_0xEF70.ZIndex = 100
_0xEF70.Parent = _0xB921
_0xAA96(_0xEF70, 14)
_0xAFAA(_0xEF70, Color3.fromRGB(14,14,16), Color3.fromRGB(4,4,6), 90)
_0x53D7(_0xEF70, _0x6147.WHITE, 1.5, 0)
local _0xA542 = Instance.new("TextLabel")
_0xA542.Size = UDim2.new(1, -20, 0, 40)
_0xA542.Position = UDim2.fromOffset(10, 14)
_0xA542.BackgroundTransparency = 1
_0xA542.Text ="ThaiPhanHub"_0xA542.TextColor3 = _0x6147.WHITE
_0xA542.Font = Enum.Font.GothamBlack
_0xA542.TextSize = 20
_0xA542.ZIndex = 101
_0xA542.Parent = _0xEF70
_0xAFAA(_0xA542, _0x6147.WHITE, Color3.fromRGB(170,170,175), 90)
local _0xB6EC = Instance.new("UIStroke", _0xA542)
_0xB6EC.Color = _0x6147.WHITE
_0xB6EC.Thickness = 1
_0xB6EC.Transparency = 0.6
local _0x0F14 = Instance.new("TextLabel")
_0x0F14.Size = UDim2.new(1, -20, 0, 20)
_0x0F14.Position = UDim2.fromOffset(10, 52)
_0x0F14.BackgroundTransparency = 1
_0x0F14.Text ="Enter key to continue"_0x0F14.TextColor3 = _0x6147.DIM
_0x0F14.Font = Enum.Font.GothamBold
_0x0F14.TextSize = 12
_0x0F14.ZIndex = 101
_0x0F14.Parent = _0xEF70
local _0x51FD = Instance.new("TextBox")
_0x51FD.Size = UDim2.new(1, -40, 0, 40)
_0x51FD.Position = UDim2.new(0, 20, 0, 84)
_0x51FD.BackgroundColor3 = _0x6147.BLACK
_0x51FD.Text =""_0x51FD.PlaceholderText ="Enter key..."_0x51FD.PlaceholderColor3 = _0x6147.DIM
_0x51FD.TextColor3 = _0x6147.WHITE
_0x51FD.Font = Enum.Font.GothamBold
_0x51FD.TextSize = 14
_0x51FD.ClearTextOnFocus = false
_0x51FD.ZIndex = 101
_0x51FD.Parent = _0xEF70
_0xAA96(_0x51FD, 8)
_0x53D7(_0x51FD, _0x6147.WHITE, 1, 0.4)
local _0x964D = Instance.new("TextButton")
_0x964D.Size = UDim2.new(1, -40, 0, 40)
_0x964D.Position = UDim2.new(0, 20, 0, 134)
_0x964D.BackgroundColor3 = _0x6147.WHITE
_0x964D.Text ="Submit"_0x964D.TextColor3 = _0x6147.BLACK
_0x964D.Font = Enum.Font.GothamBlack
_0x964D.TextSize = 14
_0x964D.AutoButtonColor = false
_0x964D.ZIndex = 101
_0x964D.Parent = _0xEF70
_0xAA96(_0x964D, 8)
_0x53D7(_0x964D, _0x6147.WHITE, 1, 0)
local _0xA720 = Instance.new("TextLabel")
_0xA720.Size = UDim2.new(1, -40, 0, 18)
_0xA720.Position = UDim2.new(0, 20, 0, 178)
_0xA720.BackgroundTransparency = 1
_0xA720.Text =""_0xA720.TextColor3 = _0x6147.WHITE
_0xA720.Font = Enum.Font.GothamBold
_0xA720.TextSize = 12
_0xA720.ZIndex = 101
_0xA720.Parent = _0xEF70
local _0x4954 = Instance.new("TextButton")
_0x4954.Size = UDim2.new(1, -40, 0, 34)
_0x4954.Position = UDim2.new(0, 20, 1, -50)
_0x4954.BackgroundColor3 = _0x6147.BLACK
_0x4954.Text ="Join Discord"_0x4954.TextColor3 = _0x6147.WHITE
_0x4954.Font = Enum.Font.GothamBlack
_0x4954.TextSize = 13
_0x4954.AutoButtonColor = false
_0x4954.ZIndex = 101
_0x4954.Parent = _0xEF70
_0xAA96(_0x4954, 8)
_0x53D7(_0x4954, _0x6147.WHITE, 1, 0)
_0x4954.MouseEnter:Connect(function()
_0xE81E:Create(_0x4954, TweenInfo.new(0.15), {
BackgroundColor3 = _0x6147.WHITE, TextColor3 = _0x6147.BLACK
}):Play()
end)
_0x4954.MouseLeave:Connect(function()
_0xE81E:Create(_0x4954, TweenInfo.new(0.15), {
BackgroundColor3 = _0x6147.BLACK, TextColor3 = _0x6147.WHITE
}):Play()
end)
_0x4954.MouseButton1Click:Connect(function()
pcall(function()
game:GetService("GuiService"):OpenBrowserWindow(_0xF800)
end)
end)
_0x0A4A(_0xEF70, _0xA542)
local function _0x57E4()
local _0xBFFC = _0x51FD.Position
for i = 1, 4 do
_0xE81E:Create(_0x51FD, TweenInfo.new(0.05), {
Position = _0xBFFC + UDim2.fromOffset(i % 2 == 0 and 8 or -8, 0)
}):Play()
task.wait(0.05)
end
_0xE81E:Create(_0x51FD, TweenInfo.new(0.08), {Position = _0xBFFC}):Play()
endlocal _0x6E8A = Instance.new("Frame")
_0x6E8A.Name ="Menu"_0x6E8A.Size = UDim2.fromOffset(460, 520)
_0x6E8A.Position = UDim2.new(0.5, -230, 0.5, -260)
_0x6E8A.BackgroundColor3 = _0x6147.BG
_0x6E8A.BorderSizePixel = 0
_0x6E8A.Visible = false
_0x6E8A.Active = true
_0x6E8A.ZIndex = 5
_0x6E8A.Parent = _0xB921
_0xAA96(_0x6E8A, 14)
_0xAFAA(_0x6E8A, Color3.fromRGB(14,14,16), Color3.fromRGB(4,4,6), 90)
_0x53D7(_0x6E8A, _0x6147.WHITE, 1.5, 0)
local _0xA9AB = Instance.new("Frame")
_0xA9AB.Size = UDim2.new(1, 0, 0, 46)
_0xA9AB.BackgroundColor3 = _0x6147.PANEL
_0xA9AB.BorderSizePixel = 0
_0xA9AB.Active = true
_0xA9AB.ZIndex = 6
_0xA9AB.Parent = _0x6E8A
_0xAA96(_0xA9AB, 14)
local _0xE717 = Instance.new("Frame", _0xA9AB)
_0xE717.Size = UDim2.new(1, 0, 0, 14)
_0xE717.Position = UDim2.new(0, 0, 1, -14)
_0xE717.BackgroundColor3 = _0x6147.PANEL
_0xE717.BorderSizePixel = 0
_0xE717.ZIndex = 6
_0xAFAA(_0xA9AB, Color3.fromRGB(28,28,30), Color3.fromRGB(14,14,16), 90)
local _0xA67E = Instance.new("TextLabel")
_0xA67E.Size = UDim2.new(1, -60, 1, 0)
_0xA67E.Position = UDim2.fromOffset(18, 0)
_0xA67E.BackgroundTransparency = 1
_0xA67E.Text ="ThaiPhanHub"_0xA67E.TextColor3 = _0x6147.WHITE
_0xA67E.Font = Enum.Font.GothamBlack
_0xA67E.TextSize = 16
_0xA67E.TextXAlignment = Enum.TextXAlignment.Left
_0xA67E.ZIndex = 7
_0xA67E.Parent = _0xA9AB
local _0x35EF = Instance.new("UIStroke", _0xA67E)
_0x35EF.Color = _0x6147.WHITE
_0x35EF.Thickness = 1
_0x35EF.Transparency = 0.6
_0xAFAA(_0xA67E, _0x6147.WHITE, Color3.fromRGB(170,170,175), 90)
local _0x1630 = Instance.new("TextLabel")
_0x1630.Size = UDim2.fromOffset(38, 22)
_0x1630.Position = UDim2.new(1, -84, 0.5, -11)
_0x1630.BackgroundColor3 = _0x6147.BLACK
_0x1630.Text ="TP"_0x1630.TextColor3 = _0x6147.WHITE
_0x1630.Font = Enum.Font.GothamBlack
_0x1630.TextSize = 13
_0x1630.ZIndex = 7
_0x1630.Parent = _0xA9AB
_0xAA96(_0x1630, 6)
_0x53D7(_0x1630, _0x6147.WHITE, 1, 0)
local _0x58B7 = Instance.new("TextButton")
_0x58B7.Size = UDim2.fromOffset(30, 30)
_0x58B7.Position = UDim2.new(1, -38, 0.5, -15)
_0x58B7.BackgroundColor3 = _0x6147.BLACK
_0x58B7.Text ="x"_0x58B7.TextColor3 = _0x6147.WHITE
_0x58B7.Font = Enum.Font.GothamBold
_0x58B7.TextSize = 18
_0x58B7.AutoButtonColor = false
_0x58B7.ZIndex = 7
_0x58B7.Parent = _0xA9AB
_0xAA96(_0x58B7, 15)
_0x53D7(_0x58B7, _0x6147.WHITE, 1, 0)
_0x58B7.MouseEnter:Connect(function()
_0xE81E:Create(_0x58B7, TweenInfo.new(0.15), {BackgroundColor3 = _0x6147.WHITE}):Play()
_0xE81E:Create(_0x58B7, TweenInfo.new(0.15), {TextColor3 = _0x6147.BLACK}):Play()
end)
_0x58B7.MouseLeave:Connect(function()
_0xE81E:Create(_0x58B7, TweenInfo.new(0.15), {BackgroundColor3 = _0x6147.BLACK}):Play()
_0xE81E:Create(_0x58B7, TweenInfo.new(0.15), {TextColor3 = _0x6147.WHITE}):Play()
end)
_0x0A4A(_0x6E8A, _0xA9AB)
local _0xD90F = Instance.new("Frame")
_0xD90F.Size = UDim2.new(1, -20, 0, 34)
_0xD90F.Position = UDim2.fromOffset(10, 54)
_0xD90F.BackgroundTransparency = 1
_0xD90F.ZIndex = 6
_0xD90F.Parent = _0x6E8A
local _0x21C5 = Instance.new("UIListLayout", _0xD90F)
_0x21C5.FillDirection = Enum.FillDirection.Horizontal
_0x21C5.Padding = UDim.new(0, 5)
_0x21C5.SortOrder = Enum.SortOrder.LayoutOrder
local _0xBD36 = Instance.new("Frame")
_0xBD36.Size = UDim2.new(1, -20, 0, 1)
_0xBD36.Position = UDim2.fromOffset(10, 94)
_0xBD36.BackgroundColor3 = _0x6147.WHITE
_0xBD36.BackgroundTransparency = 0.75
_0xBD36.BorderSizePixel = 0
_0xBD36.ZIndex = 6
_0xBD36.Parent = _0x6E8A
local _0x7FFA = Instance.new("Frame")
_0x7FFA.Size = UDim2.new(1, -20, 1, -108)
_0x7FFA.Position = UDim2.fromOffset(10, 100)
_0x7FFA.BackgroundTransparency = 1
_0x7FFA.ZIndex = 6
_0x7FFA.Parent = _0x6E8Alocal function _0x9CD1(parent, text, callback)
local _0x8016 = Instance.new("Frame")
_0x8016.Size = UDim2.new(1, -6, 0, 40)
_0x8016.BackgroundColor3 = _0x6147.PANEL
_0x8016.BorderSizePixel = 0
_0x8016.ZIndex = 6
_0x8016.Parent = parent
_0xAA96(_0x8016, 8)
_0x53D7(_0x8016, _0x6147.WHITE, 1, 0.85)
local _0x412D = Instance.new("TextLabel")
_0x412D.Size = UDim2.new(1, -70, 1, 0)
_0x412D.Position = UDim2.fromOffset(14, 0)
_0x412D.BackgroundTransparency = 1
_0x412D.Text = text
_0x412D.TextColor3 = _0x6147.TEXT
_0x412D.Font = Enum.Font.GothamBold
_0x412D.TextSize = 13
_0x412D.TextXAlignment = Enum.TextXAlignment.Left
_0x412D.ZIndex = 7
_0x412D.Parent = _0x8016
local _0x764E = Instance.new("TextButton")
_0x764E.Size = UDim2.fromOffset(50, 24)
_0x764E.Position = UDim2.new(1, -62, 0.5, -12)
_0x764E.BackgroundColor3 = _0x6147.BLACK
_0x764E.Text =""_0x764E.AutoButtonColor = false
_0x764E.ZIndex = 7
_0x764E.Parent = _0x8016
_0xAA96(_0x764E, 12)
_0x53D7(_0x764E, _0x6147.WHITE, 1, 0.5)
local _0x16F8 = Instance.new("Frame")
_0x16F8.Size = UDim2.fromOffset(18, 18)
_0x16F8.Position = UDim2.fromOffset(3, 3)
_0x16F8.BackgroundColor3 = _0x6147.WHITE
_0x16F8.ZIndex = 8
_0x16F8.Parent = _0x764E
_0xAA96(_0x16F8, 9)
local _0x60BB = false
local function _0x7EFC(v)
_0x60BB = v
_0xE81E:Create(_0x16F8, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
Position = v and UDim2.fromOffset(29, 3) or UDim2.fromOffset(3, 3),
BackgroundColor3 = v and _0x6147.BLACK or _0x6147.WHITE,
}):Play()
_0xE81E:Create(_0x764E, TweenInfo.new(0.18), {
BackgroundColor3 = v and _0x6147.WHITE or _0x6147.BLACK,
}):Play()
callback(v)
end
_0x764E.MouseButton1Click:Connect(function() _0x7EFC(not _0x60BB) end)
return _0x8016, _0x7EFC
end
local function _0x9C19(parent, text, min, max, def, callback, isFloat)
local _0x8016 = Instance.new("Frame")
_0x8016.Size = UDim2.new(1, -6, 0, 64)
_0x8016.BackgroundColor3 = _0x6147.PANEL
_0x8016.BorderSizePixel = 0
_0x8016.ZIndex = 6
_0x8016.Parent = parent
_0xAA96(_0x8016, 8)
_0x53D7(_0x8016, _0x6147.WHITE, 1, 0.85)
local _0x412D = Instance.new("TextLabel")
_0x412D.Size = UDim2.new(1, -100, 0, 24)
_0x412D.Position = UDim2.fromOffset(14, 6)
_0x412D.BackgroundTransparency = 1
_0x412D.Text = text
_0x412D.TextColor3 = _0x6147.TEXT
_0x412D.Font = Enum.Font.GothamBold
_0x412D.TextSize = 13
_0x412D.TextXAlignment = Enum.TextXAlignment.Left
_0x412D.ZIndex = 7
_0x412D.Parent = _0x8016
local _0x5F9D = Instance.new("TextLabel")
_0x5F9D.Size = UDim2.fromOffset(70, 24)
_0x5F9D.Position = UDim2.new(1, -82, 0, 6)
_0x5F9D.BackgroundTransparency = 1
_0x5F9D.Text = tostring(def)
_0x5F9D.TextColor3 = _0x6147.WHITE
_0x5F9D.Font = Enum.Font.GothamBlack
_0x5F9D.TextSize = 13
_0x5F9D.TextXAlignment = Enum.TextXAlignment.Right
_0x5F9D.ZIndex = 7
_0x5F9D.Parent = _0x8016
local _0x640F = Instance.new("Frame")
_0x640F.Size = UDim2.new(1, -28, 0, 8)
_0x640F.Position = UDim2.new(0, 14, 1, -20)
_0x640F.BackgroundColor3 = _0x6147.BLACK
_0x640F.BorderSizePixel = 0
_0x640F.ZIndex = 7
_0x640F.Parent = _0x8016
_0xAA96(_0x640F, 4)
_0x53D7(_0x640F, _0x6147.WHITE, 1, 0.5)
local _0xA25F = Instance.new("Frame")
_0xA25F.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)
_0xA25F.BackgroundColor3 = _0x6147.WHITE
_0xA25F.BorderSizePixel = 0
_0xA25F.ZIndex = 8
_0xA25F.Parent = _0x640F
_0xAA96(_0xA25F, 4)
_0xAFAA(_0xA25F, _0x6147.WHITE, Color3.fromRGB(180,180,180), 0)
local _0x89E4 = false
local function _0x70FB(v)
v = math.clamp(v, min, max)
_0xA25F.Size = UDim2.new((v - min) / (max - min), 0, 1, 0)
if isFloat then
_0x5F9D.Text = string.format("%.2f", v)
else
_0x5F9D.Text = tostring(math.floor(v))
end
callback(v)
end
_0x640F.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x89E4 = true
local _0xA6D7 = (i.Position.X - _0x640F.AbsolutePosition.X) / _0x640F.AbsoluteSize.X
_0x70FB(min + _0xA6D7 * (max - min))
end
end)
_0xD517.InputChanged:Connect(function(i)
if _0x89E4 and (i.UserInputType == Enum.UserInputType.MouseMovement
or i.UserInputType == Enum.UserInputType.Touch) then
local _0xA6D7 = (i.Position.X - _0x640F.AbsolutePosition.X) / _0x640F.AbsoluteSize.X
_0x70FB(min + _0xA6D7 * (max - min))
end
end)
_0xD517.InputEnded:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x89E4 = false
end
end)
return _0x8016, _0x70FB
end
local function _0x3BAD(parent, text, color)
local _0x38A5 = Instance.new("TextLabel")
_0x38A5.Size = UDim2.new(1, -6, 0, 22)
_0x38A5.BackgroundTransparency = 1
_0x38A5.Text = text
_0x38A5.TextColor3 = color or _0x6147.DIM
_0x38A5.Font = Enum.Font.GothamBold
_0x38A5.TextSize = 12
_0x38A5.TextXAlignment = Enum.TextXAlignment.Left
_0x38A5.TextWrapped = true
_0x38A5.ZIndex = 6
_0x38A5.Parent = parent
return _0x38A5
end
local function _0xCE98(parent, text, callback, primary, height)
local _0x1BE9 = Instance.new("TextButton")
_0x1BE9.Size = UDim2.new(1, -6, 0, height or 36)
_0x1BE9.BackgroundColor3 = primary and _0x6147.WHITE or _0x6147.BLACK
_0x1BE9.Text = text
_0x1BE9.TextColor3 = primary and _0x6147.BLACK or _0x6147.WHITE
_0x1BE9.Font = Enum.Font.GothamBlack
_0x1BE9.TextSize = 13
_0x1BE9.AutoButtonColor = false
_0x1BE9.ZIndex = 6
_0x1BE9.Parent = parent
_0xAA96(_0x1BE9, 8)
_0x53D7(_0x1BE9, _0x6147.WHITE, 1, 0)
_0x1BE9.MouseEnter:Connect(function()
_0xE81E:Create(_0x1BE9, TweenInfo.new(0.15), {
BackgroundColor3 = primary and _0x6147.BLACK or _0x6147.WHITE,
TextColor3 = primary and _0x6147.WHITE or _0x6147.BLACK,
}):Play()
end)
_0x1BE9.MouseLeave:Connect(function()
_0xE81E:Create(_0x1BE9, TweenInfo.new(0.15), {
BackgroundColor3 = primary and _0x6147.WHITE or _0x6147.BLACK,
TextColor3 = primary and _0x6147.BLACK or _0x6147.WHITE,
}):Play()
end)
_0x1BE9.MouseButton1Click:Connect(callback)
return _0x1BE9
end
local function _0xB8A6()
local _0x2079 = Instance.new("ScrollingFrame")
_0x2079.Size = UDim2.fromScale(1, 1)
_0x2079.BackgroundTransparency = 1
_0x2079.BorderSizePixel = 0
_0x2079.ScrollBarThickness = 4
_0x2079.ScrollBarImageColor3 = _0x6147.WHITE
_0x2079.ScrollBarImageTransparency = 0.4
_0x2079.CanvasSize = UDim2.new(0, 0, 0, 0)
_0x2079.AutomaticCanvasSize = Enum.AutomaticSize.Y
_0x2079.Visible = false
_0x2079.ZIndex = 6
_0x2079.Parent = _0x7FFA
local _0x837A = Instance.new("UIListLayout", _0x2079)
_0x837A.Padding = UDim.new(0, 8)
_0x837A.SortOrder = Enum.SortOrder.LayoutOrder
return _0x2079
end
local function _0x9B9D(name)
local _0xFC66 = Instance.new("TextButton")
_0xFC66.Size = UDim2.fromOffset(78, 34)
_0xFC66.BackgroundColor3 = _0x6147.BLACK
_0xFC66.Text = name
_0xFC66.TextColor3 = _0x6147.DIM
_0xFC66.Font = Enum.Font.GothamBlack
_0xFC66.TextSize = 12
_0xFC66.AutoButtonColor = false
_0xFC66.ZIndex = 7
_0xFC66.Parent = _0xD90F
_0xAA96(_0xFC66, 8)
_0x53D7(_0xFC66, _0x6147.WHITE, 1, 0.6)
return _0xFC66
endlocal function _0x38DC(parent, labelText, onPick)
_0x3BAD(parent, labelText, _0x6147.DIM)
local _0x7106 = 28
local _0xE971 = 5
local _0x87DA = 36
local _0xA23B = Instance.new("Frame")
_0xA23B.Size = UDim2.new(1, -6, 0, _0x87DA)
_0xA23B.BackgroundColor3 = _0x6147.BLACK
_0xA23B.BorderSizePixel = 0
_0xA23B.ClipsDescendants = true
_0xA23B.ZIndex = 10
_0xA23B.Parent = parent
_0xAA96(_0xA23B, 8)
_0x53D7(_0xA23B, _0x6147.WHITE, 1, 0)
local _0xE43C = Instance.new("TextButton")
_0xE43C.Size = UDim2.new(1, 0, 0, _0x87DA)
_0xE43C.BackgroundTransparency = 1
_0xE43C.Text ="Select Player"_0xE43C.TextColor3 = _0x6147.WHITE
_0xE43C.Font = Enum.Font.GothamBlack
_0xE43C.TextSize = 13
_0xE43C.AutoButtonColor = false
_0xE43C.ZIndex = 11
_0xE43C.Parent = _0xA23B
local _0x36DB = Instance.new("ScrollingFrame")
_0x36DB.Size = UDim2.new(1, 0, 0, 0)
_0x36DB.Position = UDim2.new(0, 0, 0, _0x87DA)
_0x36DB.BackgroundColor3 = _0x6147.PANEL
_0x36DB.BorderSizePixel = 0
_0x36DB.ScrollBarThickness = 4
_0x36DB.ScrollBarImageColor3 = _0x6147.WHITE
_0x36DB.CanvasSize = UDim2.new(0, 0, 0, 0)
_0x36DB.ScrollingDirection = Enum.ScrollingDirection.Y
_0x36DB.Visible = false
_0x36DB.ZIndex = 11
_0x36DB.Parent = _0xA23B
local _0xA2FA = Instance.new("UIListLayout", _0x36DB)
_0xA2FA.Padding = UDim.new(0, 3)
_0xA2FA.SortOrder = Enum.SortOrder.LayoutOrder
local _0xE1FA = Instance.new("UIPadding", _0x36DB)
_0xE1FA.PaddingTop = UDim.new(0, 4)
_0xE1FA.PaddingBottom = UDim.new(0, 4)
_0xE1FA.PaddingLeft = UDim.new(0, 4)
_0xE1FA.PaddingRight = UDim.new(0, 4)
local _0xE23B = false
local function _0x76F8()
_0xE23B = false
_0xA23B.Size = UDim2.new(1, -6, 0, _0x87DA)
_0x36DB.Size = UDim2.new(1, 0, 0, 0)
_0x36DB.Visible = false
end
local function _0x7663()
for _0xC9F8, ch in ipairs(_0x36DB:GetChildren()) do
if ch:IsA("TextButton") then ch:Destroy() end
end
local _0xAB68 = 0
for _0xC9F8, plr in ipairs(_0xE40D:GetPlayers()) do
if plr == _0xF642 then continue end
_0xAB68 = _0xAB68 + 1
local _0x8067 = Instance.new("TextButton")
_0x8067.Size = UDim2.new(1, -8, 0, _0x7106)
_0x8067.BackgroundColor3 = _0x6147.BLACK
_0x8067.Text = plr.Name
_0x8067.TextColor3 = _0x6147.WHITE
_0x8067.Font = Enum.Font.GothamBold
_0x8067.TextSize = 12
_0x8067.AutoButtonColor = false
_0x8067.ZIndex = 12
_0x8067.Parent = _0x36DB
_0xAA96(_0x8067, 6)
_0x53D7(_0x8067, _0x6147.WHITE, 1, 0.5)
_0x8067.MouseButton1Click:Connect(function()
_0xE43C.Text = plr.Name
_0xE43C.TextColor3 = _0x6147.WHITE
onPick(plr)
_0x76F8()
end)
end
if _0xAB68 == 0 then
local _0xBDCA = Instance.new("TextLabel")
_0xBDCA.Size = UDim2.new(1, -8, 0, _0x7106)
_0xBDCA.BackgroundTransparency = 1
_0xBDCA.Text ="No players"_0xBDCA.TextColor3 = _0x6147.DIM
_0xBDCA.Font = Enum.Font.GothamBold
_0xBDCA.TextSize = 12
_0xBDCA.ZIndex = 12
_0xBDCA.Parent = _0x36DB
_0xAB68 = 1
end
local _0xBD44 = math.min(_0xAB68, _0xE971) * (_0x7106 + 3) + 8
local _0xCF25 = _0xAB68 * (_0x7106 + 3) + 8
_0xA23B.Size = UDim2.new(1, -6, 0, _0x87DA + _0xBD44)
_0x36DB.Size = UDim2.new(1, 0, 0, _0xBD44)
_0x36DB.CanvasSize = UDim2.new(0, 0, 0, _0xCF25)
_0x36DB.Visible = true
end
_0xE43C.MouseButton1Click:Connect(function()
if _0xE23B then
_0x76F8()
else
_0xE23B = true
_0x7663()
end
end)_0xE40D.PlayerAdded:Connect(function()
if _0xE23B then _0x7663() end
end)
_0xE40D.PlayerRemoving:Connect(function()
if _0xE23B then task.wait(0.1) _0x7663() end
end)
return _0xA23B
endlocal _0x574A = _0xB8A6()
local _0x1025
local _0xC9F8, _0xC296 = _0x9CD1(_0x574A,"Enable Speed", function(v)
_0x15B6.SpeedOn = v
if v and _0xF642.Character then
local _0xDCDC = _0xF642.Character:FindFirstChildOfClass("Humanoid")
if _0xDCDC then _0xDCDC.WalkSpeed = _0x15B6.SpeedVal end
end
end)
_0x1025 = _0xC296
_0x9C19(_0x574A,"Speed 1 - 500", 1, 500, 16, function(v)
_0x15B6.SpeedVal = v
if _0x15B6.SpeedOn and _0xF642.Character then
local _0xDCDC = _0xF642.Character:FindFirstChildOfClass("Humanoid")
if _0xDCDC then _0xDCDC.WalkSpeed = v end
end
end)_0xF642.CharacterAdded:Connect(function()
task.wait(0.1)
if _0x15B6.SpeedOn and _0x1025 then
_0x1025(false)
end
_0x15B6.SpeedOn = false
end)local _0x45EB = _0xB8A6()
_0x9CD1(_0x45EB,"ESP Players", function(v) _0x15B6.ESPP = v end)
_0x9CD1(_0x45EB,"ESP NPCs", function(v) _0x15B6.ESPN = v end)
_0x9CD1(_0x45EB,"ESP Hitbox", function(v) _0x15B6.ESPHit = v end)
local function _0xD62E(_0xF529)
local _0x8713 = _0xC275[_0xF529]
if not _0x8713 then return end
if _0x8713.hl then _0x8713.hl:Destroy() end
if _0x8713.bb then _0x8713.bb:Destroy() end
_0xC275[_0xF529] = nil
end
local function _0x4467(_0xF529, _0xF201)
if _0xC275[_0xF529] then return end
local _0x283C = _0xF529:FindFirstChild("HumanoidRootPart")
local _0xA28A = _0xF529:FindFirstChildOfClass("Humanoid")
if not _0x283C or not _0xA28A then return end
local _0xF0BD = Instance.new("Highlight")
_0xF0BD.Name ="TP_ESP"_0xF0BD.Adornee = _0xF529
_0xF0BD.FillColor = _0x6147.WHITE
_0xF0BD.OutlineColor = _0x6147.BLACK
_0xF0BD.FillTransparency = 0.4
_0xF0BD.OutlineTransparency = 0
_0xF0BD.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
_0xF0BD.Parent = _0xB921
local _0x4D54 = Instance.new("BillboardGui")
_0x4D54.Name ="TP_BB"_0x4D54.Adornee = _0x283C
_0x4D54.Size = UDim2.fromOffset(170, 46)
_0x4D54.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
_0x4D54.AlwaysOnTop = true
_0x4D54.Parent = _0xB921
local _0x34AF = Instance.new("TextLabel")
_0x34AF.Size = UDim2.new(1, 0, 0, 16)
_0x34AF.BackgroundTransparency = 1
_0x34AF.Text = (_0xF201 and _0xF529.Name or ("NPC ".. _0xF529.Name))
_0x34AF.TextColor3 = _0x6147.WHITE
_0x34AF.TextStrokeTransparency = 0
_0x34AF.TextStrokeColor3 = _0x6147.BLACK
_0x34AF.Font = Enum.Font.GothamBlack
_0x34AF.TextSize = 12
_0x34AF.Parent = _0x4D54
local _0xCCDF = Instance.new("Frame")
_0xCCDF.Size = UDim2.new(0, 110, 0, 7)
_0xCCDF.Position = UDim2.new(0.5, -55, 0, 18)
_0xCCDF.BackgroundColor3 = _0x6147.BLACK
_0xCCDF.BorderSizePixel = 0
_0xCCDF.Parent = _0x4D54
_0xAA96(_0xCCDF, 4)
_0x53D7(_0xCCDF, _0x6147.WHITE, 1, 0)
local _0xB5D9 = Instance.new("Frame")
_0xB5D9.Size = UDim2.new(1, 0, 1, 0)
_0xB5D9.BackgroundColor3 = _0x6147.WHITE
_0xB5D9.BorderSizePixel = 0
_0xB5D9.Parent = _0xCCDF
_0xAA96(_0xB5D9, 4)
local _0xAC00 = Instance.new("TextLabel")
_0xAC00.Size = UDim2.new(1, 0, 0, 14)
_0xAC00.Position = UDim2.new(0, 0, 0, 28)
_0xAC00.BackgroundTransparency = 1
_0xAC00.Text ="0m"_0xAC00.TextColor3 = _0x6147.WHITE
_0xAC00.TextStrokeTransparency = 0
_0xAC00.TextStrokeColor3 = _0x6147.BLACK
_0xAC00.Font = Enum.Font.GothamBlack
_0xAC00.TextSize = 11
_0xAC00.Parent = _0x4D54
_0xC275[_0xF529] = {
_0xF0BD = _0xF0BD, _0x4D54 = _0x4D54, _0xA28A = _0xA28A, _0x283C = _0x283C,
_0xB5D9 = _0xB5D9, _0xAC00 = _0xAC00,
player = _0xF201 and _0xE40D:GetPlayerFromCharacter(_0xF529) or nil,
}
end
local function _0x21FE()
local _0xF1EA = {}
if _0x15B6.ESPP then
for _0xC9F8, _0x2079 in ipairs(_0xE40D:GetPlayers()) do
if _0x2079 ~= _0xF642 and _0x2079.Character then
_0xF1EA[_0x2079.Character] = true
end
end
end
if _0x15B6.ESPN then
for _0xC9F8, _0xF640 in ipairs(workspace:GetChildren()) do
if _0xF640:IsA("Model") and _0xF640:FindFirstChildOfClass("Humanoid") then
local _0x9A4C = false
for _0xC9F8, _0x2079 in ipairs(_0xE40D:GetPlayers()) do
if _0x2079.Character == _0xF640 then _0x9A4C = true break end
end
if not _0x9A4C then _0xF1EA[_0xF640] ="npc"end
end
end
end
for _0xF529 in pairs(_0xC275) do
if not _0xF1EA[_0xF529] or not _0xF529.Parent then _0xD62E(_0xF529) end
end
for _0xF529, kind in pairs(_0xF1EA) do
local _0xF201 = (kind ~="npc")
if not _0xC275[_0xF529] then _0x4467(_0xF529, _0xF201) end
local _0x8713 = _0xC275[_0xF529]
if _0x8713 and _0x8713.hum and _0x8713.hrp then
local _0x6740 = math.clamp(_0x8713.hum.Health / math.max(_0x8713.hum.MaxHealth, 1), 0, 1)
_0x8713.hpFill.Size = UDim2.new(_0x6740, 0, 1, 0)
_0x8713.hpFill.BackgroundColor3 = Color3.fromRGB(
80 + 175 * _0x6740, 80 + 175 * _0x6740, 80 + 175 * _0x6740
)
local _0x31E4 = _0xF642.Character
local _0xE003 = _0x31E4 and _0x31E4:FindFirstChild("HumanoidRootPart")
if _0xE003 then
local _0xF862 = (_0x8713.hrp.Position - _0xE003.Position).Magnitude
_0x8713.distLbl.Text = string.format("%d m", math.floor(_0xF862))
end
_0x8713.hl.FillColor = _0x6147.WHITE
_0x8713.hl.OutlineColor = _0x6147.BLACK
end
end
if not _0x15B6.ESPHit then
for pl in pairs(_0x1FED) do
local _0x8713 = _0x1FED[pl]
if _0x8713 and _0x8713.adornment then _0x8713.adornment:Destroy() end
_0x1FED[pl] = nil
end
else
for pl, _0x8713 in pairs(_0x1FED) do
if not pl.Parent then
if _0x8713.adornment then _0x8713.adornment:Destroy() end
_0x1FED[pl] = nil
else
local _0xF529 = pl.Character
local _0x283C = _0xF529 and _0xF529:FindFirstChild("HumanoidRootPart")
local _0xA28A = _0xF529 and _0xF529:FindFirstChildOfClass("Humanoid")
if not _0x283C or not _0xA28A or _0xA28A.Health <= 0 or _0x8713.hrp ~= _0x283C then
if _0x8713.adornment then _0x8713.adornment:Destroy() end
_0x1FED[pl] = nil
end
end
end
for _0xC9F8, pl in ipairs(_0xE40D:GetPlayers()) do
local _0xF529 = pl.Character
if _0xF529 then
local _0x283C = _0xF529:FindFirstChild("HumanoidRootPart")
local _0xA28A = _0xF529:FindFirstChildOfClass("Humanoid")
if _0x283C and _0xA28A and _0xA28A.Health > 0 and not _0x1FED[pl] then
local _0x2D2A = Instance.new("BoxHandleAdornment")
_0x2D2A.Adornee = _0x283C
_0x2D2A.AlwaysOnTop = true
_0x2D2A.ZIndex = 5
_0x2D2A.Size = _0x283C.Size
_0x2D2A.Color3 = _0x6147.WHITE
_0x2D2A.Transparency = 0.5
_0x2D2A.Parent = _0xB921
_0x1FED[pl] = {adornment = _0x2D2A, _0x283C = _0x283C}
end
end
end
end
endlocal _0x6170 = _0xB8A6()
_0x9CD1(_0x6170,"Noclip walk through walls", function(v) _0x15B6.Noclip = v end)
local function _0x37A1()
if not _0x15B6.Noclip then return end
local _0xF529 = _0xF642.Character
if not _0xF529 then return end
for _0xC9F8, _0x2079 in ipairs(_0xF529:GetDescendants()) do
if _0x2079:IsA("BasePart") then _0x2079.CanCollide = false end
end
endlocal _0x1AF9 = _0xB8A6()
_0x38DC(_0x1AF9,"Target player:", function(_0x2079)
_0x15B6.TeleTarget = _0x2079
end)
local _0x2312 = Instance.new("TextButton")
_0x2312.Size = UDim2.new(1, -6, 0, 40)
_0x2312.BackgroundColor3 = _0x6147.WHITE
_0x2312.Text ="Select Teleport Mode"_0x2312.TextColor3 = _0x6147.BLACK
_0x2312.Font = Enum.Font.GothamBlack
_0x2312.TextSize = 13
_0x2312.AutoButtonColor = false
_0x2312.ZIndex = 6
_0x2312.Parent = _0x1AF9
_0xAA96(_0x2312, 8)
_0x53D7(_0x2312, _0x6147.WHITE, 1, 0)
local _0xAB55 = Instance.new("Frame")
_0xAB55.Size = UDim2.new(1, -6, 0, 0)
_0xAB55.BackgroundColor3 = _0x6147.PANEL
_0xAB55.BorderSizePixel = 0
_0xAB55.ClipsDescendants = true
_0xAB55.Visible = false
_0xAB55.ZIndex = 20
_0xAB55.Parent = _0x1AF9
_0xAA96(_0xAB55, 8)
_0x53D7(_0xAB55, _0x6147.WHITE, 1, 0)
local _0x9FCC = Instance.new("UIListLayout", _0xAB55)
_0x9FCC.Padding = UDim.new(0, 6)
_0x9FCC.SortOrder = Enum.SortOrder.LayoutOrder
local _0x9F07 = Instance.new("UIPadding", _0xAB55)
_0x9F07.PaddingLeft = UDim.new(0, 6)
_0x9F07.PaddingRight = UDim.new(0, 6)
_0x9F07.PaddingTop = UDim.new(0, 6)
_0x9F07.PaddingBottom = UDim.new(0, 6)
local _0x68D3 = false
local _0x2671 = 140
local function _0x3913()
_0x68D3 = false
local _0xFC66 = _0xE81E:Create(_0xAB55, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(1, -6, 0, 0)
})
_0xFC66:Play()
_0xFC66.Completed:Connect(function()
_0xAB55.Visible = false
end)
end
local function _0x5DD9(offset)
local _0xFC66 = _0x15B6.TeleTarget
if not _0xFC66 or not _0xFC66.Character then return end
local _0x5EFF = _0xFC66.Character:FindFirstChild("HumanoidRootPart")
local _0xC4DF = _0xF642.Character and _0xF642.Character:FindFirstChild("HumanoidRootPart")
if _0x5EFF and _0xC4DF then
_0xC4DF.CFrame = _0x5EFF.CFrame * offset
end
end
local function _0x29C0(text, offset)
local _0x1BE9 = Instance.new("TextButton")
_0x1BE9.Size = UDim2.new(1, 0, 0, 36)
_0x1BE9.BackgroundColor3 = _0x6147.BLACK
_0x1BE9.Text = text
_0x1BE9.TextColor3 = _0x6147.WHITE
_0x1BE9.Font = Enum.Font.GothamBold
_0x1BE9.TextSize = 13
_0x1BE9.AutoButtonColor = false
_0x1BE9.ZIndex = 22
_0x1BE9.Parent = _0xAB55
_0xAA96(_0x1BE9, 6)
_0x53D7(_0x1BE9, _0x6147.WHITE, 1, 0.5)
_0x1BE9.MouseEnter:Connect(function()
_0xE81E:Create(_0x1BE9, TweenInfo.new(0.15), {
BackgroundColor3 = _0x6147.WHITE, TextColor3 = _0x6147.BLACK
}):Play()
end)
_0x1BE9.MouseLeave:Connect(function()
_0xE81E:Create(_0x1BE9, TweenInfo.new(0.15), {
BackgroundColor3 = _0x6147.BLACK, TextColor3 = _0x6147.WHITE
}):Play()
end)
_0x1BE9.MouseButton1Click:Connect(function()
_0x5DD9(offset)
_0x3913()
end)
return _0x1BE9
end
_0x29C0("Front", CFrame.new(0, 0, -3))
_0x29C0("Behind", CFrame.new(0, 0, 3))
_0x29C0("Above Head", CFrame.new(0, 5, 0))
local function _0xA4D2()
_0x68D3 = true
_0xAB55.Visible = true
_0xAB55.Size = UDim2.new(1, -6, 0, 0)
_0xE81E:Create(_0xAB55, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, -6, 0, _0x2671)
}):Play()
end
_0x2312.MouseButton1Click:Connect(function()
if _0x68D3 then _0x3913() else _0xA4D2() end
end)local _0x4CA8 = _0xB8A6()
_0x38DC(_0x4CA8,"Target player:", function(_0x2079)
_0x15B6.AsTarget = _0x2079
end)
_0x9CD1(_0x4CA8,"Assassinate", function(v)
_0x15B6.Assassin = v
end)
_0x9C19(_0x4CA8,"Assassin Distance", 2, 30, 3, function(v)
_0x15B6.AssassinDist = v
end)
_0x9CD1(_0x4CA8,"Auto Neck Hit", function(v)
_0x15B6.AutoNeck = v
end)
_0x9C19(_0x4CA8,"Hit Range", 5, 100, 15, function(v)
_0x15B6.HitRange = v
end)
_0x9C19(_0x4CA8,"Hit Delay (ms)", 50, 1000, 100, function(v)
_0x15B6.HitDelay = v / 1000
end, true)
_0x3BAD(_0x4CA8,"Distance: stand-behind gap | Delay: swing speed", _0x6147.DIM)
local function _0xE6EC()
if not _0x15B6.Assassin or not _0x15B6.AsTarget or not _0x15B6.AsTarget.Character then return end
local _0x7D49 = _0x15B6.AsTarget.Character:FindFirstChild("HumanoidRootPart")
if not _0x7D49 then return end
local _0xE06D = _0xF642.Character
if not _0xE06D then return end
local _0xDCDC = _0xE06D:FindFirstChild("HumanoidRootPart")
if not _0xDCDC then return end
local _0x6E70 = _0x7D49.CFrame * CFrame.new(0, 0, _0x15B6.AssassinDist)
_0xDCDC.CFrame = CFrame.new(_0x6E70.Position, _0x6E70.Position + _0x7D49.CFrame.LookVector)
end
local function _0xD3EF(_0xF529)
if not _0xF529 then return nil end
return _0xF529:FindFirstChild("Head") or _0xF529:FindFirstChild("UpperTorso") or _0xF529:FindFirstChild("Torso")
end
local function _0x2BDE()
if not _0x15B6.AutoNeck or not _0x15B6.AsTarget or not _0x15B6.AsTarget.Character then return end
local _0x31E4 = _0xF642.Character
if not _0x31E4 then return end
local _0x6414 = _0x31E4:FindFirstChildOfClass("Humanoid")
local _0xE003 = _0x31E4:FindFirstChild("HumanoidRootPart")
if not _0x6414 or not _0xE003 then return end
local _0xDADC = _0xD3EF(_0x15B6.AsTarget.Character)
if not _0xDADC then return end
if tick() - _0x6E56 < _0x15B6.HitDelay then return end
_0x6E56 = tick()
local _0x2470 = _0xDADC.Position
local _0x2B2B = _0xE003.Position - _0x2470
if _0x2B2B.Magnitude < 0.1 then _0x2B2B = Vector3.new(0, 0, 1) end
_0x2B2B = _0x2B2B.Unit
local _0x6112 = _0x2470 + _0x2B2B * 1.5
_0xE003.CFrame = CFrame.new(_0x6112, _0x2470)
local _0xF640 = _0xF642:GetMouse()
if _0xF640 then
pcall(function() _0xF640.Target = _0xDADC end)
pcall(function() _0xF640.Hit = CFrame.new(_0x2470) end)
end
local _0xDA91 = _0x31E4:FindFirstChildOfClass("Tool") or (_0xF642.Backpack and _0xF642.Backpack:FindFirstChildOfClass("Tool"))
if _0xDA91 then
if _0xDA91.Parent ~= _0x31E4 then
pcall(function() _0x6414:EquipTool(_0xDA91) end)
task.wait(0.03)
end
pcall(function() _0xDA91:Activate() end)
end
endlocal _0x34A0 = {
{btn = _0x9B9D("SPEED"), page = _0x574A},
{btn = _0x9B9D("ESP"), page = _0x45EB},
{btn = _0x9B9D("NOCLIP"), page = _0x6170},
{btn = _0x9B9D("TELEPORT"), page = _0x1AF9},
{btn = _0x9B9D("ASSASSIN"), page = _0x4CA8},
}
local function _0x56EC(idx)
for i, _0xFC66 in ipairs(_0x34A0) do
local _0xD5D0 = (i == idx)
_0xFC66.page.Visible = _0xD5D0
_0xE81E:Create(_0xFC66.btn, TweenInfo.new(0.15), {
BackgroundColor3 = _0xD5D0 and _0x6147.WHITE or _0x6147.BLACK,
TextColor3 = _0xD5D0 and _0x6147.BLACK or _0x6147.DIM,
}):Play()
end
end
for i, _0xFC66 in ipairs(_0x34A0) do
_0xFC66.btn.MouseButton1Click:Connect(function() _0x56EC(i) end)
end
_0x56EC(1)local function _0x79BD()
_0x6E8A.Visible = true
_0x6E8A.Size = UDim2.fromOffset(440, 500)
_0x6E8A.BackgroundTransparency = 1
_0xE81E:Create(_0x6E8A, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.fromOffset(460, 520),
BackgroundTransparency = 0,
}):Play()
end
local function _0x8308()
local _0xFC66 = _0xE81E:Create(_0x6E8A, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.fromOffset(440, 500),
BackgroundTransparency = 1,
})
_0xFC66:Play()
_0xFC66.Completed:Connect(function()
_0x6E8A.Visible = false
_0x6E8A.BackgroundTransparency = 0
_0x6E8A.Size = UDim2.fromOffset(460, 520)
end)
endlocal _0xC4E4 = Instance.new("TextButton")
_0xC4E4.Name ="TPButton"_0xC4E4.Size = UDim2.fromOffset(64, 64)
_0xC4E4.Position = UDim2.new(0, 24, 0.5, -32)
_0xC4E4.BackgroundColor3 = _0x6147.BLACK
_0xC4E4.Text =""_0xC4E4.AutoButtonColor = false
_0xC4E4.Active = true
_0xC4E4.Visible = false
_0xC4E4.ZIndex = 10
_0xC4E4.Parent = _0xB921
_0xAA96(_0xC4E4, 32)
_0xAFAA(_0xC4E4, Color3.fromRGB(30,30,32), Color3.fromRGB(0,0,0), 135)
local _0xEF94 = _0x53D7(_0xC4E4, _0x6147.WHITE, 2, 0)
local _0x9F8C = Instance.new("Frame", _0xC4E4)
_0x9F8C.Size = UDim2.new(1, 8, 1, 8)
_0x9F8C.Position = UDim2.new(0, -4, 0, -4)
_0x9F8C.BackgroundTransparency = 1
_0x9F8C.ZIndex = _0xC4E4.ZIndex - 1
_0xAA96(_0x9F8C, 40)
_0x53D7(_0x9F8C, _0x6147.WHITE, 1, 0.7)
local _0xB5C7 = Instance.new("TextLabel")
_0xB5C7.Size = UDim2.fromScale(1, 1)
_0xB5C7.BackgroundTransparency = 1
_0xB5C7.Text ="TP"_0xB5C7.TextColor3 = _0x6147.WHITE
_0xB5C7.Font = Enum.Font.GothamBlack
_0xB5C7.TextSize = 24
_0xB5C7.ZIndex = _0xC4E4.ZIndex + 1
_0xB5C7.Parent = _0xC4E4
local _0x90BE = Instance.new("UIStroke", _0xB5C7)
_0x90BE.Color = _0x6147.WHITE
_0x90BE.Thickness = 1
_0xAFAA(_0xB5C7, _0x6147.WHITE, Color3.fromRGB(150,150,155), 90)
task.spawn(function()
while _0xC4E4.Parent do
local _0x7D7B = _0xE81E:Create(_0xEF94, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
Transparency = 0.7, Thickness = 3
})
local _0x8276 = _0xE81E:Create(_0xEF94, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
Transparency = 0, Thickness = 2
})
_0x7D7B:Play(); _0x7D7B.Completed:Wait(); _0x8276:Play(); _0x8276.Completed:Wait()
end
end)
_0x0A4A(_0xC4E4)
_0xC4E4.MouseButton1Click:Connect(function()
if _0x6E8A.Visible then _0x8308() else _0x79BD() end
end)
_0x58B7.MouseButton1Click:Connect(function()
_0x8308()
end)table.insert(_0xDA0B, _0xFC1F.Heartbeat:Connect(function()
_0x37A1()
_0xE6EC()
_0x2BDE()
end))
table.insert(_0xDA0B, _0xFC1F.RenderStepped:Connect(function()
_0x21FE()
end))_0xB921.AncestryChanged:Connect(function(_0xC9F8, parent)
if not parent then
for _0xC9F8, _0xE06D in ipairs(_0xDA0B) do _0xE06D:Disconnect() end
end
end)local _0x21FB = false
local function _0x7A90()
_0x21FB = true
local _0xFC66 = _0xE81E:Create(_0xEF70, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.fromOffset(300, 220),
BackgroundTransparency = 1,
})
_0xFC66:Play()
_0xFC66.Completed:Connect(function()
_0xEF70.Visible = false
_0xC4E4.Visible = true
_0x79BD()
end)
end
local function _0xCE01()
_0xA720.Text ="Wrong key"_0xA720.TextColor3 = Color3.fromRGB(255, 100, 100)
_0x57E4()
task.wait(1.5)
_0xA720.Text =""end
local function _0xA00D()
if _0x21FB then return end
local _0xA153 = _0x51FD.Text
if _0xA153 == _0x634A then
_0xA720.Text ="Correct!"_0xA720.TextColor3 = _0x6147.WHITE
_0x7A90()
else
_0xCE01()
end
end
_0x964D.MouseButton1Click:Connect(_0xA00D)
_0x51FD.FocusLost:Connect(function(enterPressed)
if enterPressed then _0xA00D() end
end)