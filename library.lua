-- Save this script as "Library.lua" inside your executor's workspace folder.

local u1 = nil
local u2 = 10

task.spawn(function()
    while wait() do
        u1 = Color3.fromHSV(tick() % u2 / u2, 1, 1)
    end
end)

local u3 = Color3.fromHSV(tick() % math.random(5) / math.random(5), 1, 1)
local u4 = {
    flags = {},
    windows = {},
    open = true,
    IsClose = false,
}
local _TweenService = game:GetService('TweenService')
local _UserInputService = game:GetService('UserInputService')
local u7 = nil
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil

local function u15(p12)
    local v13 = p12.Position - u9
    local v14 = u10.Y.Offset + v13.Y < -36 and -36 or u10.Y.Offset + v13.Y

    u11:TweenPosition(UDim2.new(u10.X.Scale, u10.X.Offset + v13.X, u10.Y.Scale, v14), 'Out', 'Quint', 0.1, true)
end

function u4.Create(_, p16, p17)
    local v18 = (typeof(p17) ~= 'table' or not p17) and {} or p17
    local v19 = Instance.new(p16)
    local v20 = next
    local v21 = nil

    while true do
        local v22

        v21, v22 = v20(v18, v21)

        if v21 == nil then
            break
        end

        v19[v21] = v22
    end

    return v19
end

local u23 = 0

