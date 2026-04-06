-- [[ SISTEMA DE SEGURANÇA S7xhud ]] --
local Players = game:GetService("Players")
local player = Players.LocalPlayer

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
    warn("S7xhud: ACESSO NEGADO.")
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
ScreenGui.Name = "S7xhud_Panel"
ScreenGui.ResetOnSpawn = false

-----------------------------------------
--- NOTIFICAÇÃO PC (10 SEGUNDOS)
-----------------------------------------
if not isMobile then
    local NotifyFrame = Instance.new("TextLabel", ScreenGui)
    NotifyFrame.Size = UDim2.new(0, 300, 0, 50)
    NotifyFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyFrame.BackgroundTransparency = 0.2
    NotifyFrame.Text = "APERTE G PARA APARECER O PAINEL"
    NotifyFrame.TextColor3 = Color3.fromRGB(170, 0, 255)
    NotifyFrame.Font = Enum.Font.GothamBold
    NotifyFrame.TextSize = 14
    Instance.new("UICorner", NotifyFrame)
    Instance.new("UIStroke", NotifyFrame).Color = Color3.fromRGB(170, 0, 255)

    task.spawn(function()
        task.wait(10)
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
--- LÓGICA DE TAGS (MANTIDA)
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
                TweenService:Create(label, TweenInfo.new(1.5), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                task.wait(3)
                TweenService:Create(label, TweenInfo.new(1.5), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
                task.wait(3)
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
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Position = UDim2.new(0.05, 50, 0.3, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = false
Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "S7xhud"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local function createButton(text, pos)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Position = pos
    btn.Size = UDim2.new(0.85, 0, 0, 35)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local SpamBtn = createButton("SPAM OVO [F]", UDim2.new(0.075, 0, 0.13, 0))
local FarmBtn = createButton("PEGAR OVOS", UDim2.new(0.075, 0, 0.27, 0))
local EspBtn  = createButton("ESP [E]", UDim2.new(0.075, 0, 0.41, 0))
local TpBtn   = createButton("CLICK TP [Q]", UDim2.new(0.075, 0, 0.55, 0))
local ReBtn   = createButton("REJOIN", UDim2.new(0.075, 0, 0.69, 0))
local SpectBtn = createButton("SPECT", UDim2.new(0.075, 0, 0.83, 0))

-----------------------------------------
--- MENU SPECTATE
-----------------------------------------
local SpectateFrame = Instance.new("Frame", ScreenGui)
SpectateFrame.Size = UDim2.new(0, 180, 0, 250)
SpectateFrame.Position = UDim2.new(0.05, 260, 0.3, 0)
SpectateFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SpectateFrame.Visible = false
Instance.new("UICorner", SpectateFrame)

local SpectateTitle = Instance.new("TextLabel", SpectateFrame)
SpectateTitle.Size = UDim2.new(1, 0, 0, 30)
SpectateTitle.Text = "SPECTATE LIST"
SpectateTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectateTitle.Font = Enum.Font.GothamBold
SpectateTitle.BackgroundTransparency = 1

local Scroll = Instance.new("ScrollingFrame", SpectateFrame)
Scroll.Size = UDim2.new(0.9, 0, 0.6, 0)
Scroll.Position = UDim2.new(0.05, 0, 0.15, 0)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 2
local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0, 5)

local StopSpectBtn = Instance.new("TextButton", SpectateFrame)
StopSpectBtn.Text = "STOP"
StopSpectBtn.Size = UDim2.new(0.4, 0, 0, 25)
StopSpectBtn.Position = UDim2.new(0.05, 0, 0.78, 0)
StopSpectBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
StopSpectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", StopSpectBtn)

local SpectTpBtn = Instance.new("TextButton", SpectateFrame)
SpectTpBtn.Text = "TP"
SpectTpBtn.Size = UDim2.new(0.4, 0, 0, 25)
SpectTpBtn.Position = UDim2.new(0.55, 0, 0.78, 0)
SpectTpBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
SpectTpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SpectTpBtn)

local CloseSpectBtn = Instance.new("TextButton", SpectateFrame)
CloseSpectBtn.Text = "CLOSE"
CloseSpectBtn.Size = UDim2.new(0.9, 0, 0, 25)
CloseSpectBtn.Position = UDim2.new(0.05, 0, 0.89, 0)
CloseSpectBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseSpectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", CloseSpectBtn)

local spectatingPlayer = nil

local function updateSpectateList()
    for _, child in pairs(Scroll:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local pBtn = Instance.new("TextButton", Scroll)
            pBtn.Size = UDim2.new(1, -10, 0, 25)
            pBtn.Text = p.Name
            pBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            pBtn.TextSize = 10
            Instance.new("UICorner", pBtn)
            pBtn.MouseButton1Click:Connect(function()
                spectatingPlayer = p
                camera.CameraSubject = p.Character:FindFirstChild("Humanoid")
            end)
        end
    end
    Scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y)
end

SpectBtn.MouseButton1Click:Connect(function()
    SpectateFrame.Visible = not SpectateFrame.Visible
    if SpectateFrame.Visible then updateSpectateList() end
end)

StopSpectBtn.MouseButton1Click:Connect(function()
    spectatingPlayer = nil
    camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
end)

SpectTpBtn.MouseButton1Click:Connect(function()
    if spectatingPlayer and spectatingPlayer.Character and spectatingPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = spectatingPlayer.Character.HumanoidRootPart.CFrame
    end
end)

CloseSpectBtn.MouseButton1Click:Connect(function() SpectateFrame.Visible = false end)

-----------------------------------------
--- LÓGICAS ORIGINAIS
-----------------------------------------
OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

ReBtn.MouseButton1Click:Connect(function()
    if #Players:GetPlayers() <= 1 then TeleportService:Teleport(game.PlaceId, player)
    else TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) end
end)

local tpEnabled = false
local function toggleTp()
    tpEnabled = not tpEnabled
    TpBtn.Text = tpEnabled and "CLICK TP: ON" or "CLICK TP [Q]"
    TpBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
TpBtn.MouseButton1Click:Connect(toggleTp)
mouse.Button1Down:Connect(function()
    if tpEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

local isSpamming = false
local spamConn = nil
local function toggleSpam()
    isSpamming = not isSpamming
    SpamBtn.Text = isSpamming and "SPAM OVO: ON" or "SPAM OVO [F]"
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
                    if obj:IsA("Model") and string.find(obj.Name, "Egg") then
                        local tp = obj:FindFirstChildWhichIsA("BasePart", true)
                        if tp then player.Character.HumanoidRootPart.CFrame = tp.CFrame * CFrame.new(-1, 8, -3) task.wait(1.2) end
                    end
                end
            end
            task.wait(1)
        end
    end) end
end)

