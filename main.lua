-- [[ SISTEMA DE SEGURANÇA S7xhub v1.1.2 ]] --
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- OTIMIZAÇÃO DE VARIÁVEIS (Acelera a execução no motor Luau)
local math_floor = math.floor
local math_round = math.round
local math_clamp = math.clamp
local math_rad = math.rad
local string_lower = string.lower
local string_find = string.find
local string_upper = string.upper
local string_sub = string.sub

-- LISTAS DE PERMISSÃO (IDs Autorizados)
local CREATOR_IDS = {2959681, 9216315975, 88189937} 
local ADMIN_IDS_RGB = {1870899605, 7668266040}
local VIP_IDS_BW = {648989434, 9987756245}

local function checkAuth(id)
    for _, v in pairs(CREATOR_IDS) do if v == id then return true end end
    for _, v in pairs(ADMIN_IDS_RGB) do if v == id then return true end end
    for _, v in pairs(VIP_IDS_BW) do if v == id then return true end end
    return false
end

if not checkAuth(player.UserId) then
    warn("S7xhub v1.1.2: ACESSO NEGADO.")
    return 
end

-- [[ INÍCIO DO SCRIPT ]] --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local targetParent = (RunService:IsStudio() or not CoreGui) and player:WaitForChild("PlayerGui") or CoreGui
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local remoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Events"):WaitForChild("RemoteEvent")

-- DETECÇÃO DE PLATAFORMA
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local GROUP_ID = 34157675
local ADMIN_ROLES = {
    ["Marketing"] = true, ["Influencer"] = true, ["Social Mod"] = true, 
    ["Helper"] = true, ["Supervisor"] = true, ["Manager"] = true, 
    ["Contributor"] = true, ["Developer"] = true, ["Owner"] = true
}

local ScreenGui = Instance.new("ScreenGui", targetParent)
ScreenGui.Name = "S7xhub_Panel"
ScreenGui.ResetOnSpawn = false

-----------------------------------------
--- NOTIFICAÇÃO PC (13 SEGUNDOS)
-----------------------------------------
if not isMobile then
    local NotifyFrame = Instance.new("TextLabel", ScreenGui)
    NotifyFrame.Size = UDim2.new(0, 350, 0, 50)
    NotifyFrame.Position = UDim2.new(0.5, -175, 0.1, 0)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyFrame.BackgroundTransparency = 0.2
    NotifyFrame.Text = "USE A LETRA G PARA ABRIR E FECHAR O PAINEL"
    NotifyFrame.TextColor3 = Color3.fromRGB(170, 0, 255)
    NotifyFrame.Font = Enum.Font.GothamBold
    NotifyFrame.TextSize = 14
    Instance.new("UICorner", NotifyFrame)
    Instance.new("UIStroke", NotifyFrame).Color = Color3.fromRGB(170, 0, 255)

    task.spawn(function()
        task.wait(13)
        TweenService:Create(NotifyFrame, TweenInfo.new(1), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        task.wait(1)
        NotifyFrame:Destroy()
    end)
end

-----------------------------------------
--- BOTÃO FLUTUANTE (APENAS MOBILE)
-----------------------------------------
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 45, 0, 45)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -22)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.Text = "S7"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 18
OpenBtn.Visible = isMobile
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
local Stroke = Instance.new("UIStroke", OpenBtn)
Stroke.Color = Color3.fromRGB(170, 0, 255)
Stroke.Thickness = 2