local function u39(p24, p25, p26, p27)
    local u28 = p27 and 34 or 40

    if string.find(getgenv().identifyexecutor() or '', 'Fluxus') then
        u23 = 75
    end

    p26.main = u4:Create('ImageButton', {
        LayoutOrder = p27 and (p26.position or 0) or 0,
        Position = UDim2.new(0, u23 + 20 + 250 * (p26.position or 0), 0, 20),
        Size = UDim2.new(0, 230, 0, u28),
        BackgroundTransparency = 1,
        Image = 'rbxassetid://3570695787',
        ImageColor3 = Color3.fromRGB(20, 20, 20),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100, 100, 100, 100),
        SliceScale = 0.04,
        ClipsDescendants = true,
        Parent = p25,
    })

    local u29

    if p27 then
        u29 = nil
    else
        u29 = u4:Create('ImageLabel', {
            Size = UDim2.new(1, 0, 0, u28),
            BackgroundTransparency = 1,
            Image = 'rbxassetid://3570695787',
            ImageColor3 = p26.open and (p27 and Color3.fromRGB(16, 16, 16) or Color3.fromRGB(10, 10, 10)) or (p27 and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(6, 6, 6)),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(100, 100, 100, 100),
            SliceScale = 0.04,
            Parent = p26.main,
        })
    end

    local _TextLabel = u4:Create('TextLabel', {
        Size = UDim2.new(1, 0, 0, u28),
        BackgroundTransparency = p27 and 0 or 1,
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BorderSizePixel = 0,
        Text = p24,
        TextSize = p27 and 16 or 17,
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = p26.main,
    })
    local _Frame = u4:Create('Frame', {
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(-1, 0, 1, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        Parent = _TextLabel,
    })
    local _ImageLabel = u4:Create('ImageLabel', {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, -u28 - 10, 1, -u28 - 10),
        Rotation = p26.open and 90 or 180,
        BackgroundTransparency = 1,
        Image = 'rbxassetid://4918373417',
        ImageColor3 = p26.open and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(30, 30, 30),
        ScaleType = Enum.ScaleType.Fit,
        Parent = _Frame,
    })

    p26.content = u4:Create('Frame', {
        Position = UDim2.new(0, 0, 0, u28),
        Size = UDim2.new(1, 0, 1, -u28),
        BackgroundTransparency = 1,
        Parent = p26.main,
    })

    local _UIListLayout = u4:Create('UIListLayout', {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = p26.content,
    })

    _UIListLayout.Changed:connect(function()
        p26.content.Size = UDim2.new(1, 0, 0, _UIListLayout.AbsoluteContentSize.Y)
        p26.main.Size = #p26.options > 0 and (p26.open and UDim2.new(0, 230, 0, _UIListLayout.AbsoluteContentSize.Y + u28)) or UDim2.new(0, 230, 0, u28)
    end)

    if not p27 then
        u4:Create('UIPadding', {
            Parent = p26.content,
        })
        _TextLabel.InputBegan:connect(function(p34)
            if p34.UserInputType == Enum.UserInputType.MouseButton1 or p34.UserInputType == Enum.UserInputType.Touch then
                u11 = p26.main
                u7 = true
                u9 = p34.Position
                u10 = u11.Position
            end
        end)
        _TextLabel.InputChanged:connect(function(p35)
            if u7 and (p35.UserInputType == Enum.UserInputType.MouseMovement or p35.UserInputType == Enum.UserInputType.Touch) then
                u8 = p35
            end
        end)
        _TextLabel.InputEnded:connect(function(p36)
            if p36.UserInputType == Enum.UserInputType.MouseButton1 or p36.UserInputType == Enum.UserInputType.Touch then
                u7 = false
            end
        end)
    end

    _Frame.InputBegan:Connect(function(p37)
        if p37.UserInputType == Enum.UserInputType.MouseButton1 or p37.UserInputType == Enum.UserInputType.Touch then
            p26.open = not p26.open

            _TweenService:Create(_ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Rotation = p26.open and 90 or 180,
                ImageColor3 = p26.open and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(30, 30, 30),
            }):Play()

            if p27 then
                _TweenService:Create(_TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = p26.open and Color3.fromRGB(16, 16, 16) or Color3.fromRGB(10, 10, 10),
                }):Play()
            else
                _TweenService:Create(u29, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = p26.open and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(6, 6, 6),
                }):Play()
            end

            p26.main:TweenSize((#p26.options > 0 and p26.open and true or false) and UDim2.new(0, 230, 0, _UIListLayout.AbsoluteContentSize.Y + u28) or UDim2.new(0, 230, 0, u28), 'Out', 'Quad', 0.2, true)
        end
    end)

    function p26.SetTitle(_, p38)
        _TextLabel.Text = tostring(p38)
    end

    task.spawn(function()
        while task.wait() do
            _TextLabel.TextColor3 = u1 or Color3.fromHSV(tick() % u2 / u2, 1, 1)
        end
    end)

    return p26
end

local function u49(p40, p41)
    local _TextLabel2 = u4:Create('TextLabel', {
        ZIndex = 2,
        LayoutOrder = p40.position,
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundTransparency = 1,
        Text = ' ' .. p40.text,
        TextSize = p40.textsize,
        Font = Enum.Font.Gotham,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Parent = p41.content,
    })
    local _ImageLabel2 = u4:Create('ImageLabel', {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, -12, 1, -10),
        BackgroundTransparency = 1,
        Image = 'rbxassetid://3570695787',
        ImageColor3 = Color3.fromRGB(40, 40, 40),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100, 100, 100, 100),
        SliceScale = 0.02,
        Parent = _TextLabel2,
    })
    local u44 = nil
    local u45 = nil

    _TextLabel2.InputBegan:connect(function(p46)
        if p46.UserInputType == Enum.UserInputType.MouseButton1 or p46.UserInputType == Enum.UserInputType.Touch then
            u4.flags[p40.flag] = true
            u45 = true

            local v47 = {ImageColor3 = u3}

            _TweenService:Create(_ImageLabel2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v47):Play()
            p40.callback()
        end
        if p46.UserInputType == Enum.UserInputType.MouseMovement or p46.UserInputType == Enum.UserInputType.Touch then
            u44 = true

            _TweenService:Create(_ImageLabel2, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageColor3 = Color3.fromRGB(60, 60, 60),
            }):Play()
        end
    end)
    _TextLabel2.InputEnded:connect(function(p48)
        if p48.UserInputType == Enum.UserInputType.MouseButton1 or p48.UserInputType == Enum.UserInputType.Touch then
            u45 = false

            if u44 then
                _TweenService:Create(_ImageLabel2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = Color3.fromRGB(60, 60, 60),
                }):Play()
            else
                _TweenService:Create(_ImageLabel2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = Color3.fromRGB(40, 40, 40),
                }):Play()
            end
        end
        if p48.UserInputType == Enum.UserInputType.MouseMovement or p48.UserInputType == Enum.UserInputType.Touch then
            u44 = false

            if not u45 then
                _TweenService:Create(_ImageLabel2, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = Color3.fromRGB(40, 40, 40),
                }):Play()
            end
        end
    end)