local espEnabled = false
local espFolder = Instance.new("Folder", ScreenGui)
local function toggleEsp()
    espEnabled = not espEnabled
    EspBtn.Text = espEnabled and "ESP: ON" or "ESP [E]"
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if not espEnabled then espFolder:ClearAllChildren() end
end
EspBtn.MouseButton1Click:Connect(toggleEsp)

RunService.RenderStepped:Connect(function()
    if espEnabled then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
                local b = espFolder:FindFirstChild(v.Name) or Instance.new("BillboardGui", espFolder)
                b.Name = v.Name b.Adornee = v.Character.Head b.Size = UDim2.new(0,100,0,50) b.AlwaysOnTop = true
                local l = b:FindFirstChild("L") or Instance.new("TextLabel", b)
                l.Name = "L" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.TextSize = 14
                local r = v:GetRoleInGroup(GROUP_ID)
                local d = math.floor((player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                if ADMIN_ROLES[r] then l.TextColor3 = Color3.fromRGB(255,0,0) l.Text = v.Name.."\n["..r.."]\n"..d.."m"
                else l.TextColor3 = Color3.fromRGB(255,255,255) l.Text = v.Name.."\n"..d.."m" end
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(i, p)
    if p then return end
    if i.KeyCode == Enum.KeyCode.G then MainFrame.Visible = not MainFrame.Visible end
    if i.KeyCode == Enum.KeyCode.F then toggleSpam() end
    if i.KeyCode == Enum.KeyCode.E then toggleEsp() end
    if i.KeyCode == Enum.KeyCode.Q then toggleTp() end
end)