-----------------------------------------
--- LÓGICA DE TAGS DE CABEÇA
-----------------------------------------
local function createOverheadTag(targetPlayer, text, color, mode)
    local char = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")
    if head:FindFirstChild("S7xTag") then head.S7xTag:Destroy() end
    local billboard = Instance.new("BillboardGui", head)
    billboard.Name = "S7xTag"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 120, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 100 
    local label = Instance.new("TextLabel", billboard)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 17
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.4
    if mode == "RGB" then
        task.spawn(function()
            local hue = 0
            while billboard and billboard.Parent do
                hue = hue + (1/200)
                label.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait()
            end
        end)
    elseif mode == "BW" then
        task.spawn(function()
            while billboard and billboard.Parent do
                -- EFEITO ROSA E BRANCO SOLICITADO
                TweenService:Create(label, TweenInfo.new(1.5), {TextColor3 = Color3.fromRGB(255, 105, 180)}):Play()
                task.wait(2)
                TweenService:Create(label, TweenInfo.new(1.5), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                task.wait(2)
            end
        end)
    end
end

local function applySpecialTags(p)
    local function setup(character)
        task.wait(1)
        if p == player then createOverheadTag(p, "User", Color3.fromRGB(170, 0, 255), nil) end
        for _, id in pairs(CREATOR_IDS) do if p.UserId == id then createOverheadTag(p, "Criador", nil, "RGB") end end
        for _, id in pairs(ADMIN_IDS_RGB) do if p.UserId == id then createOverheadTag(p, "Admin", nil, "RGB") end end
        for _, id in pairs(VIP_IDS_BW) do if p.UserId == id then createOverheadTag(p, "Vip", nil, "BW") end end
    end
    p.CharacterAdded:Connect(setup)
    if p.Character then setup(p.Character) end
end
for _, v in pairs(Players:GetPlayers()) do applySpecialTags(v) end
Players.PlayerAdded:Connect(applySpecialTags)

-----------------------------------------
--- INTERFACE PRINCIPAL
-----------------------------------------
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.05, 50, 0.2, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = true -- INICIA VISÍVEL
MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(170, 0, 255)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Text = "S7xhub v1.1.2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

task.spawn(function()
    local hue = 0
    while Title and Title.Parent do
        hue = hue + (1/200)
        if hue > 1 then hue = 0 end
        Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait()
    end
end)

local Divider = Instance.new("Frame", MainFrame)
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.Position = UDim2.new(0, 0, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0

local TabMenu = Instance.new("Frame", MainFrame)
TabMenu.Size = UDim2.new(1, 0, 0, 35)
TabMenu.Position = UDim2.new(0, 0, 0, 41)
TabMenu.BackgroundTransparency = 1

local InicioTabBtn = Instance.new("TextButton", TabMenu)
InicioTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
InicioTabBtn.Text = "Início"
InicioTabBtn.BackgroundTransparency = 1
InicioTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
InicioTabBtn.Font = Enum.Font.GothamBold
InicioTabBtn.TextSize = 9

local FuncoesTabBtn = Instance.new("TextButton", TabMenu)
FuncoesTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
FuncoesTabBtn.Position = UDim2.new(0.2, 0, 0, 0)
FuncoesTabBtn.Text = "Funções"
FuncoesTabBtn.BackgroundTransparency = 1
FuncoesTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
FuncoesTabBtn.Font = Enum.Font.GothamBold
FuncoesTabBtn.TextSize = 9

local ConfigTabBtn = Instance.new("TextButton", TabMenu)
ConfigTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ConfigTabBtn.Position = UDim2.new(0.4, 0, 0, 0)
ConfigTabBtn.Text = "Config"
ConfigTabBtn.BackgroundTransparency = 1
ConfigTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ConfigTabBtn.Font = Enum.Font.GothamBold
ConfigTabBtn.TextSize = 9

local SpecterTabBtn = Instance.new("TextButton", TabMenu)
SpecterTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
SpecterTabBtn.Position = UDim2.new(0.6, 0, 0, 0)
SpecterTabBtn.Text = "Specter"
SpecterTabBtn.BackgroundTransparency = 1
SpecterTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
SpecterTabBtn.Font = Enum.Font.GothamBold
SpecterTabBtn.TextSize = 9

local ScriptsTabBtn = Instance.new("TextButton", TabMenu)
ScriptsTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ScriptsTabBtn.Position = UDim2.new(0.8, 0, 0, 0)
ScriptsTabBtn.Text = "Scripts"
ScriptsTabBtn.BackgroundTransparency = 1
ScriptsTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ScriptsTabBtn.Font = Enum.Font.GothamBold
ScriptsTabBtn.TextSize = 9

local InicioFrame = Instance.new("Frame", MainFrame)
InicioFrame.Size = UDim2.new(1, 0, 1, -76)
InicioFrame.Position = UDim2.new(0, 0, 0, 76)
InicioFrame.BackgroundTransparency = 1
InicioFrame.Visible = true

local FuncoesFrame = Instance.new("ScrollingFrame", MainFrame)
FuncoesFrame.Size = UDim2.new(1, 0, 1, -76)
FuncoesFrame.Position = UDim2.new(0, 0, 0, 76)
FuncoesFrame.BackgroundTransparency = 1
FuncoesFrame.ScrollBarThickness = 0
FuncoesFrame.Visible = false
local FuncoesLayout = Instance.new("UIGridLayout", FuncoesFrame)
FuncoesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
FuncoesLayout.SortOrder = Enum.SortOrder.LayoutOrder
FuncoesLayout.CellPadding = UDim2.new(0, 6, 0, 8)
FuncoesLayout.CellSize = UDim2.new(0.44, 0, 0, 35)
local FuncoesPadding = Instance.new("UIPadding", FuncoesFrame)
FuncoesPadding.PaddingTop = UDim.new(0, 10)

local ConfigFrame = Instance.new("ScrollingFrame", MainFrame)
ConfigFrame.Size = UDim2.new(1, 0, 1, -76)
ConfigFrame.Position = UDim2.new(0, 0, 0, 76)
ConfigFrame.BackgroundTransparency = 1
ConfigFrame.ScrollBarThickness = 0
ConfigFrame.Visible = false
local ConfigLayout = Instance.new("UIListLayout", ConfigFrame)
ConfigLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ConfigLayout.SortOrder = Enum.SortOrder.LayoutOrder
ConfigLayout.Padding = UDim.new(0, 8)
local ConfigPadding = Instance.new("UIPadding", ConfigFrame)
ConfigPadding.PaddingTop = UDim.new(0, 10)

local SpecterFrame = Instance.new("ScrollingFrame", MainFrame)
SpecterFrame.Size = UDim2.new(1, 0, 1, -76)
SpecterFrame.Position = UDim2.new(0, 0, 0, 76)
SpecterFrame.BackgroundTransparency = 1
SpecterFrame.ScrollBarThickness = 0
SpecterFrame.Visible = false
local SpecterLayout = Instance.new("UIListLayout", SpecterFrame)
SpecterLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SpecterLayout.SortOrder = Enum.SortOrder.LayoutOrder
SpecterLayout.Padding = UDim.new(0, 6)
local SpecterPadding = Instance.new("UIPadding", SpecterFrame)
SpecterPadding.PaddingTop = UDim.new(0, 10)

local ScriptsFrame = Instance.new("ScrollingFrame", MainFrame)
ScriptsFrame.Size = UDim2.new(1, 0, 1, -76)
ScriptsFrame.Position = UDim2.new(0, 0, 0, 76)
ScriptsFrame.BackgroundTransparency = 1
ScriptsFrame.ScrollBarThickness = 0
ScriptsFrame.Visible = false
local ScriptsLayout = Instance.new("UIListLayout", ScriptsFrame)
ScriptsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ScriptsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScriptsLayout.Padding = UDim.new(0, 8)
local ScriptsPadding = Instance.new("UIPadding", ScriptsFrame)
ScriptsPadding.PaddingTop = UDim.new(0, 10)

local function resetTabs()
    InicioFrame.Visible = false; FuncoesFrame.Visible = false; ConfigFrame.Visible = false; SpecterFrame.Visible = false; ScriptsFrame.Visible = false
    InicioTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
    FuncoesTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
    ConfigTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
    SpecterTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
    ScriptsTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
end

InicioTabBtn.MouseButton1Click:Connect(function()
    resetTabs(); InicioFrame.Visible = true; InicioTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
end)
FuncoesTabBtn.MouseButton1Click:Connect(function()
    resetTabs(); FuncoesFrame.Visible = true; FuncoesTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
end)
ConfigTabBtn.MouseButton1Click:Connect(function()
    resetTabs(); ConfigFrame.Visible = true; ConfigTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
end)
SpecterTabBtn.MouseButton1Click:Connect(function()
    resetTabs(); SpecterFrame.Visible = true; SpecterTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
end)
ScriptsTabBtn.MouseButton1Click:Connect(function()
    resetTabs(); ScriptsFrame.Visible = true; ScriptsTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
end)

-----------------------------------------
--- ABA INÍCIO
-----------------------------------------
local Avatar = Instance.new("ImageLabel", InicioFrame)
Avatar.Size = UDim2.new(0, 80, 0, 80)
Avatar.Position = UDim2.new(0.5, -40, 0.05, 0)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
Avatar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", Avatar).Color = Color3.fromRGB(170, 0, 255)

local PlayerName = Instance.new("TextLabel", InicioFrame)
PlayerName.Size = UDim2.new(1, 0, 0, 20)
PlayerName.Position = UDim2.new(0, 0, 0.35, 0)
PlayerName.Text = player.DisplayName
PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1
PlayerName.Font = Enum.Font.GothamBold
PlayerName.TextSize = 16

local function getMyTag()
    for _, v in pairs(CREATOR_IDS) do if v == player.UserId then return "Criador" end end
    for _, v in pairs(ADMIN_IDS_RGB) do if v == player.UserId then return "Admin" end end
    for _, v in pairs(VIP_IDS_BW) do if v == player.UserId then return "Vip" end end
    return "User"
end

local PlayerTag = Instance.new("TextLabel", InicioFrame)
PlayerTag.Size = UDim2.new(1, 0, 0, 20)
PlayerTag.Position = UDim2.new(0, 0, 0.45, 0)
PlayerTag.Text = "Tag Equipada: " .. getMyTag()
PlayerTag.TextColor3 = Color3.fromRGB(170, 0, 255)
PlayerTag.BackgroundTransparency = 1
PlayerTag.Font = Enum.Font.GothamSemibold
PlayerTag.TextSize = 13

local PingLabel = Instance.new("TextLabel", InicioFrame)
PingLabel.Size = UDim2.new(1, 0, 0, 20)
PingLabel.Position = UDim2.new(0, 0, 0.55, 0)
PingLabel.Text = "Ping: Calculando..."
PingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
PingLabel.BackgroundTransparency = 1
PingLabel.Font = Enum.Font.GothamSemibold
PingLabel.TextSize = 13

task.spawn(function()
    while task.wait(1) do
        if PingLabel and PingLabel.Parent then
            pcall(function()
                local pingValue = math_round(player:GetNetworkPing() * 1000)
                PingLabel.Text = "Ping: " .. pingValue .. " ms"
            end)
        else
            break
        end
    end
end)

local UserIdLabel = Instance.new("TextLabel", InicioFrame)
UserIdLabel.Size = UDim2.new(1, 0, 0, 20)
UserIdLabel.Position = UDim2.new(0, 0, 0.65, 0)
UserIdLabel.Text = "ID da Conta: " .. player.UserId
UserIdLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
UserIdLabel.BackgroundTransparency = 1
UserIdLabel.Font = Enum.Font.GothamSemibold
UserIdLabel.TextSize = 13

local creationDate = os.date("%d/%m/%Y", os.time() - (player.AccountAge * 86400))
local AccountAgeLabel = Instance.new("TextLabel", InicioFrame)
AccountAgeLabel.Size = UDim2.new(1, 0, 0, 20)
AccountAgeLabel.Position = UDim2.new(0, 0, 0.75, 0)
AccountAgeLabel.Text = "Criada em: " .. creationDate
AccountAgeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
AccountAgeLabel.BackgroundTransparency = 1
AccountAgeLabel.Font = Enum.Font.GothamSemibold
AccountAgeLabel.TextSize = 13

local CreditsLabel = Instance.new("TextLabel", InicioFrame)
CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
CreditsLabel.Position = UDim2.new(0, 0, 0.88, 0)
CreditsLabel.Text = "Criadores, Lulu Hirosh"
CreditsLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Font = Enum.Font.Gotham
CreditsLabel.TextSize = 11

-----------------------------------------
--- SISTEMA DE KEYBINDS E AJUSTADORES
-----------------------------------------
local bindKeys = {
    Spam = Enum.KeyCode.F,
    SpamCamera = Enum.KeyCode.C,
    Esp = Enum.KeyCode.E,
    Tp = Enum.KeyCode.Q,
    Fly = Enum.KeyCode.T,
    Speed = Enum.KeyCode.Y,
    Noclip = Enum.KeyCode.N
}

-- Valores padrão (0 a 100)
local flySpeedValue = 50
local walkSpeedValue = 50

local function addKeybindBox(btn, action, defaultKeyName)
    local keyBox = Instance.new("TextBox", btn)
    keyBox.Size = UDim2.new(0, 22, 0, 22)
    keyBox.Position = UDim2.new(1, -26, 0.5, -11)
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(170, 0, 255)
    keyBox.Font = Enum.Font.GothamBold
    keyBox.TextSize = 11
    keyBox.Text = defaultKeyName
    keyBox.PlaceholderText = ""
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 4)

    keyBox.FocusLost:Connect(function()
        local inputChar = string_upper(string_sub(keyBox.Text, 1, 1))
        local success, code = pcall(function() return Enum.KeyCode[inputChar] end)
        
        if success and code and inputChar ~= "" then
            bindKeys[action] = code
            keyBox.Text = inputChar
            if action == "Spam" and not isSpamming then btn.Text = "SPAM OVO ["..inputChar.."]" end
            if action == "SpamCamera" and not spamCamAtivo then btn.Text = "SPAM CAMERA ["..inputChar.."]" end
            if action == "Esp" and not espEnabled then btn.Text = "ESP ["..inputChar.."]" end
            if action == "Tp" and not tpEnabled then btn.Text = "CLICK TP ["..inputChar.."]" end
            if action == "Fly" and not flyEnabled then btn.Text = "FLY ["..inputChar.."]: OFF" end
            if action == "Speed" and not speedEnabled then btn.Text = "SPEED ["..inputChar.."]: OFF" end
            if action == "Noclip" and not noclipEnabled then btn.Text = "NOCLIP ["..inputChar.."]: OFF" end
        else
            keyBox.Text = bindKeys[action].Name
        end
    end)
end

local function addValueBox(btn, initialValue, callback)
    local valBox = Instance.new("TextBox", btn)
    local valBox = Instance.new("TextBox", btn)
    valBox.Size = UDim2.new(0, 30, 0, 22)
    valBox.Position = UDim2.new(1, -60, 0.5, -11)
    valBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    valBox.TextColor3 = Color3.fromRGB(0, 255, 150)
    valBox.Font = Enum.Font.GothamBold
    valBox.TextSize = 11
    valBox.Text = tostring(initialValue)
    valBox.PlaceholderText = ""
    Instance.new("UICorner", valBox).CornerRadius = UDim.new(0, 4)

    valBox.FocusLost:Connect(function()
        local num = tonumber(valBox.Text)
        if num then
            num = math_clamp(math_round(num), 0, 100)
            valBox.Text = tostring(num)
            callback(num)
        else
            valBox.Text = tostring(initialValue)
            callback(initialValue)
        end
    end)
end

-----------------------------------------
--- ABA FUNÇÕES E FUNÇÕES ORIGINAIS
-----------------------------------------
local function createButton(text, parent)
    local btn = Instance.new("TextButton", parent)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Size = UDim2.new(0.85, 0, 0, 30)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 10 
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local SpamBtn      = createButton("SPAM OVO ["..bindKeys.Spam.Name.."]", FuncoesFrame)
local SpamCamBtn   = createButton("SPAM CAMERA ["..bindKeys.SpamCamera.Name.."]", FuncoesFrame)
local FarmBtn      = createButton("PEGAR OVOS", FuncoesFrame)
local EspBtn       = createButton("ESP ["..bindKeys.Esp.Name.."]", FuncoesFrame)
local TpBtn        = createButton("CLICK TP ["..bindKeys.Tp.Name.."]", FuncoesFrame)
local ReBtn        = createButton("REJOIN", FuncoesFrame)
local AntiAdmBtn   = createButton("AntiADM: OFF", FuncoesFrame)

addKeybindBox(SpamBtn, "Spam", bindKeys.Spam.Name)
addKeybindBox(SpamCamBtn, "SpamCamera", bindKeys.SpamCamera.Name)
addKeybindBox(EspBtn, "Esp", bindKeys.Esp.Name)
addKeybindBox(TpBtn, "Tp", bindKeys.Tp.Name)

FuncoesFrame.CanvasSize = UDim2.new(0, 0, 0, 180)

-----------------------------------------
--- ABA CONFIG (FLY, SPEED, NOCLIP, ANTIAFK)
-----------------------------------------
local FlyBtn   = createButton("FLY ["..bindKeys.Fly.Name.."]: OFF", ConfigFrame)
local SpeedBtn = createButton("SPEED ["..bindKeys.Speed.Name.."]: OFF", ConfigFrame)
local NoclipBtn = createButton("NOCLIP ["..bindKeys.Noclip.Name.."]: OFF", ConfigFrame)
local AntiAfkBtn = createButton("AntiAFK: OFF", ConfigFrame)

FlyBtn.Size = UDim2.new(0.85, 0, 0, 35)
SpeedBtn.Size = UDim2.new(0.85, 0, 0, 35)
NoclipBtn.Size = UDim2.new(0.85, 0, 0, 35)
AntiAfkBtn.Size = UDim2.new(0.85, 0, 0, 35)

ConfigFrame.CanvasSize = UDim2.new(0, 0, 0, 4 * 43 + 20)

addKeybindBox(FlyBtn, "Fly", bindKeys.Fly.Name)
addKeybindBox(SpeedBtn, "Speed", bindKeys.Speed.Name)
addKeybindBox(NoclipBtn, "Noclip", bindKeys.Noclip.Name)

addValueBox(FlyBtn, flySpeedValue, function(val) flySpeedValue = val end)
addValueBox(SpeedBtn, walkSpeedValue, function(val) walkSpeedValue = val end)

-- LÓGICA AntiAFK
local antiAfkEnabled = false
local afkConn = nil

AntiAfkBtn.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    AntiAfkBtn.Text = antiAfkEnabled and "AntiAFK: ON" or "AntiAFK: OFF"
    AntiAfkBtn.BackgroundColor3 = antiAfkEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if antiAfkEnabled then
        afkConn = player.Idled:Connect(function()
            local virtualUser = game:GetService("VirtualUser")
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    else
        if afkConn then
            afkConn:Disconnect()
            afkConn = nil
        end
    end
end)

-----------------------------------------
--- ABA SCRIPTS (NOVA)
-----------------------------------------
local InfYieldBtn = createButton("Infinite Yield", ScriptsFrame)
local VcCrasherBtn = createButton("VC CRASHER", ScriptsFrame)
local KsxBtn = createButton("Ksx", ScriptsFrame)

InfYieldBtn.Size = UDim2.new(0.85, 0, 0, 35)
VcCrasherBtn.Size = UDim2.new(0.85, 0, 0, 35)
KsxBtn.Size = UDim2.new(0.85, 0, 0, 35)

InfYieldBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

VcCrasherBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Rootleak/Stalkie-2.0/refs/heads/main/vc.lua"))()
end)

KsxBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://gitlab.com/ksx1s/ksx-s/raw/main/Panel'))()
end)

ScriptsFrame.CanvasSize = UDim2.new(0, 0, 0, 3 * 43 + 20)

-- LÓGICA NOCLIP
noclipEnabled = false
local noclipConn = nil

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and "NOCLIP ["..bindKeys.Noclip.Name.."]: ON" or "NOCLIP ["..bindKeys.Noclip.Name.."]: OFF"
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)

    if noclipEnabled then
        noclipConn = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConn then
            noclipConn:Disconnect()
            noclipConn = nil
        end
    end
end
NoclipBtn.MouseButton1Click:Connect(toggleNoclip)

-- LÓGICA FLY (POSE SUPER-HERÓI)
flyEnabled = false
local flyBV, flyBG

local function toggleFly()
    flyEnabled = not flyEnabled
    local char = player.Character
    if flyEnabled and char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local hum = char:FindFirstChild("Humanoid")
        
        if hum then hum.PlatformStand = true end
        
        flyBG = Instance.new("BodyGyro", hrp)
        flyBG.P = 9e4
        flyBG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.cframe = hrp.CFrame
        
        flyBV = Instance.new("BodyVelocity", hrp)
        flyBV.velocity = Vector3.new(0, 0.1, 0)
        flyBV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        FlyBtn.Text = "FLY ["..bindKeys.Fly.Name.."]: ON"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    else
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = false
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
        if flyBG then flyBG:Destroy() flyBG = nil end
        if flyBV then flyBV:Destroy() flyBV = nil end
        FlyBtn.Text = "FLY ["..bindKeys.Fly.Name.."]: OFF"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    end