end

local function u64(p50, p51)
    local _Frame2 = u4:Create('Frame', {
        LayoutOrder = p50.position,
        Size = UDim2.new(1, 0, 0, 52),
        BackgroundTransparency = 1,
        Parent = p51.content,
    })
    local _ImageLabel3 = u4:Create('ImageLabel', {
        Position = UDim2.new(0, 6, 0, 4),
        Size = UDim2.new(1, -12, 1, -10),
        BackgroundTransparency = 1,
        Image = 'rbxassetid://3570695787',
        ImageColor3 = Color3.fromRGB(60, 60, 60),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100, 100, 100, 100),
        SliceScale = 0.02,
        Parent = _Frame2,
    })

    u4:Create('ImageLabel', {
        Position = UDim2.new(0, 8, 0, 6),
        Size = UDim2.new(1, -16, 1, -14),
        BackgroundTransparency = 1,
        Image = 'rbxassetid://3570695787',
        ImageColor3 = Color3.fromRGB(20, 20, 20),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(100, 100, 100, 100),
        SliceScale = 0.01,
        Parent = _Frame2,
    })
    u4:Create('TextLabel', {
        Position = UDim2.new(0, 12, 0, 8),
        Size = UDim2.new(1, -24, 0, 14),
        BackgroundTransparency = 1,
        Text = p50.text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.fromRGB(100, 100, 100),
        Parent = _Frame2,
    })

    local _TextBox = u4:Create('TextBox', {
        Position = UDim2.new(0, 12, 0, 20),
        Size = UDim2.new(1, -24, 0, 24),
        BackgroundTransparency = 1,
        Text = p50.value,
        TextSize = 18,
        Font = Enum.Font.Gotham,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextWrapped = true,
        Parent = _Frame2,
    })
    local u55 = nil
    local u56 = nil

    _Frame2.InputBegan:connect(function(p57)
        if (p57.UserInputType == Enum.UserInputType.MouseButton1 or p57.UserInputType == Enum.UserInputType.Touch) and not u56 then
            _TextBox:CaptureFocus()
        end
        if p57.UserInputType == Enum.UserInputType.MouseMovement or p57.UserInputType == Enum.UserInputType.Touch then
            u55 = true

            if not u56 then
                _TweenService:Create(_ImageLabel3, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = Color3.fromRGB(100, 100, 100),
                }):Play()
            end
        end
    end)
    _Frame2.InputEnded:connect(function(p58)
        if p58.UserInputType == Enum.UserInputType.MouseMovement or p58.UserInputType == Enum.UserInputType.Touch then
            u55 = false

            if not u56 then
                _TweenService:Create(_ImageLabel3, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageColor3 = Color3.fromRGB(60, 60, 60),
                }):Play()
            end
        end
    end)
    _TextBox.Focused:connect(function()
        u56 = true

        local v59 = {ImageColor3 = u3}

        _TweenService:Create(_ImageLabel3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v59):Play()
    end)
    _TextBox.FocusLost:connect(function(p60)
        u56 = false

        _TweenService:Create(_ImageLabel3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageColor3 = Color3.fromRGB(60, 60, 60),
        }):Play()
        p50:SetValue(_TextBox.Text, p60)
    end)

    function p50.SetValue(p61, p62, p63)
        u4.flags[p61.flag] = tostring(p62)
        p61.value = tostring(p62)
        _TextBox.Text = p61.value

        p61.callback(p62, p63)
    end
end

