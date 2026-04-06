-- [[ SISTEMA DE SEGURANÇA S7xhud ]] --
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- LISTAS DE PERMISSÃO (IDs Autorizados)
local CREATOR_IDS = {2959681, 9216315975, 88189937} 
local ADMIN_IDS_RGB = {1870899605, 7668266040}
local VIP_IDS_BW = {648989434, 9987756245}

local isAuthorized = false
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

local mouse = player:GetMouse()
local remoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Events"):WaitForChild("RemoteEvent")

local GROUP_ID = 34157675
local ADMIN_ROLES = {
    ["Marketing"] = true, ["Influencer"] = true, ["Social Mod"] = true, 
    ["Helper"] = true, ["Supervisor"] = true, ["Manager"] = true, 
    ["Contributor"] = true, ["Developer"] = true, ["Owner"] = true
}

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "S7xhud_Panel"

-----------------------------------------
--- LÓGICA DE TAGS COM DISTANCE LIMIT
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
    
    -- CONFIGURAÇÃO DE DISTÂNCIA: Só aparece se estiver perto (100 studs)
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
--- INTERFACE E LÓGICAS (MANTIDAS)
-----------------------------------------
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true 
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

local SpamBtn = createButton("SPAM OVO [F]", UDim2.new(0.075, 0, 0.15, 0))
local FarmBtn = createButton("PEGAR OVOS", UDim2.new(0.075, 0, 0.32, 0))
local EspBtn = createButton("ESP [E]", UDim2.new(0.075, 0, 0.49, 0))
local TpBtn   = createButton("CLICK TP [Q]", UDim2.new(0.075, 0, 0.66, 0))
local ReBtn   = createButton("REJOIN", UDim2.new(0.075, 0, 0.83, 0))

-- Logica Rejoin
ReBtn.MouseButton1Click:Connect(function()
    if #Players:GetPlayers() <= 1 then TeleportService:Teleport(game.PlaceId, player)
    else TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) end
end)

-- Logica Click TP
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

-- Lógica de Spam
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

-- Lógica de Farm
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

-- Lógica ESP
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