end

RunService.RenderStepped:Connect(function()
    if flyEnabled and flyBV and flyBG and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local camCF = camera.CFrame
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        
        flyBG.cframe = camCF * CFrame.Angles(math_rad(-90), 0, 0)
        
        if moveDir.Magnitude > 0 then
            flyBV.velocity = moveDir.Unit * flySpeedValue
        else
            flyBV.velocity = Vector3.new(0, 0.1, 0)
        end
    end
end)
FlyBtn.MouseButton1Click:Connect(toggleFly)

-- LÓGICA SPEED
speedEnabled = false
local function toggleSpeed()
    speedEnabled = not speedEnabled
    SpeedBtn.Text = speedEnabled and "SPEED ["..bindKeys.Speed.Name.."]: ON" or "SPEED ["..bindKeys.Speed.Name.."]: OFF"
    SpeedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if not speedEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16 
    end
end

RunService.RenderStepped:Connect(function()
    if speedEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = walkSpeedValue
    end
end)
SpeedBtn.MouseButton1Click:Connect(toggleSpeed)

-----------------------------------------
--- LÓGICA AntiADM
-----------------------------------------
local antiAdmEnabled = false

local function showAdmWarning(name)
    local WarnLabel = Instance.new("TextLabel", ScreenGui)
    WarnLabel.Size = UDim2.new(1, 0, 0, 50)
    WarnLabel.Position = UDim2.new(0, 0, 0.05, 0)
    WarnLabel.BackgroundTransparency = 1
    WarnLabel.Text = "⚠️ ADM ENTROU NO SERVIDOR: "..name.." ⚠️"
    WarnLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    WarnLabel.Font = Enum.Font.GothamBold
    WarnLabel.TextSize = 24
    WarnLabel.TextStrokeTransparency = 0
    
    task.spawn(function()
        task.wait(20)
        TweenService:Create(WarnLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
        task.wait(1)
        WarnLabel:Destroy()
    end)
end

Players.PlayerAdded:Connect(function(newPlayer)
    if antiAdmEnabled then
        local role = newPlayer:GetRoleInGroup(GROUP_ID)
        if ADMIN_ROLES[role] then
            showAdmWarning(newPlayer.Name)
        end
    end
end)

AntiAdmBtn.MouseButton1Click:Connect(function()
    antiAdmEnabled = not antiAdmEnabled
    AntiAdmBtn.Text = antiAdmEnabled and "AntiADM: ON" or "AntiADM: OFF"
    AntiAdmBtn.BackgroundColor3 = antiAdmEnabled and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(28, 28, 28)
end)

-----------------------------------------
--- ABA SPECTER
-----------------------------------------
local spectatingPlayer = nil
local sitEnabled = false
local sitConn = nil

local SpectAvatar = Instance.new("ImageLabel", SpecterFrame)
SpectAvatar.Size = UDim2.new(0, 60, 0, 60)
SpectAvatar.BackgroundTransparency = 1
SpectAvatar.Image = ""
Instance.new("UICorner", SpectAvatar).CornerRadius = UDim.new(1, 0)

local SpectNameLabel = Instance.new("TextLabel", SpecterFrame)
SpectNameLabel.Size = UDim2.new(0.9, 0, 0, 20)
SpectNameLabel.BackgroundTransparency = 1
SpectNameLabel.Text = "Ninguém selecionado"
SpectNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectNameLabel.Font = Enum.Font.GothamBold
SpectNameLabel.TextSize = 12

local SpectSearchBox = Instance.new("TextBox", SpecterFrame)
SpectSearchBox.Size = UDim2.new(0.85, 0, 0, 25)
SpectSearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpectSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectSearchBox.Font = Enum.Font.GothamSemibold
SpectSearchBox.TextSize = 12
SpectSearchBox.PlaceholderText = "Digitar Username/Nome..."
SpectSearchBox.Text = ""
Instance.new("UICorner", SpectSearchBox).CornerRadius = UDim.new(0, 6)

local function setSpectateTarget(targetPlayer)
    if not targetPlayer then return end
    spectatingPlayer = targetPlayer
    SpectNameLabel.Text = targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
    SpectAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. targetPlayer.UserId .. "&w=150&h=150"
    
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        camera.CameraSubject = targetPlayer.Character.Humanoid
    end
end

SpectSearchBox.FocusLost:Connect(function()
    local text = string_lower(SpectSearchBox.Text)
    for _, p in pairs(Players:GetPlayers()) do
        if string_find(string_lower(p.Name), text) or string_find(string_lower(p.DisplayName), text) then
            setSpectateTarget(p)
            break
        end
    end
    SpectSearchBox.Text = ""
end)

local SpectTpBtn = createButton("Ir até (TP)", SpecterFrame)
SpectTpBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local SpectSitBtn = createButton("Sentar: OFF", SpecterFrame)

local SpectStopBtn = createButton("Parar Spect", SpecterFrame)
SpectStopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

SpecterFrame.CanvasSize = UDim2.new(0, 0, 0, 60 + 20 + 25 + 35*3 + 40)

SpectTpBtn.MouseButton1Click:Connect(function()
    if spectatingPlayer and spectatingPlayer.Character and spectatingPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = spectatingPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)

SpectSitBtn.MouseButton1Click:Connect(function()
    sitEnabled = not sitEnabled
    SpectSitBtn.Text = sitEnabled and "Sentar: ON" or "Sentar: OFF"
    SpectSitBtn.BackgroundColor3 = sitEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if sitConn then sitConn:Disconnect() sitConn = nil end
    
    if sitEnabled then
        sitConn = RunService.Heartbeat:Connect(function()
            if spectatingPlayer and spectatingPlayer.Character and player.Character then
                local targetHrp = spectatingPlayer.Character:FindFirstChild("HumanoidRootPart")
                local myHrp = player.Character:FindFirstChild("HumanoidRootPart")
                local myHum = player.Character:FindFirstChild("Humanoid")
                
                if targetHrp and myHrp and myHum then
                    myHum.Sit = true
                    myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 1.5, 0)
                end
            end
        end)
    else
        local myHum = player.Character and player.Character:FindFirstChild("Humanoid")
        if myHum then
            myHum.Sit = false
            myHum.Jump = true 
        end
    end
end)