local function u70(p65, _)
    local v66 = next
    local _options = p65.options
    local v68 = nil

    while true do
        local v69

        v68, v69 = v66(_options, v68)

        if v68 == nil then
            break
        end
        if v69.type ~= 'button' then
            if v69.type ~= 'box' then
                if v69.type == 'folder' then
                    v69:init()
                end
            else
                u64(v69, p65)
            end
        else
            u49(v69, p65)
        end
    end
end

local function u78(p71)
    function p71.AddButton(p72, p73)
        local v74 = (typeof(p73) ~= 'table' or not p73) and {} or p73

        v74.text = tostring(v74.text)
        v74.textsize = tonumber(v74.textsize) and (v74.textsize or 17) or 17
        v74.callback = typeof(v74.callback) ~= 'function' and function() end or (v74.callback or function() end)
        v74.type = 'button'
        v74.position = #p72.options
        v74.flag = v74.flag or v74.text

        table.insert(p72.options, v74)

        return v74
    end
    function p71.AddBox(p75, p76)
        local v77 = (typeof(p76) ~= 'table' or not p76) and {} or p76

        v77.text = tostring(v77.text)
        v77.value = tostring(v77.value or '')
        v77.callback = typeof(v77.callback) ~= 'function' and function() end or (v77.callback or function() end)
        v77.type = 'box'
        v77.position = #p75.options
        v77.flag = v77.flag or v77.text
        u4.flags[v77.flag] = v77.value

        table.insert(p75.options, v77)

        return v77
    end
end

function u4.CreateWindow(p79, p80, p81)
    local v82 = {
        title = tostring(p80),
        options = {},
        open = p81 or true,
        canInit = true,
        init = false,
        position = #p79.windows,
    }

    u78(v82)
    table.insert(u4.windows, v82)

    return v82
end

function u4.Init(p83)
    p83.base = p83.base or p83:Create('ScreenGui')
    p83.base.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    p83.base.Name = "StandaloneUILibrary"
    p83.base.DisplayOrder = 999999

    local v84 = next
    local _windows = p83.windows
    local v86 = nil

    while true do
        local v87

        v86, v87 = v84(_windows, v86)

        if v86 == nil then
            break
        end
        if v87.canInit and not v87.init then
            v87.init = true

            u39(v87.title, p83.base, v87)
            u70(v87)
        end
    end
end

function u4.Close(p88)
    p88.open = not p88.open
    u4.IsClose = not p88.open

    if p88.activePopup then
        p88.activePopup:Close()
    end

    local v89 = next
    local _windows2 = p88.windows
    local v91 = nil

    while true do
        local v92

        v91, v92 = v89(_windows2, v91)

        if v91 == nil then
            break
        end
        if v92.main then
            v92.main.Visible = p88.open
        end
    end
end

_UserInputService.InputBegan:connect(function(p93)
    if p93.UserInputType == Enum.UserInputType.MouseButton1 or p93.UserInputType == Enum.UserInputType.Touch then
        if u4.activePopup and (p93.Position.X < u4.activePopup.mainHolder.AbsolutePosition.X or p93.Position.Y < u4.activePopup.mainHolder.AbsolutePosition.Y) then
            u4.activePopup:Close()
        end
        if u4.activePopup and (p93.Position.X > u4.activePopup.mainHolder.AbsolutePosition.X + u4.activePopup.mainHolder.AbsoluteSize.X or p93.Position.Y > u4.activePopup.mainHolder.AbsolutePosition.Y + u4.activePopup.mainHolder.AbsoluteSize.Y) then
            u4.activePopup:Close()
        end
    end
end)

_UserInputService.InputChanged:connect(function(p94)
    if (p94.UserInputType == Enum.UserInputType.MouseMovement or p94.UserInputType == Enum.UserInputType.Touch) and u4.cursor then
        local v95 = _UserInputService:GetMouseLocation() + Vector2.new(0, -36)

        u4.cursor.Position = UDim2.new(0, v95.X - 2, 0, v95.Y - 2)
    end
    if p94 == u8 and u7 then
        u15(p94)
    end
end)

return u4
