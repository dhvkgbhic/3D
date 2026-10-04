--==========================================
-- ⭐️星喵~ 密钥验证 UI (验证通过后执行指定脚本)
-- 密钥: dhvk666
--==========================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if _G.__StarMeowKeyCleanup then
    pcall(_G.__StarMeowKeyCleanup)
    _G.__StarMeowKeyCleanup = nil
end

-- ========================================================
-- ★★★ 验证成功后执行的脚本 ★★★
-- ========================================================
local function runNextScript()
    print("[⭐️星喵] 验证通过，正在加载脚本...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dhvkgbhic/3D/refs/heads/main/script"))()
    print("[⭐️星喵] 脚本加载完成 ✔")
end
-- ========================================================

-- ===== 1. 创建 ScreenGui =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StarMeowKeyGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- ===== 2. 主容器 =====
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 260)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 200, 120)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

-- ===== 3. 标题 =====
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 20, 0, 15)
title.BackgroundTransparency = 1
title.Text = "🔐 脚本密钥验证"
title.TextColor3 = Color3.fromRGB(0, 255, 150)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- ===== 4. 副标题 =====
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -40, 0, 20)
subtitle.Position = UDim2.new(0, 20, 0, 50)
subtitle.BackgroundTransparency = 1
subtitle.Text = "请输入密钥后点击验证"
subtitle.TextColor3 = Color3.fromRGB(130, 130, 140)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = mainFrame

-- ===== 5. 输入框 =====
local textBox = Instance.new("TextBox")
textBox.Name = "TextBox"
textBox.Size = UDim2.new(1, -40, 0, 42)
textBox.Position = UDim2.new(0, 20, 0, 80)
textBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
textBox.BorderSizePixel = 0
textBox.Text = ""
textBox.PlaceholderText = "在此输入密钥..."
textBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.ClearTextOnFocus = false
textBox.Parent = mainFrame

local tbCorner = Instance.new("UICorner")
tbCorner.CornerRadius = UDim.new(0, 8)
tbCorner.Parent = textBox

local tbStroke = Instance.new("UIStroke")
tbStroke.Color = Color3.fromRGB(60, 60, 70)
tbStroke.Thickness = 1
tbStroke.Parent = textBox

-- ===== 6. 验证按钮 =====
local button = Instance.new("TextButton")
button.Name = "VerifyButton"
button.Size = UDim2.new(1, -40, 0, 42)
button.Position = UDim2.new(0, 20, 0, 135)
button.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
button.BorderSizePixel = 0
button.Text = "验证"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.AutoButtonColor = false
button.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(0, 255, 150)
btnStroke.Thickness = 1
btnStroke.Transparency = 0.4
btnStroke.Parent = button

button.MouseEnter:Connect(function()
    if button.Active then button.BackgroundColor3 = Color3.fromRGB(0, 180, 100) end
end)
button.MouseLeave:Connect(function()
    if button.Active then button.BackgroundColor3 = Color3.fromRGB(0, 150, 80) end
end)

-- ===== 7. 状态栏 =====
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -40, 0, 24)
statusLabel.Position = UDim2.new(0, 20, 0, 190)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "等待输入..."
statusLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = mainFrame

-- ===== 8. 关闭按钮 =====
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -38, 0, 15)
closeBtn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.AutoButtonColor = false
closeBtn.Parent = mainFrame

local cbCorner = Instance.new("UICorner")
cbCorner.CornerRadius = UDim.new(0, 6)
cbCorner.Parent = closeBtn

-- ===== 9. 核心逻辑 =====
local CORRECT_KEY = "dhvk666"
local isVerifying = false
local isVerified = false

local function setStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color
end

local function shakeFrame()
    local originalPos = mainFrame.Position
    for i = 1, 3 do
        mainFrame.Position = originalPos + UDim2.new(0, 8, 0, 0)
        task.wait(0.05)
        mainFrame.Position = originalPos - UDim2.new(0, 8, 0, 0)
        task.wait(0.05)
    end
    mainFrame.Position = originalPos
end

local function doVerify()
    if isVerifying or isVerified then return end

    local inputKey = textBox.Text
    if inputKey == "" then
        setStatus("⚠ 请输入密钥", Color3.fromRGB(248, 113, 113))
        return
    end

    isVerifying = true
    setStatus("⏳ 验证中...", Color3.fromRGB(113, 113, 122))
    button.Text = "验证中..."
    button.Active = false
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    btnStroke.Color = Color3.fromRGB(100, 100, 110)

    task.wait(1)

    if inputKey == CORRECT_KEY then
        isVerified = true
        setStatus("✔ 验证通过", Color3.fromRGB(74, 222, 128))
        button.Text = "成功"
        button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        btnStroke.Color = Color3.fromRGB(74, 222, 128)

        task.wait(1)

        -- ★★★ 验证通过后执行脚本 ★★★
        pcall(runNextScript)

        task.wait(0.5)

        -- 隐藏验证界面
        screenGui.Enabled = false
    else
        isVerifying = false
        setStatus("✖ 密钥无效，请重试", Color3.fromRGB(248, 113, 113))
        button.Text = "验证"
        button.Active = true
        button.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
        btnStroke.Color = Color3.fromRGB(0, 255, 150)
        shakeFrame()
    end
end

local clickConn = button.MouseButton1Click:Connect(doVerify)

local focusConn = textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        doVerify()
    end
end)

local closeConn = closeBtn.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

-- ===== 10. 清理函数 =====
_G.__StarMeowKeyCleanup = function()
    _G.__StarMeowKeyCleanup = nil
    if clickConn then clickConn:Disconnect() end
    if focusConn then focusConn:Disconnect() end
    if closeConn then closeConn:Disconnect() end
    if screenGui and screenGui.Parent then screenGui:Destroy() end
    print("[⭐️星喵密钥] 已关闭")
end

print("[⭐️星喵密钥] UI 已加载，输入密钥: dhvk666 即可通过验证并加载脚本。")