SpectStopBtn.MouseButton1Click:Connect(function()
    spectatingPlayer = nil
    SpectNameLabel.Text = "Ninguém selecionado"
    SpectAvatar.Image = ""
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        camera.CameraSubject = player.Character.Humanoid
    end
    
    if sitEnabled then
        sitEnabled = false
        SpectSitBtn.Text = "Sentar: OFF"
        SpectSitBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        if sitConn then sitConn:Disconnect() sitConn = nil end
        local myHum = player.Character and player.Character:FindFirstChild("Humanoid")
        if myHum then myHum.Sit = false; myHum.Jump = true end
    end
end)

-----------------------------------------
--- ANIMAÇÃO DO PAINEL
-----------------------------------------
local panelOpen = true -- INICIA ABERTO
local panelTargetSize = UDim2.new(0, 220, 0, 420)

local function togglePanel()
    panelOpen = not panelOpen
    if panelOpen then
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = panelTargetSize}):Play()
    else
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        task.spawn(function()
            tween.Completed:Wait()
            if not panelOpen then
                MainFrame.Visible = false
            end
        end)
    end
end

-----------------------------------------
--- LÓGICAS ORIGINAIS DOS BOTÕES GERAIS
-----------------------------------------
OpenBtn.MouseButton1Click:Connect(togglePanel)

