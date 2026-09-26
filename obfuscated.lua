local _0x882C = game:GetService("Players")
local _0xF7FC = game:GetService("RunService")
local _0xF686 = game:GetService("UserInputService")
local _0x9EEF = game:GetService("TweenService")
local _0x7CA2 = _0x882C.LocalPlayer
local _0x020B = workspace.CurrentCamera
for _0xE85E,n in ipairs({"ThaiPhanHubUI"}) do
local _0x5AFE = game.CoreGui:FindFirstChild(n)
if _0x5AFE then _0x5AFE:Destroy() end
endlocal _0xEBB0 ="ThaiPhanDepTraiSo1"local _0x1DCE ="https://discord.gg/rW6X2jszJc"local _0x4996 = {
BG = Color3.fromRGB(8, 8, 10),
PANEL = Color3.fromRGB(16, 16, 18),
DIM = Color3.fromRGB(140, 140, 150),
TEXT = Color3.fromRGB(240, 240, 245),
WHITE = Color3.fromRGB(255, 255, 255),
BLACK = Color3.fromRGB(0, 0, 0),
}local _0x7FAC = {
SpeedOn = false, SpeedVal = 16,
ESPP = false, ESPN = false, ESPHit = false,
Noclip = false,
TeleTarget = nil,
AsTarget = nil,
Assassin = false, AssassinDist = 3,
AutoNeck = false, HitRange = 15, HitDelay = 0.1,
}
local _0x6907 = {}
local _0xC1C8 = {}
local _0x81C9 = {}
local _0xC6C5 = 0local _0x5E4F = Instance.new("ScreenGui")
_0x5E4F.Name ="ThaiPhanHubUI"_0x5E4F.ResetOnSpawn = false
_0x5E4F.IgnoreGuiInset = true
_0x5E4F.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0x5E4F.Parent = game.CoreGuilocal function _0x794D(frame, handle)
handle = handle or frame
local _0x78E7, _0xF935, _0xE1A0 = false, nil, nil
handle.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x78E7 = true
_0xF935 = i.Position
_0xE1A0 = frame.Position
i.Changed:Connect(function()
if i.UserInputState == Enum.UserInputState.End then
_0x78E7 = false
end
end)
end
end)
_0xF686.InputChanged:Connect(function(i)
if _0x78E7 and (i.UserInputType == Enum.UserInputType.MouseMovement
or i.UserInputType == Enum.UserInputType.Touch) then
local _0x8A9E = i.Position - _0xF935
frame.Position = UDim2.new(
_0xE1A0.X.Scale, _0xE1A0.X.Offset + _0x8A9E.X,
_0xE1A0.Y.Scale, _0xE1A0.Y.Offset + _0x8A9E.Y
)
end
end)
end
local function _0x656B(parent, color, thickness, transparency)
local _0xC544 = Instance.new("UIStroke", parent)
_0xC544.Color = color or _0x4996.WHITE
_0xC544.Thickness = thickness or 1
_0xC544.Transparency = transparency or 0
_0xC544.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
return _0xC544
end
local function _0xCCE3(parent, r)
local _0xB551 = Instance.new("UICorner", parent)
_0xB551.CornerRadius = UDim.new(0, r or 10)
return _0xB551
end
local function _0x9DEB(parent, c1, c2, rot)
local _0x2192 = Instance.new("UIGradient", parent)
_0x2192.Color = ColorSequence.new(c1, c2)
_0x2192.Rotation = rot or 90
return _0x2192
endlocal _0xA123 = Instance.new("Frame")
_0xA123.Name ="KeySystem"_0xA123.Size = UDim2.fromOffset(360, 260)
_0xA123.Position = UDim2.new(0.5, -180, 0.5, -130)
_0xA123.BackgroundColor3 = _0x4996.BG
_0xA123.BorderSizePixel = 0
_0xA123.Active = true
_0xA123.ZIndex = 100
_0xA123.Parent = _0x5E4F
_0xCCE3(_0xA123, 14)
_0x9DEB(_0xA123, Color3.fromRGB(14,14,16), Color3.fromRGB(4,4,6), 90)
_0x656B(_0xA123, _0x4996.WHITE, 1.5, 0)
local _0x781A = Instance.new("TextLabel")
_0x781A.Size = UDim2.new(1, -20, 0, 40)
_0x781A.Position = UDim2.fromOffset(10, 14)
_0x781A.BackgroundTransparency = 1
_0x781A.Text ="ThaiPhanHub"_0x781A.TextColor3 = _0x4996.WHITE
_0x781A.Font = Enum.Font.GothamBlack
_0x781A.TextSize = 20
_0x781A.ZIndex = 101
_0x781A.Parent = _0xA123
_0x9DEB(_0x781A, _0x4996.WHITE, Color3.fromRGB(170,170,175), 90)
local _0x7254 = Instance.new("UIStroke", _0x781A)
_0x7254.Color = _0x4996.WHITE
_0x7254.Thickness = 1
_0x7254.Transparency = 0.6
local _0x6509 = Instance.new("TextLabel")
_0x6509.Size = UDim2.new(1, -20, 0, 20)
_0x6509.Position = UDim2.fromOffset(10, 52)
_0x6509.BackgroundTransparency = 1
_0x6509.Text ="Enter key to continue"_0x6509.TextColor3 = _0x4996.DIM
_0x6509.Font = Enum.Font.GothamBold
_0x6509.TextSize = 12
_0x6509.ZIndex = 101
_0x6509.Parent = _0xA123
local _0x0823 = Instance.new("TextBox")
_0x0823.Size = UDim2.new(1, -40, 0, 40)
_0x0823.Position = UDim2.new(0, 20, 0, 84)
_0x0823.BackgroundColor3 = _0x4996.BLACK
_0x0823.Text =""_0x0823.PlaceholderText ="Enter key..."_0x0823.PlaceholderColor3 = _0x4996.DIM
_0x0823.TextColor3 = _0x4996.WHITE
_0x0823.Font = Enum.Font.GothamBold
_0x0823.TextSize = 14
_0x0823.ClearTextOnFocus = false
_0x0823.ZIndex = 101
_0x0823.Parent = _0xA123
_0xCCE3(_0x0823, 8)
_0x656B(_0x0823, _0x4996.WHITE, 1, 0.4)
local _0x80DC = Instance.new("TextButton")
_0x80DC.Size = UDim2.new(1, -40, 0, 40)
_0x80DC.Position = UDim2.new(0, 20, 0, 134)
_0x80DC.BackgroundColor3 = _0x4996.WHITE
_0x80DC.Text ="Submit"_0x80DC.TextColor3 = _0x4996.BLACK
_0x80DC.Font = Enum.Font.GothamBlack
_0x80DC.TextSize = 14
_0x80DC.AutoButtonColor = false
_0x80DC.ZIndex = 101
_0x80DC.Parent = _0xA123
_0xCCE3(_0x80DC, 8)
_0x656B(_0x80DC, _0x4996.WHITE, 1, 0)
local _0x62BB = Instance.new("TextLabel")
_0x62BB.Size = UDim2.new(1, -40, 0, 18)
_0x62BB.Position = UDim2.new(0, 20, 0, 178)
_0x62BB.BackgroundTransparency = 1
_0x62BB.Text =""_0x62BB.TextColor3 = _0x4996.WHITE
_0x62BB.Font = Enum.Font.GothamBold
_0x62BB.TextSize = 12
_0x62BB.ZIndex = 101
_0x62BB.Parent = _0xA123
local _0x36D7 = Instance.new("TextButton")
_0x36D7.Size = UDim2.new(1, -40, 0, 34)
_0x36D7.Position = UDim2.new(0, 20, 1, -50)
_0x36D7.BackgroundColor3 = _0x4996.BLACK
_0x36D7.Text ="Join Discord"_0x36D7.TextColor3 = _0x4996.WHITE
_0x36D7.Font = Enum.Font.GothamBlack
_0x36D7.TextSize = 13
_0x36D7.AutoButtonColor = false
_0x36D7.ZIndex = 101
_0x36D7.Parent = _0xA123
_0xCCE3(_0x36D7, 8)
_0x656B(_0x36D7, _0x4996.WHITE, 1, 0)
_0x36D7.MouseEnter:Connect(function()
_0x9EEF:Create(_0x36D7, TweenInfo.new(0.15), {
BackgroundColor3 = _0x4996.WHITE, TextColor3 = _0x4996.BLACK
}):Play()
end)
_0x36D7.MouseLeave:Connect(function()
_0x9EEF:Create(_0x36D7, TweenInfo.new(0.15), {
BackgroundColor3 = _0x4996.BLACK, TextColor3 = _0x4996.WHITE
}):Play()
end)
_0x36D7.MouseButton1Click:Connect(function()
pcall(function()
game:GetService("GuiService"):OpenBrowserWindow(_0x1DCE)
end)
end)
_0x794D(_0xA123, _0x781A)
local function _0x8956()
local _0x8ABD = _0x0823.Position
for i = 1, 4 do
_0x9EEF:Create(_0x0823, TweenInfo.new(0.05), {
Position = _0x8ABD + UDim2.fromOffset(i % 2 == 0 and 8 or -8, 0)
}):Play()
task.wait(0.05)
end
_0x9EEF:Create(_0x0823, TweenInfo.new(0.08), {Position = _0x8ABD}):Play()
endlocal _0x890E = Instance.new("Frame")
_0x890E.Name ="Menu"_0x890E.Size = UDim2.fromOffset(460, 520)
_0x890E.Position = UDim2.new(0.5, -230, 0.5, -260)
_0x890E.BackgroundColor3 = _0x4996.BG
_0x890E.BorderSizePixel = 0
_0x890E.Visible = false
_0x890E.Active = true
_0x890E.ZIndex = 5
_0x890E.Parent = _0x5E4F
_0xCCE3(_0x890E, 14)
_0x9DEB(_0x890E, Color3.fromRGB(14,14,16), Color3.fromRGB(4,4,6), 90)
_0x656B(_0x890E, _0x4996.WHITE, 1.5, 0)
local _0x5EC9 = Instance.new("Frame")
_0x5EC9.Size = UDim2.new(1, 0, 0, 46)
_0x5EC9.BackgroundColor3 = _0x4996.PANEL
_0x5EC9.BorderSizePixel = 0
_0x5EC9.Active = true
_0x5EC9.ZIndex = 6
_0x5EC9.Parent = _0x890E
_0xCCE3(_0x5EC9, 14)
local _0x4434 = Instance.new("Frame", _0x5EC9)
_0x4434.Size = UDim2.new(1, 0, 0, 14)
_0x4434.Position = UDim2.new(0, 0, 1, -14)
_0x4434.BackgroundColor3 = _0x4996.PANEL
_0x4434.BorderSizePixel = 0
_0x4434.ZIndex = 6
_0x9DEB(_0x5EC9, Color3.fromRGB(28,28,30), Color3.fromRGB(14,14,16), 90)
local _0x85AD = Instance.new("TextLabel")
_0x85AD.Size = UDim2.new(1, -60, 1, 0)
_0x85AD.Position = UDim2.fromOffset(18, 0)
_0x85AD.BackgroundTransparency = 1
_0x85AD.Text ="ThaiPhanHub"_0x85AD.TextColor3 = _0x4996.WHITE
_0x85AD.Font = Enum.Font.GothamBlack
_0x85AD.TextSize = 16
_0x85AD.TextXAlignment = Enum.TextXAlignment.Left
_0x85AD.ZIndex = 7
_0x85AD.Parent = _0x5EC9
local _0xD82C = Instance.new("UIStroke", _0x85AD)
_0xD82C.Color = _0x4996.WHITE
_0xD82C.Thickness = 1
_0xD82C.Transparency = 0.6
_0x9DEB(_0x85AD, _0x4996.WHITE, Color3.fromRGB(170,170,175), 90)
local _0x3B67 = Instance.new("TextLabel")
_0x3B67.Size = UDim2.fromOffset(38, 22)
_0x3B67.Position = UDim2.new(1, -84, 0.5, -11)
_0x3B67.BackgroundColor3 = _0x4996.BLACK
_0x3B67.Text ="TP"_0x3B67.TextColor3 = _0x4996.WHITE
_0x3B67.Font = Enum.Font.GothamBlack
_0x3B67.TextSize = 13
_0x3B67.ZIndex = 7
_0x3B67.Parent = _0x5EC9
_0xCCE3(_0x3B67, 6)
_0x656B(_0x3B67, _0x4996.WHITE, 1, 0)
local _0x6AD7 = Instance.new("TextButton")
_0x6AD7.Size = UDim2.fromOffset(30, 30)
_0x6AD7.Position = UDim2.new(1, -38, 0.5, -15)
_0x6AD7.BackgroundColor3 = _0x4996.BLACK
_0x6AD7.Text ="x"_0x6AD7.TextColor3 = _0x4996.WHITE
_0x6AD7.Font = Enum.Font.GothamBold
_0x6AD7.TextSize = 18
_0x6AD7.AutoButtonColor = false
_0x6AD7.ZIndex = 7
_0x6AD7.Parent = _0x5EC9
_0xCCE3(_0x6AD7, 15)
_0x656B(_0x6AD7, _0x4996.WHITE, 1, 0)
_0x6AD7.MouseEnter:Connect(function()
_0x9EEF:Create(_0x6AD7, TweenInfo.new(0.15), {BackgroundColor3 = _0x4996.WHITE}):Play()
_0x9EEF:Create(_0x6AD7, TweenInfo.new(0.15), {TextColor3 = _0x4996.BLACK}):Play()
end)
_0x6AD7.MouseLeave:Connect(function()
_0x9EEF:Create(_0x6AD7, TweenInfo.new(0.15), {BackgroundColor3 = _0x4996.BLACK}):Play()
_0x9EEF:Create(_0x6AD7, TweenInfo.new(0.15), {TextColor3 = _0x4996.WHITE}):Play()
end)
_0x794D(_0x890E, _0x5EC9)
local _0xE740 = Instance.new("Frame")
_0xE740.Size = UDim2.new(1, -20, 0, 34)
_0xE740.Position = UDim2.fromOffset(10, 54)
_0xE740.BackgroundTransparency = 1
_0xE740.ZIndex = 6
_0xE740.Parent = _0x890E
local _0x413B = Instance.new("UIListLayout", _0xE740)
_0x413B.FillDirection = Enum.FillDirection.Horizontal
_0x413B.Padding = UDim.new(0, 5)
_0x413B.SortOrder = Enum.SortOrder.LayoutOrder
local _0xCC03 = Instance.new("Frame")
_0xCC03.Size = UDim2.new(1, -20, 0, 1)
_0xCC03.Position = UDim2.fromOffset(10, 94)
_0xCC03.BackgroundColor3 = _0x4996.WHITE
_0xCC03.BackgroundTransparency = 0.75
_0xCC03.BorderSizePixel = 0
_0xCC03.ZIndex = 6
_0xCC03.Parent = _0x890E
local _0x28C1 = Instance.new("Frame")
_0x28C1.Size = UDim2.new(1, -20, 1, -108)
_0x28C1.Position = UDim2.fromOffset(10, 100)
_0x28C1.BackgroundTransparency = 1
_0x28C1.ZIndex = 6
_0x28C1.Parent = _0x890Elocal function _0x4653(parent, text, callback)
local _0xB2D2 = Instance.new("Frame")
_0xB2D2.Size = UDim2.new(1, -6, 0, 40)
_0xB2D2.BackgroundColor3 = _0x4996.PANEL
_0xB2D2.BorderSizePixel = 0
_0xB2D2.ZIndex = 6
_0xB2D2.Parent = parent
_0xCCE3(_0xB2D2, 8)
_0x656B(_0xB2D2, _0x4996.WHITE, 1, 0.85)
local _0xB573 = Instance.new("TextLabel")
_0xB573.Size = UDim2.new(1, -70, 1, 0)
_0xB573.Position = UDim2.fromOffset(14, 0)
_0xB573.BackgroundTransparency = 1
_0xB573.Text = text
_0xB573.TextColor3 = _0x4996.TEXT
_0xB573.Font = Enum.Font.GothamBold
_0xB573.TextSize = 13
_0xB573.TextXAlignment = Enum.TextXAlignment.Left
_0xB573.ZIndex = 7
_0xB573.Parent = _0xB2D2
local _0x6A30 = Instance.new("TextButton")
_0x6A30.Size = UDim2.fromOffset(50, 24)
_0x6A30.Position = UDim2.new(1, -62, 0.5, -12)
_0x6A30.BackgroundColor3 = _0x4996.BLACK
_0x6A30.Text =""_0x6A30.AutoButtonColor = false
_0x6A30.ZIndex = 7
_0x6A30.Parent = _0xB2D2
_0xCCE3(_0x6A30, 12)
_0x656B(_0x6A30, _0x4996.WHITE, 1, 0.5)
local _0x7B52 = Instance.new("Frame")
_0x7B52.Size = UDim2.fromOffset(18, 18)
_0x7B52.Position = UDim2.fromOffset(3, 3)
_0x7B52.BackgroundColor3 = _0x4996.WHITE
_0x7B52.ZIndex = 8
_0x7B52.Parent = _0x6A30
_0xCCE3(_0x7B52, 9)
local _0x4405 = false
local function _0xC3E3(v)
_0x4405 = v
_0x9EEF:Create(_0x7B52, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
Position = v and UDim2.fromOffset(29, 3) or UDim2.fromOffset(3, 3),
BackgroundColor3 = v and _0x4996.BLACK or _0x4996.WHITE,
}):Play()
_0x9EEF:Create(_0x6A30, TweenInfo.new(0.18), {
BackgroundColor3 = v and _0x4996.WHITE or _0x4996.BLACK,
}):Play()
callback(v)
end
_0x6A30.MouseButton1Click:Connect(function() _0xC3E3(not _0x4405) end)
return _0xB2D2, _0xC3E3
end
local function _0x3E9A(parent, text, min, max, def, callback, isFloat)
local _0xB2D2 = Instance.new("Frame")
_0xB2D2.Size = UDim2.new(1, -6, 0, 64)
_0xB2D2.BackgroundColor3 = _0x4996.PANEL
_0xB2D2.BorderSizePixel = 0
_0xB2D2.ZIndex = 6
_0xB2D2.Parent = parent
_0xCCE3(_0xB2D2, 8)
_0x656B(_0xB2D2, _0x4996.WHITE, 1, 0.85)
local _0xB573 = Instance.new("TextLabel")
_0xB573.Size = UDim2.new(1, -100, 0, 24)
_0xB573.Position = UDim2.fromOffset(14, 6)
_0xB573.BackgroundTransparency = 1
_0xB573.Text = text
_0xB573.TextColor3 = _0x4996.TEXT
_0xB573.Font = Enum.Font.GothamBold
_0xB573.TextSize = 13
_0xB573.TextXAlignment = Enum.TextXAlignment.Left
_0xB573.ZIndex = 7
_0xB573.Parent = _0xB2D2
local _0xDA2B = Instance.new("TextLabel")
_0xDA2B.Size = UDim2.fromOffset(70, 24)
_0xDA2B.Position = UDim2.new(1, -82, 0, 6)
_0xDA2B.BackgroundTransparency = 1
_0xDA2B.Text = tostring(def)
_0xDA2B.TextColor3 = _0x4996.WHITE
_0xDA2B.Font = Enum.Font.GothamBlack
_0xDA2B.TextSize = 13
_0xDA2B.TextXAlignment = Enum.TextXAlignment.Right
_0xDA2B.ZIndex = 7
_0xDA2B.Parent = _0xB2D2
local _0xFF5F = Instance.new("Frame")
_0xFF5F.Size = UDim2.new(1, -28, 0, 8)
_0xFF5F.Position = UDim2.new(0, 14, 1, -20)
_0xFF5F.BackgroundColor3 = _0x4996.BLACK
_0xFF5F.BorderSizePixel = 0
_0xFF5F.ZIndex = 7
_0xFF5F.Parent = _0xB2D2
_0xCCE3(_0xFF5F, 4)
_0x656B(_0xFF5F, _0x4996.WHITE, 1, 0.5)
local _0x1C8A = Instance.new("Frame")
_0x1C8A.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)
_0x1C8A.BackgroundColor3 = _0x4996.WHITE
_0x1C8A.BorderSizePixel = 0
_0x1C8A.ZIndex = 8
_0x1C8A.Parent = _0xFF5F
_0xCCE3(_0x1C8A, 4)
_0x9DEB(_0x1C8A, _0x4996.WHITE, Color3.fromRGB(180,180,180), 0)
local _0x9AF7 = false
local function _0xF11D(v)
v = math.clamp(v, min, max)
_0x1C8A.Size = UDim2.new((v - min) / (max - min), 0, 1, 0)
if isFloat then
_0xDA2B.Text = string.format("%.2f", v)
else
_0xDA2B.Text = tostring(math.floor(v))
end
callback(v)
end
_0xFF5F.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x9AF7 = true
local _0x5813 = (i.Position.X - _0xFF5F.AbsolutePosition.X) / _0xFF5F.AbsoluteSize.X
_0xF11D(min + _0x5813 * (max - min))
end
end)
_0xF686.InputChanged:Connect(function(i)
if _0x9AF7 and (i.UserInputType == Enum.UserInputType.MouseMovement
or i.UserInputType == Enum.UserInputType.Touch) then
local _0x5813 = (i.Position.X - _0xFF5F.AbsolutePosition.X) / _0xFF5F.AbsoluteSize.X
_0xF11D(min + _0x5813 * (max - min))
end
end)
_0xF686.InputEnded:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1
or i.UserInputType == Enum.UserInputType.Touch then
_0x9AF7 = false
end
end)
return _0xB2D2, _0xF11D
end
local function _0x2D1A(parent, text, color)
local _0xB255 = Instance.new("TextLabel")
_0xB255.Size = UDim2.new(1, -6, 0, 22)
_0xB255.BackgroundTransparency = 1
_0xB255.Text = text
_0xB255.TextColor3 = color or _0x4996.DIM
_0xB255.Font = Enum.Font.GothamBold
_0xB255.TextSize = 12
_0xB255.TextXAlignment = Enum.TextXAlignment.Left
_0xB255.TextWrapped = true
_0xB255.ZIndex = 6
_0xB255.Parent = parent
return _0xB255
end
local function _0x9ABE(parent, text, callback, primary, height)
local _0x779C = Instance.new("TextButton")
_0x779C.Size = UDim2.new(1, -6, 0, height or 36)
_0x779C.BackgroundColor3 = primary and _0x4996.WHITE or _0x4996.BLACK
_0x779C.Text = text
_0x779C.TextColor3 = primary and _0x4996.BLACK or _0x4996.WHITE
_0x779C.Font = Enum.Font.GothamBlack
_0x779C.TextSize = 13
_0x779C.AutoButtonColor = false
_0x779C.ZIndex = 6
_0x779C.Parent = parent
_0xCCE3(_0x779C, 8)
_0x656B(_0x779C, _0x4996.WHITE, 1, 0)
_0x779C.MouseEnter:Connect(function()
_0x9EEF:Create(_0x779C, TweenInfo.new(0.15), {
BackgroundColor3 = primary and _0x4996.BLACK or _0x4996.WHITE,
TextColor3 = primary and _0x4996.WHITE or _0x4996.BLACK,
}):Play()
end)
_0x779C.MouseLeave:Connect(function()
_0x9EEF:Create(_0x779C, TweenInfo.new(0.15), {
BackgroundColor3 = primary and _0x4996.WHITE or _0x4996.BLACK,
TextColor3 = primary and _0x4996.BLACK or _0x4996.WHITE,
}):Play()
end)
_0x779C.MouseButton1Click:Connect(callback)
return _0x779C
end
local function _0x5E4B()
local _0xDA0E = Instance.new("ScrollingFrame")
_0xDA0E.Size = UDim2.fromScale(1, 1)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.BorderSizePixel = 0
_0xDA0E.ScrollBarThickness = 4
_0xDA0E.ScrollBarImageColor3 = _0x4996.WHITE
_0xDA0E.ScrollBarImageTransparency = 0.4
_0xDA0E.CanvasSize = UDim2.new(0, 0, 0, 0)
_0xDA0E.AutomaticCanvasSize = Enum.AutomaticSize.Y
_0xDA0E.Visible = false
_0xDA0E.ZIndex = 6
_0xDA0E.Parent = _0x28C1
local _0xD45E = Instance.new("UIListLayout", _0xDA0E)
_0xD45E.Padding = UDim.new(0, 8)
_0xD45E.SortOrder = Enum.SortOrder.LayoutOrder
return _0xDA0E
end
local function _0x7AFE(name)
local _0x4D2F = Instance.new("TextButton")
_0x4D2F.Size = UDim2.fromOffset(78, 34)
_0x4D2F.BackgroundColor3 = _0x4996.BLACK
_0x4D2F.Text = name
_0x4D2F.TextColor3 = _0x4996.DIM
_0x4D2F.Font = Enum.Font.GothamBlack
_0x4D2F.TextSize = 12
_0x4D2F.AutoButtonColor = false
_0x4D2F.ZIndex = 7
_0x4D2F.Parent = _0xE740
_0xCCE3(_0x4D2F, 8)
_0x656B(_0x4D2F, _0x4996.WHITE, 1, 0.6)
return _0x4D2F
endlocal function _0x429E(parent, labelText, onPick)
_0x2D1A(parent, labelText, _0x4996.DIM)
local _0x618B = 28
local _0xCFFD = 5
local _0xBF1B = 36
local _0x07CF = Instance.new("Frame")
_0x07CF.Size = UDim2.new(1, -6, 0, _0xBF1B)
_0x07CF.BackgroundColor3 = _0x4996.BLACK
_0x07CF.BorderSizePixel = 0
_0x07CF.ClipsDescendants = true
_0x07CF.ZIndex = 10
_0x07CF.Parent = parent
_0xCCE3(_0x07CF, 8)
_0x656B(_0x07CF, _0x4996.WHITE, 1, 0)
local _0x0806 = Instance.new("TextButton")
_0x0806.Size = UDim2.new(1, 0, 0, _0xBF1B)
_0x0806.BackgroundTransparency = 1
_0x0806.Text ="Select Player"_0x0806.TextColor3 = _0x4996.WHITE
_0x0806.Font = Enum.Font.GothamBlack
_0x0806.TextSize = 13
_0x0806.AutoButtonColor = false
_0x0806.ZIndex = 11
_0x0806.Parent = _0x07CF
local _0x821E = Instance.new("ScrollingFrame")
_0x821E.Size = UDim2.new(1, 0, 0, 0)
_0x821E.Position = UDim2.new(0, 0, 0, _0xBF1B)
_0x821E.BackgroundColor3 = _0x4996.PANEL
_0x821E.BorderSizePixel = 0
_0x821E.ScrollBarThickness = 4
_0x821E.ScrollBarImageColor3 = _0x4996.WHITE
_0x821E.CanvasSize = UDim2.new(0, 0, 0, 0)
_0x821E.ScrollingDirection = Enum.ScrollingDirection.Y
_0x821E.Visible = false
_0x821E.ZIndex = 11
_0x821E.Parent = _0x07CF
local _0x7B9E = Instance.new("UIListLayout", _0x821E)
_0x7B9E.Padding = UDim.new(0, 3)
_0x7B9E.SortOrder = Enum.SortOrder.LayoutOrder
local _0x2D04 = Instance.new("UIPadding", _0x821E)
_0x2D04.PaddingTop = UDim.new(0, 4)
_0x2D04.PaddingBottom = UDim.new(0, 4)
_0x2D04.PaddingLeft = UDim.new(0, 4)
_0x2D04.PaddingRight = UDim.new(0, 4)
local _0xA82E = false
local function _0x9FFF()
_0xA82E = false
_0x07CF.Size = UDim2.new(1, -6, 0, _0xBF1B)
_0x821E.Size = UDim2.new(1, 0, 0, 0)
_0x821E.Visible = false
end
local function _0xB2BB()
for _0xE85E, ch in ipairs(_0x821E:GetChildren()) do
if ch:IsA("TextButton") then ch:Destroy() end
end
local _0xCBC9 = 0
for _0xE85E, plr in ipairs(_0x882C:GetPlayers()) do
if plr == _0x7CA2 then continue end
_0xCBC9 = _0xCBC9 + 1
local _0x168D = Instance.new("TextButton")
_0x168D.Size = UDim2.new(1, -8, 0, _0x618B)
_0x168D.BackgroundColor3 = _0x4996.BLACK
_0x168D.Text = plr.Name
_0x168D.TextColor3 = _0x4996.WHITE
_0x168D.Font = Enum.Font.GothamBold
_0x168D.TextSize = 12
_0x168D.AutoButtonColor = false
_0x168D.ZIndex = 12
_0x168D.Parent = _0x821E
_0xCCE3(_0x168D, 6)
_0x656B(_0x168D, _0x4996.WHITE, 1, 0.5)
_0x168D.MouseButton1Click:Connect(function()
_0x0806.Text = plr.Name
_0x0806.TextColor3 = _0x4996.WHITE
onPick(plr)
_0x9FFF()
end)
end
if _0xCBC9 == 0 then
local _0x5517 = Instance.new("TextLabel")
_0x5517.Size = UDim2.new(1, -8, 0, _0x618B)
_0x5517.BackgroundTransparency = 1
_0x5517.Text ="No players"_0x5517.TextColor3 = _0x4996.DIM
_0x5517.Font = Enum.Font.GothamBold
_0x5517.TextSize = 12
_0x5517.ZIndex = 12
_0x5517.Parent = _0x821E
_0xCBC9 = 1
end
local _0x0B8C = math.min(_0xCBC9, _0xCFFD) * (_0x618B + 3) + 8
local _0x785C = _0xCBC9 * (_0x618B + 3) + 8
_0x07CF.Size = UDim2.new(1, -6, 0, _0xBF1B + _0x0B8C)
_0x821E.Size = UDim2.new(1, 0, 0, _0x0B8C)
_0x821E.CanvasSize = UDim2.new(0, 0, 0, _0x785C)
_0x821E.Visible = true
end
_0x0806.MouseButton1Click:Connect(function()
if _0xA82E then
_0x9FFF()
else
_0xA82E = true
_0xB2BB()
end
end)_0x882C.PlayerAdded:Connect(function()
if _0xA82E then _0xB2BB() end
end)
_0x882C.PlayerRemoving:Connect(function()
if _0xA82E then task.wait(0.1) _0xB2BB() end
end)
return _0x07CF
endlocal _0x7FD3 = _0x5E4B()
local _0x0ABE
local _0xE85E, _0xD142 = _0x4653(_0x7FD3,"Enable Speed", function(v)
_0x7FAC.SpeedOn = v
if v and _0x7CA2.Character then
local _0x5831 = _0x7CA2.Character:FindFirstChildOfClass("Humanoid")
if _0x5831 then _0x5831.WalkSpeed = _0x7FAC.SpeedVal end
end
end)
_0x0ABE = _0xD142
_0x3E9A(_0x7FD3,"Speed 1 - 500", 1, 500, 16, function(v)
_0x7FAC.SpeedVal = v
if _0x7FAC.SpeedOn and _0x7CA2.Character then
local _0x5831 = _0x7CA2.Character:FindFirstChildOfClass("Humanoid")
if _0x5831 then _0x5831.WalkSpeed = v end
end
end)_0x7CA2.CharacterAdded:Connect(function()
task.wait(0.1)
if _0x7FAC.SpeedOn and _0x0ABE then
_0x0ABE(false)
end
_0x7FAC.SpeedOn = false
end)local _0x5690 = _0x5E4B()
_0x4653(_0x5690,"ESP Players", function(v) _0x7FAC.ESPP = v end)
_0x4653(_0x5690,"ESP NPCs", function(v) _0x7FAC.ESPN = v end)
_0x4653(_0x5690,"ESP Hitbox", function(v) _0x7FAC.ESPHit = v end)
local function _0x9BE9(_0x2BB4)
local _0x8A9E = _0xC1C8[_0x2BB4]
if not _0x8A9E then return end
if _0x8A9E.hl then _0x8A9E.hl:Destroy() end
if _0x8A9E.bb then _0x8A9E.bb:Destroy() end
_0xC1C8[_0x2BB4] = nil
end
local function _0x9D74(_0x2BB4, _0xBAA8)
if _0xC1C8[_0x2BB4] then return end
local _0xEBF0 = _0x2BB4:FindFirstChild("HumanoidRootPart")
local _0xBA20 = _0x2BB4:FindFirstChildOfClass("Humanoid")
if not _0xEBF0 or not _0xBA20 then return end
local _0xC0B1 = Instance.new("Highlight")
_0xC0B1.Name ="TP_ESP"_0xC0B1.Adornee = _0x2BB4
_0xC0B1.FillColor = _0x4996.WHITE
_0xC0B1.OutlineColor = _0x4996.BLACK
_0xC0B1.FillTransparency = 0.4
_0xC0B1.OutlineTransparency = 0
_0xC0B1.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
_0xC0B1.Parent = _0x5E4F
local _0xE0D4 = Instance.new("BillboardGui")
_0xE0D4.Name ="TP_BB"_0xE0D4.Adornee = _0xEBF0
_0xE0D4.Size = UDim2.fromOffset(170, 46)
_0xE0D4.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
_0xE0D4.AlwaysOnTop = true
_0xE0D4.Parent = _0x5E4F
local _0x19B4 = Instance.new("TextLabel")
_0x19B4.Size = UDim2.new(1, 0, 0, 16)
_0x19B4.BackgroundTransparency = 1
_0x19B4.Text = (_0xBAA8 and _0x2BB4.Name or ("NPC ".. _0x2BB4.Name))
_0x19B4.TextColor3 = _0x4996.WHITE
_0x19B4.TextStrokeTransparency = 0
_0x19B4.TextStrokeColor3 = _0x4996.BLACK
_0x19B4.Font = Enum.Font.GothamBlack
_0x19B4.TextSize = 12
_0x19B4.Parent = _0xE0D4
local _0xE818 = Instance.new("Frame")
_0xE818.Size = UDim2.new(0, 110, 0, 7)
_0xE818.Position = UDim2.new(0.5, -55, 0, 18)
_0xE818.BackgroundColor3 = _0x4996.BLACK
_0xE818.BorderSizePixel = 0
_0xE818.Parent = _0xE0D4
_0xCCE3(_0xE818, 4)
_0x656B(_0xE818, _0x4996.WHITE, 1, 0)
local _0x465D = Instance.new("Frame")
_0x465D.Size = UDim2.new(1, 0, 1, 0)
_0x465D.BackgroundColor3 = _0x4996.WHITE
_0x465D.BorderSizePixel = 0
_0x465D.Parent = _0xE818
_0xCCE3(_0x465D, 4)
local _0x932A = Instance.new("TextLabel")
_0x932A.Size = UDim2.new(1, 0, 0, 14)
_0x932A.Position = UDim2.new(0, 0, 0, 28)
_0x932A.BackgroundTransparency = 1
_0x932A.Text ="0m"_0x932A.TextColor3 = _0x4996.WHITE
_0x932A.TextStrokeTransparency = 0
_0x932A.TextStrokeColor3 = _0x4996.BLACK
_0x932A.Font = Enum.Font.GothamBlack
_0x932A.TextSize = 11
_0x932A.Parent = _0xE0D4
_0xC1C8[_0x2BB4] = {
_0xC0B1 = _0xC0B1, _0xE0D4 = _0xE0D4, _0xBA20 = _0xBA20, _0xEBF0 = _0xEBF0,
_0x465D = _0x465D, _0x932A = _0x932A,
player = _0xBAA8 and _0x882C:GetPlayerFromCharacter(_0x2BB4) or nil,
}
end
local function _0x39F6()
local _0x880E = {}
if _0x7FAC.ESPP then
for _0xE85E, _0xDA0E in ipairs(_0x882C:GetPlayers()) do
if _0xDA0E ~= _0x7CA2 and _0xDA0E.Character then
_0x880E[_0xDA0E.Character] = true
end
end
end
if _0x7FAC.ESPN then
for _0xE85E, _0x9211 in ipairs(workspace:GetChildren()) do
if _0x9211:IsA("Model") and _0x9211:FindFirstChildOfClass("Humanoid") then
local _0xBB15 = false
for _0xE85E, _0xDA0E in ipairs(_0x882C:GetPlayers()) do
if _0xDA0E.Character == _0x9211 then _0xBB15 = true break end
end
if not _0xBB15 then _0x880E[_0x9211] ="npc"end
end
end
end
for _0x2BB4 in pairs(_0xC1C8) do
if not _0x880E[_0x2BB4] or not _0x2BB4.Parent then _0x9BE9(_0x2BB4) end
end
for _0x2BB4, kind in pairs(_0x880E) do
local _0xBAA8 = (kind ~="npc")
if not _0xC1C8[_0x2BB4] then _0x9D74(_0x2BB4, _0xBAA8) end
local _0x8A9E = _0xC1C8[_0x2BB4]
if _0x8A9E and _0x8A9E.hum and _0x8A9E.hrp then
local _0x8A70 = math.clamp(_0x8A9E.hum.Health / math.max(_0x8A9E.hum.MaxHealth, 1), 0, 1)
_0x8A9E.hpFill.Size = UDim2.new(_0x8A70, 0, 1, 0)
_0x8A9E.hpFill.BackgroundColor3 = Color3.fromRGB(
80 + 175 * _0x8A70, 80 + 175 * _0x8A70, 80 + 175 * _0x8A70
)
local _0x58BB = _0x7CA2.Character
local _0x2C61 = _0x58BB and _0x58BB:FindFirstChild("HumanoidRootPart")
if _0x2C61 then
local _0x2738 = (_0x8A9E.hrp.Position - _0x2C61.Position).Magnitude
_0x8A9E.distLbl.Text = string.format("%d m", math.floor(_0x2738))
end
_0x8A9E.hl.FillColor = _0x4996.WHITE
_0x8A9E.hl.OutlineColor = _0x4996.BLACK
end
end
if not _0x7FAC.ESPHit then
for pl in pairs(_0x81C9) do
local _0x8A9E = _0x81C9[pl]
if _0x8A9E and _0x8A9E.adornment then _0x8A9E.adornment:Destroy() end
_0x81C9[pl] = nil
end
else
for pl, _0x8A9E in pairs(_0x81C9) do
if not pl.Parent then
if _0x8A9E.adornment then _0x8A9E.adornment:Destroy() end
_0x81C9[pl] = nil
else
local _0x2BB4 = pl.Character
local _0xEBF0 = _0x2BB4 and _0x2BB4:FindFirstChild("HumanoidRootPart")
local _0xBA20 = _0x2BB4 and _0x2BB4:FindFirstChildOfClass("Humanoid")
if not _0xEBF0 or not _0xBA20 or _0xBA20.Health <= 0 or _0x8A9E.hrp ~= _0xEBF0 then
if _0x8A9E.adornment then _0x8A9E.adornment:Destroy() end
_0x81C9[pl] = nil
end
end
end
for _0xE85E, pl in ipairs(_0x882C:GetPlayers()) do
local _0x2BB4 = pl.Character
if _0x2BB4 then
local _0xEBF0 = _0x2BB4:FindFirstChild("HumanoidRootPart")
local _0xBA20 = _0x2BB4:FindFirstChildOfClass("Humanoid")
if _0xEBF0 and _0xBA20 and _0xBA20.Health > 0 and not _0x81C9[pl] then
local _0x6AC8 = Instance.new("BoxHandleAdornment")
_0x6AC8.Adornee = _0xEBF0
_0x6AC8.AlwaysOnTop = true
_0x6AC8.ZIndex = 5
_0x6AC8.Size = _0xEBF0.Size
_0x6AC8.Color3 = _0x4996.WHITE
_0x6AC8.Transparency = 0.5
_0x6AC8.Parent = _0x5E4F
_0x81C9[pl] = {adornment = _0x6AC8, _0xEBF0 = _0xEBF0}
end
end
end
end
endlocal _0x4783 = _0x5E4B()
_0x4653(_0x4783,"Noclip walk through walls", function(v) _0x7FAC.Noclip = v end)
local function _0x8E14()
if not _0x7FAC.Noclip then return end
local _0x2BB4 = _0x7CA2.Character
if not _0x2BB4 then return end
for _0xE85E, _0xDA0E in ipairs(_0x2BB4:GetDescendants()) do
if _0xDA0E:IsA("BasePart") then _0xDA0E.CanCollide = false end
end
endlocal _0xD663 = _0x5E4B()
_0x429E(_0xD663,"Target player:", function(_0xDA0E)
_0x7FAC.TeleTarget = _0xDA0E
end)
local _0xDB65 = Instance.new("TextButton")
_0xDB65.Size = UDim2.new(1, -6, 0, 40)
_0xDB65.BackgroundColor3 = _0x4996.WHITE
_0xDB65.Text ="Select Teleport Mode"_0xDB65.TextColor3 = _0x4996.BLACK
_0xDB65.Font = Enum.Font.GothamBlack
_0xDB65.TextSize = 13
_0xDB65.AutoButtonColor = false
_0xDB65.ZIndex = 6
_0xDB65.Parent = _0xD663
_0xCCE3(_0xDB65, 8)
_0x656B(_0xDB65, _0x4996.WHITE, 1, 0)
local _0x3B22 = Instance.new("Frame")
_0x3B22.Size = UDim2.new(1, -6, 0, 0)
_0x3B22.BackgroundColor3 = _0x4996.PANEL
_0x3B22.BorderSizePixel = 0
_0x3B22.ClipsDescendants = true
_0x3B22.Visible = false
_0x3B22.ZIndex = 20
_0x3B22.Parent = _0xD663
_0xCCE3(_0x3B22, 8)
_0x656B(_0x3B22, _0x4996.WHITE, 1, 0)
local _0x31D8 = Instance.new("UIListLayout", _0x3B22)
_0x31D8.Padding = UDim.new(0, 6)
_0x31D8.SortOrder = Enum.SortOrder.LayoutOrder
local _0x79A2 = Instance.new("UIPadding", _0x3B22)
_0x79A2.PaddingLeft = UDim.new(0, 6)
_0x79A2.PaddingRight = UDim.new(0, 6)
_0x79A2.PaddingTop = UDim.new(0, 6)
_0x79A2.PaddingBottom = UDim.new(0, 6)
local _0x62D8 = false
local _0x3BC5 = 140
local function _0xB1E4()
_0x62D8 = false
local _0x4D2F = _0x9EEF:Create(_0x3B22, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(1, -6, 0, 0)
})
_0x4D2F:Play()
_0x4D2F.Completed:Connect(function()
_0x3B22.Visible = false
end)
end
local function _0xB081(offset)
local _0x4D2F = _0x7FAC.TeleTarget
if not _0x4D2F or not _0x4D2F.Character then return end
local _0xD518 = _0x4D2F.Character:FindFirstChild("HumanoidRootPart")
local _0x6F0E = _0x7CA2.Character and _0x7CA2.Character:FindFirstChild("HumanoidRootPart")
if _0xD518 and _0x6F0E then
_0x6F0E.CFrame = _0xD518.CFrame * offset
end
end
local function _0xA006(text, offset)
local _0x779C = Instance.new("TextButton")
_0x779C.Size = UDim2.new(1, 0, 0, 36)
_0x779C.BackgroundColor3 = _0x4996.BLACK
_0x779C.Text = text
_0x779C.TextColor3 = _0x4996.WHITE
_0x779C.Font = Enum.Font.GothamBold
_0x779C.TextSize = 13
_0x779C.AutoButtonColor = false
_0x779C.ZIndex = 22
_0x779C.Parent = _0x3B22
_0xCCE3(_0x779C, 6)
_0x656B(_0x779C, _0x4996.WHITE, 1, 0.5)
_0x779C.MouseEnter:Connect(function()
_0x9EEF:Create(_0x779C, TweenInfo.new(0.15), {
BackgroundColor3 = _0x4996.WHITE, TextColor3 = _0x4996.BLACK
}):Play()
end)
_0x779C.MouseLeave:Connect(function()
_0x9EEF:Create(_0x779C, TweenInfo.new(0.15), {
BackgroundColor3 = _0x4996.BLACK, TextColor3 = _0x4996.WHITE
}):Play()
end)
_0x779C.MouseButton1Click:Connect(function()
_0xB081(offset)
_0xB1E4()
end)
return _0x779C
end
_0xA006("Front", CFrame.new(0, 0, -3))
_0xA006("Behind", CFrame.new(0, 0, 3))
_0xA006("Above Head", CFrame.new(0, 5, 0))
local function _0x83AA()
_0x62D8 = true
_0x3B22.Visible = true
_0x3B22.Size = UDim2.new(1, -6, 0, 0)
_0x9EEF:Create(_0x3B22, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, -6, 0, _0x3BC5)
}):Play()
end
_0xDB65.MouseButton1Click:Connect(function()
if _0x62D8 then _0xB1E4() else _0x83AA() end
end)local _0xC7C3 = _0x5E4B()
_0x429E(_0xC7C3,"Target player:", function(_0xDA0E)
_0x7FAC.AsTarget = _0xDA0E
end)
_0x4653(_0xC7C3,"Assassinate", function(v)
_0x7FAC.Assassin = v
end)
_0x3E9A(_0xC7C3,"Assassin Distance", 2, 30, 3, function(v)
_0x7FAC.AssassinDist = v
end)
_0x4653(_0xC7C3,"Auto Neck Hit", function(v)
_0x7FAC.AutoNeck = v
end)
_0x3E9A(_0xC7C3,"Hit Range", 5, 100, 15, function(v)
_0x7FAC.HitRange = v
end)
_0x3E9A(_0xC7C3,"Hit Delay (ms)", 50, 1000, 100, function(v)
_0x7FAC.HitDelay = v / 1000
end, true)
_0x2D1A(_0xC7C3,"Distance: stand-behind gap | Delay: swing speed", _0x4996.DIM)
local function _0xD33B()
if not _0x7FAC.Assassin or not _0x7FAC.AsTarget or not _0x7FAC.AsTarget.Character then return end
local _0x6649 = _0x7FAC.AsTarget.Character:FindFirstChild("HumanoidRootPart")
if not _0x6649 then return end
local _0xB551 = _0x7CA2.Character
if not _0xB551 then return end
local _0x5831 = _0xB551:FindFirstChild("HumanoidRootPart")
if not _0x5831 then return end
local _0x1A3E = _0x6649.CFrame * CFrame.new(0, 0, _0x7FAC.AssassinDist)
_0x5831.CFrame = CFrame.new(_0x1A3E.Position, _0x1A3E.Position + _0x6649.CFrame.LookVector)
end
local function _0x00F9(_0x2BB4)
if not _0x2BB4 then return nil end
return _0x2BB4:FindFirstChild("Head") or _0x2BB4:FindFirstChild("UpperTorso") or _0x2BB4:FindFirstChild("Torso")
end
local function _0xA8A7()
if not _0x7FAC.AutoNeck or not _0x7FAC.AsTarget or not _0x7FAC.AsTarget.Character then return end
local _0x58BB = _0x7CA2.Character
if not _0x58BB then return end
local _0xDDB2 = _0x58BB:FindFirstChildOfClass("Humanoid")
local _0x2C61 = _0x58BB:FindFirstChild("HumanoidRootPart")
if not _0xDDB2 or not _0x2C61 then return end
local _0x7C61 = _0x00F9(_0x7FAC.AsTarget.Character)
if not _0x7C61 then return end
if tick() - _0xC6C5 < _0x7FAC.HitDelay then return end
_0xC6C5 = tick()
local _0xC03E = _0x7C61.Position
local _0x5F0E = _0x2C61.Position - _0xC03E
if _0x5F0E.Magnitude < 0.1 then _0x5F0E = Vector3.new(0, 0, 1) end
_0x5F0E = _0x5F0E.Unit
local _0xC03B = _0xC03E + _0x5F0E * 1.5
_0x2C61.CFrame = CFrame.new(_0xC03B, _0xC03E)
local _0x9211 = _0x7CA2:GetMouse()
if _0x9211 then
pcall(function() _0x9211.Target = _0x7C61 end)
pcall(function() _0x9211.Hit = CFrame.new(_0xC03E) end)
end
local _0x492B = _0x58BB:FindFirstChildOfClass("Tool") or (_0x7CA2.Backpack and _0x7CA2.Backpack:FindFirstChildOfClass("Tool"))
if _0x492B then
if _0x492B.Parent ~= _0x58BB then
pcall(function() _0xDDB2:EquipTool(_0x492B) end)
task.wait(0.03)
end
pcall(function() _0x492B:Activate() end)
end
endlocal _0x3C40 = {
{btn = _0x7AFE("SPEED"), page = _0x7FD3},
{btn = _0x7AFE("ESP"), page = _0x5690},
{btn = _0x7AFE("NOCLIP"), page = _0x4783},
{btn = _0x7AFE("TELEPORT"), page = _0xD663},
{btn = _0x7AFE("ASSASSIN"), page = _0xC7C3},
}
local function _0x2A90(idx)
for i, _0x4D2F in ipairs(_0x3C40) do
local _0x1F4F = (i == idx)
_0x4D2F.page.Visible = _0x1F4F
_0x9EEF:Create(_0x4D2F.btn, TweenInfo.new(0.15), {
BackgroundColor3 = _0x1F4F and _0x4996.WHITE or _0x4996.BLACK,
TextColor3 = _0x1F4F and _0x4996.BLACK or _0x4996.DIM,
}):Play()
end
end
for i, _0x4D2F in ipairs(_0x3C40) do
_0x4D2F.btn.MouseButton1Click:Connect(function() _0x2A90(i) end)
end
_0x2A90(1)local function _0x5131()
_0x890E.Visible = true
_0x890E.Size = UDim2.fromOffset(440, 500)
_0x890E.BackgroundTransparency = 1
_0x9EEF:Create(_0x890E, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.fromOffset(460, 520),
BackgroundTransparency = 0,
}):Play()
end
local function _0xA6A5()
local _0x4D2F = _0x9EEF:Create(_0x890E, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.fromOffset(440, 500),
BackgroundTransparency = 1,
})
_0x4D2F:Play()
_0x4D2F.Completed:Connect(function()
_0x890E.Visible = false
_0x890E.BackgroundTransparency = 0
_0x890E.Size = UDim2.fromOffset(460, 520)
end)
endlocal _0xF818 = Instance.new("TextButton")
_0xF818.Name ="TPButton"_0xF818.Size = UDim2.fromOffset(64, 64)
_0xF818.Position = UDim2.new(0, 24, 0.5, -32)
_0xF818.BackgroundColor3 = _0x4996.BLACK
_0xF818.Text =""_0xF818.AutoButtonColor = false
_0xF818.Active = true
_0xF818.Visible = false
_0xF818.ZIndex = 10
_0xF818.Parent = _0x5E4F
_0xCCE3(_0xF818, 32)
_0x9DEB(_0xF818, Color3.fromRGB(30,30,32), Color3.fromRGB(0,0,0), 135)
local _0xA9DF = _0x656B(_0xF818, _0x4996.WHITE, 2, 0)
local _0x1A88 = Instance.new("Frame", _0xF818)
_0x1A88.Size = UDim2.new(1, 8, 1, 8)
_0x1A88.Position = UDim2.new(0, -4, 0, -4)
_0x1A88.BackgroundTransparency = 1
_0x1A88.ZIndex = _0xF818.ZIndex - 1
_0xCCE3(_0x1A88, 40)
_0x656B(_0x1A88, _0x4996.WHITE, 1, 0.7)
local _0x85C4 = Instance.new("TextLabel")
_0x85C4.Size = UDim2.fromScale(1, 1)
_0x85C4.BackgroundTransparency = 1
_0x85C4.Text ="TP"_0x85C4.TextColor3 = _0x4996.WHITE
_0x85C4.Font = Enum.Font.GothamBlack
_0x85C4.TextSize = 24
_0x85C4.ZIndex = _0xF818.ZIndex + 1
_0x85C4.Parent = _0xF818
local _0x4B7E = Instance.new("UIStroke", _0x85C4)
_0x4B7E.Color = _0x4996.WHITE
_0x4B7E.Thickness = 1
_0x9DEB(_0x85C4, _0x4996.WHITE, Color3.fromRGB(150,150,155), 90)
task.spawn(function()
while _0xF818.Parent do
local _0xFEFC = _0x9EEF:Create(_0xA9DF, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
Transparency = 0.7, Thickness = 3
})
local _0x62E5 = _0x9EEF:Create(_0xA9DF, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
Transparency = 0, Thickness = 2
})
_0xFEFC:Play(); _0xFEFC.Completed:Wait(); _0x62E5:Play(); _0x62E5.Completed:Wait()
end
end)
_0x794D(_0xF818)
_0xF818.MouseButton1Click:Connect(function()
if _0x890E.Visible then _0xA6A5() else _0x5131() end
end)
_0x6AD7.MouseButton1Click:Connect(function()
_0xA6A5()
end)table.insert(_0x6907, _0xF7FC.Heartbeat:Connect(function()
_0x8E14()
_0xD33B()
_0xA8A7()
end))
table.insert(_0x6907, _0xF7FC.RenderStepped:Connect(function()
_0x39F6()
end))_0x5E4F.AncestryChanged:Connect(function(_0xE85E, parent)
if not parent then
for _0xE85E, _0xB551 in ipairs(_0x6907) do _0xB551:Disconnect() end
end
end)local _0xAE62 = false
local function _0x09FC()
_0xAE62 = true
local _0x4D2F = _0x9EEF:Create(_0xA123, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.fromOffset(300, 220),
BackgroundTransparency = 1,
})
_0x4D2F:Play()
_0x4D2F.Completed:Connect(function()
_0xA123.Visible = false
_0xF818.Visible = true
_0x5131()
end)
end
local function _0xDF8E()
_0x62BB.Text ="Wrong key"_0x62BB.TextColor3 = Color3.fromRGB(255, 100, 100)
_0x8956()
task.wait(1.5)
_0x62BB.Text =""end
local function _0x9464()
if _0xAE62 then return end
local _0xF2A2 = _0x0823.Text
if _0xF2A2 == _0xEBB0 then
_0x62BB.Text ="Correct!"_0x62BB.TextColor3 = _0x4996.WHITE
_0x09FC()
else
_0xDF8E()
end
end
_0x80DC.MouseButton1Click:Connect(_0x9464)
_0x0823.FocusLost:Connect(function(enterPressed)
if enterPressed then _0x9464() end
end)