ReBtn.MouseButton1Click:Connect(function()
    if #Players:GetPlayers() <= 1 then TeleportService:Teleport(game.PlaceId, player)
    else TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) end
end)

tpEnabled = false
local function toggleTp()
    tpEnabled = not tpEnabled
    TpBtn.Text = tpEnabled and "CLICK TP: ON" or "CLICK TP ["..bindKeys.Tp.Name.."]"
    TpBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
TpBtn.MouseButton1Click:Connect(toggleTp)
mouse.Button1Down:Connect(function()
    if tpEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

isSpamming = false
local spamConn = nil
local function toggleSpam()
    isSpamming = not isSpamming
    SpamBtn.Text = isSpamming and "SPAM OVO: ON" or "SPAM OVO ["..bindKeys.Spam.Name.."]"
    SpamBtn.BackgroundColor3 = isSpamming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isSpamming then
        spamConn = RunService.Heartbeat:Connect(function()
            local charFolder = workspace:FindFirstChild("Characters")
            local target = charFolder and charFolder:FindFirstChild(player.Name) and charFolder[player.Name]:FindFirstChild("Storegg")
            if target then pcall(function() remoteEvent:FireServer("TryStoregg", target, mouse.Hit.Position) end) end
        end)
    elseif spamConn then spamConn:Disconnect() spamConn = nil end
end
SpamBtn.MouseButton1Click:Connect(toggleSpam)

spamCamAtivo = false
local disparosPorFrame = 20
local function toggleSpamCam()
    spamCamAtivo = not spamCamAtivo
    SpamCamBtn.Text = spamCamAtivo and "SPAM CAMERA: ON" or "SPAM CAMERA ["..bindKeys.SpamCamera.Name.."]"
    SpamCamBtn.BackgroundColor3 = spamCamAtivo and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
SpamCamBtn.MouseButton1Click:Connect(toggleSpamCam)

RunService.Heartbeat:Connect(function()
    if not spamCamAtivo then return end
    local char = workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(player.Name)
    local remote = char and char:FindFirstChild("Camera") and char.Camera:FindFirstChild("Remote")
    if remote then
        for i = 1, disparosPorFrame do
            if not spamCamAtivo then break end
            remote:FireServer()
        end
    end
end)

local isFarming = false
FarmBtn.MouseButton1Click:Connect(function()
    isFarming = not isFarming
    FarmBtn.Text = isFarming and "PEGAR OVOS: ON" or "PEGAR OVOS"
    FarmBtn.BackgroundColor3 = isFarming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isFarming then task.spawn(function()
        while isFarming do
            local eggs = workspace:FindFirstChild("Eggs")
            if player.Character and eggs then
                for _, obj in pairs(eggs:GetChildren()) do
                    if not isFarming then break end
                    if obj:IsA("Model") and string_find(obj.Name, "Egg") then
                        local tp = obj:FindFirstChildWhichIsA("BasePart", true)
                        if tp then player.Character.HumanoidRootPart.CFrame = tp.CFrame * CFrame.new(0, 8, 0) task.wait(2.5) end
                    end
                end
            end
            task.wait(1)
        end
    end) end
end)

espEnabled = false
local espFolder = Instance.new("Folder", ScreenGui)
local function toggleEsp()
    espEnabled = not espEnabled
    EspBtn.Text = espEnabled and "ESP: ON" or "ESP ["..bindKeys.Esp.Name.."]"
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if not espEnabled then espFolder:ClearAllChildren() end
end
EspBtn.MouseButton1Click:Connect(toggleEsp)

task.spawn(function()
    while task.wait() do
        if espEnabled then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
                    local b = espFolder:FindFirstChild(v.Name) or Instance.new("BillboardGui", espFolder)
                    b.Name = v.Name b.Adornee = v.Character.Head b.Size = UDim2.new(0,100,0,50) b.AlwaysOnTop = true
                    local l = b:FindFirstChild("L") or Instance.new("TextLabel", b)
                    l.Name = "L" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.TextSize = 14
                    local r = v:GetRoleInGroup(GROUP_ID)
                    local d = math_floor((player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                    if ADMIN_ROLES[r] then l.TextColor3 = Color3.fromRGB(255,0,0) l.Text = v.Name.."\n["..r.."]\n"..d.."m"
                    else l.TextColor3 = Color3.fromRGB(255,255,255) l.Text = v.Name.."\n"..d.."m" end
                end
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(i, p)
    if p then return end
    
    if i.KeyCode == Enum.KeyCode.G then togglePanel() end
    if i.KeyCode == bindKeys.Spam then toggleSpam() end
    if i.KeyCode == bindKeys.SpamCamera then toggleSpamCam() end
    if i.KeyCode == bindKeys.Esp then toggleEsp() end
    if i.KeyCode == bindKeys.Tp then toggleTp() end
    if i.KeyCode == bindKeys.Fly then toggleFly() end
    if i.KeyCode == bindKeys.Speed then toggleSpeed() end
    if i.KeyCode == bindKeys.Noclip then toggleNoclip() end
end)
