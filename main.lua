function RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


-- [[ SISTEMA DE SEGURANÇA S7xhub v1.1.2 ]] --
local Players = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,11340,10185,12705,10605,11970,12075}))
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
    warn(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775,12600,10920,12285,10290,3360,12390,5145,4830,5145,4830,5250,6090,3360,6825,7035,7245,8715,8715,8295,3360,8190,7245,7455,6825,7140,8295,4830}))
    return 
end

-- [[ INÍCIO DO SCRIPT ]] --
local ReplicatedStorage = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,10605,11760,11340,11025,10395,10185,12180,10605,10500,8715,12180,11655,11970,10185,10815,10605}))
local RunService = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,12285,11550,8715,10605,11970,12390,11025,10395,10605}))
local UserInputService = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,12075,10605,11970,7665,11550,11760,12285,12180,8715,10605,11970,12390,11025,10395,10605}))
local TeleportService = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,11340,10605,11760,11655,11970,12180,8715,10605,11970,12390,11025,10395,10605}))
local CoreGui = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11655,11970,10605,7455,12285,11025}))
local TweenService = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,12495,10605,10605,11550,8715,10605,11970,12390,11025,10395,10605}))

local targetParent = (RunService:IsStudio() or not CoreGui) and player:WaitForChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,11340,10185,12705,10605,11970,7455,12285,11025})) or CoreGui
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local remoteEvent = ReplicatedStorage:WaitForChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8085,11655,10500,12285,11340,10605,12075})):WaitForChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,12390,10605,11550,12180,12075})):WaitForChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,10605,11445,11655,12180,10605,7245,12390,10605,11550,12180}))

-- DETECÇÃO DE PLATAFORMA
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local GROUP_ID = 34157675
local ADMIN_ROLES = {
    [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8085,10185,11970,11235,10605,12180,11025,11550,10815})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11550,10710,11340,12285,10605,11550,10395,10605,11970})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11655,10395,11025,10185,11340,3360,8085,11655,10500})] = true, 
    [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,10605,11340,11760,10605,11970})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,12285,11760,10605,11970,12390,11025,12075,11655,11970})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8085,10185,11550,10185,10815,10605,11970})] = true, 
    [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11655,11550,12180,11970,11025,10290,12285,12180,11655,11970})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7140,10605,12390,10605,11340,11655,11760,10605,11970})] = true, [RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8295,12495,11550,10605,11970})] = true
}

local ScreenGui = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,10605,10605,11550,7455,12285,11025}), targetParent)
ScreenGui.Name = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775,12600,10920,12285,10290,9975,8400,10185,11550,10605,11340})
ScreenGui.ResetOnSpawn = false

-----------------------------------------
--- NOTIFICAÇÃO PC (13 SEGUNDOS)
-----------------------------------------
if not isMobile then
    local NotifyFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), ScreenGui)
    NotifyFrame.Size = UDim2.new(0, 350, 0, 50)
    NotifyFrame.Position = UDim2.new(0.5, -175, 0.1, 0)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyFrame.BackgroundTransparency = 0.2
    NotifyFrame.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,8715,7245,3360,6825,3360,7980,7245,8820,8610,6825,3360,7455,3360,8400,6825,8610,6825,3360,6825,6930,8610,7665,8610,3360,7245,3360,7350,7245,7035,7560,6825,8610,3360,8295,3360,8400,6825,7665,8190,7245,7980})
    NotifyFrame.TextColor3 = Color3.fromRGB(170, 0, 255)
    NotifyFrame.Font = Enum.Font.GothamBold
    NotifyFrame.TextSize = 14
    Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), NotifyFrame)
    Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8715,12180,11970,11655,11235,10605}), NotifyFrame).Color = Color3.fromRGB(170, 0, 255)

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
local OpenBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), ScreenGui)
OpenBtn.Size = UDim2.new(0, 45, 0, 45)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -22)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775})
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 18
OpenBtn.Visible = isMobile
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), OpenBtn).CornerRadius = UDim.new(1, 0)
local Stroke = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8715,12180,11970,11655,11235,10605}), OpenBtn)
Stroke.Color = Color3.fromRGB(170, 0, 255)
Stroke.Thickness = 2

-----------------------------------------
--- LÓGICA DE TAGS DE CABEÇA
-----------------------------------------
local function createOverheadTag(targetPlayer, text, color, mode)
    local char = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
    local head = char:WaitForChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,10605,10185,10500}))
    if head:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775,12600,8820,10185,10815})) then head.S7xTag:Destroy() end
    local billboard = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,11025,11340,11340,10290,11655,10185,11970,10500,7455,12285,11025}), head)
    billboard.Name = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775,12600,8820,10185,10815})
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 120, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 100 
    local label = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), billboard)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 17
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.4
    if mode == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,7455,6930}) then
        task.spawn(function()
            local hue = 0
            while billboard and billboard.Parent do
                hue = hue + (1/200)
                label.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait()
            end
        end)
    elseif mode == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,9135}) then
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
        if p == player then createOverheadTag(p, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,12075,10605,11970}), Color3.fromRGB(170, 0, 255), nil) end
        for _, id in pairs(CREATOR_IDS) do if p.UserId == id then createOverheadTag(p, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11970,11025,10185,10500,11655,11970}), nil, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,7455,6930})) end end
        for _, id in pairs(ADMIN_IDS_RGB) do if p.UserId == id then createOverheadTag(p, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,10500,11445,11025,11550}), nil, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,7455,6930})) end end
        for _, id in pairs(VIP_IDS_BW) do if p.UserId == id then createOverheadTag(p, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9030,11025,11760}), nil, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,9135})) end end
    end
    p.CharacterAdded:Connect(setup)
    if p.Character then setup(p.Character) end
end
for _, v in pairs(Players:GetPlayers()) do applySpecialTags(v) end
Players.PlayerAdded:Connect(applySpecialTags)

-----------------------------------------
--- INTERFACE PRINCIPAL
-----------------------------------------
local MainFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11970,10185,11445,10605}), ScreenGui)
MainFrame.Name = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8085,10185,11025,11550,7350,11970,10185,11445,10605})
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.05, 50, 0.2, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = true -- INICIA VISÍVEL
MainFrame.ClipsDescendants = true
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), MainFrame).CornerRadius = UDim.new(0, 8)
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8715,12180,11970,11655,11235,10605}), MainFrame).Color = Color3.fromRGB(170, 0, 255)

local TopBar = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11970,10185,11445,10605}), MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local Title = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), TopBar)
Title.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,5775,12600,10920,12285,10290,3360,12390,5145,4830,5145,4830,5250})
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

local Divider = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11970,10185,11445,10605}), MainFrame)
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.Position = UDim2.new(0, 0, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0

local TabMenu = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11970,10185,11445,10605}), MainFrame)
TabMenu.Size = UDim2.new(1, 0, 0, 35)
TabMenu.Position = UDim2.new(0, 0, 0, 41)
TabMenu.BackgroundTransparency = 1

local InicioTabBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), TabMenu)
InicioTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
InicioTabBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11550,20475,18165,10395,11025,11655})
InicioTabBtn.BackgroundTransparency = 1
InicioTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
InicioTabBtn.Font = Enum.Font.GothamBold
InicioTabBtn.TextSize = 9

local FuncoesTabBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), TabMenu)
FuncoesTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
FuncoesTabBtn.Position = UDim2.new(0.2, 0, 0, 0)
FuncoesTabBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,12285,11550,20475,17535,20475,19005,10605,12075})
FuncoesTabBtn.BackgroundTransparency = 1
FuncoesTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
FuncoesTabBtn.Font = Enum.Font.GothamBold
FuncoesTabBtn.TextSize = 9

local ConfigTabBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), TabMenu)
ConfigTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ConfigTabBtn.Position = UDim2.new(0.4, 0, 0, 0)
ConfigTabBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11655,11550,10710,11025,10815})
ConfigTabBtn.BackgroundTransparency = 1
ConfigTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ConfigTabBtn.Font = Enum.Font.GothamBold
ConfigTabBtn.TextSize = 9

local SpecterTabBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), TabMenu)
SpecterTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
SpecterTabBtn.Position = UDim2.new(0.6, 0, 0, 0)
SpecterTabBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10605,10395,12180,10605,11970})
SpecterTabBtn.BackgroundTransparency = 1
SpecterTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
SpecterTabBtn.Font = Enum.Font.GothamBold
SpecterTabBtn.TextSize = 9

local ScriptsTabBtn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), TabMenu)
ScriptsTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ScriptsTabBtn.Position = UDim2.new(0.8, 0, 0, 0)
ScriptsTabBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,11025,11760,12180,12075})
ScriptsTabBtn.BackgroundTransparency = 1
ScriptsTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ScriptsTabBtn.Font = Enum.Font.GothamBold
ScriptsTabBtn.TextSize = 9

local InicioFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11970,10185,11445,10605}), MainFrame)
InicioFrame.Size = UDim2.new(1, 0, 1, -76)
InicioFrame.Position = UDim2.new(0, 0, 0, 76)
InicioFrame.BackgroundTransparency = 1
InicioFrame.Visible = true

local FuncoesFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,11655,11340,11340,11025,11550,10815,7350,11970,10185,11445,10605}), MainFrame)
FuncoesFrame.Size = UDim2.new(1, 0, 1, -76)
FuncoesFrame.Position = UDim2.new(0, 0, 0, 76)
FuncoesFrame.BackgroundTransparency = 1
FuncoesFrame.ScrollBarThickness = 0
FuncoesFrame.Visible = false
local FuncoesLayout = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7455,11970,11025,10500,7980,10185,12705,11655,12285,12180}), FuncoesFrame)
FuncoesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
FuncoesLayout.SortOrder = Enum.SortOrder.LayoutOrder
FuncoesLayout.CellPadding = UDim2.new(0, 6, 0, 8)
FuncoesLayout.CellSize = UDim2.new(0.44, 0, 0, 35)
local FuncoesPadding = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8400,10185,10500,10500,11025,11550,10815}), FuncoesFrame)
FuncoesPadding.PaddingTop = UDim.new(0, 10)

local ConfigFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,11655,11340,11340,11025,11550,10815,7350,11970,10185,11445,10605}), MainFrame)
ConfigFrame.Size = UDim2.new(1, 0, 1, -76)
ConfigFrame.Position = UDim2.new(0, 0, 0, 76)
ConfigFrame.BackgroundTransparency = 1
ConfigFrame.ScrollBarThickness = 0
ConfigFrame.Visible = false
local ConfigLayout = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7980,11025,12075,12180,7980,10185,12705,11655,12285,12180}), ConfigFrame)
ConfigLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ConfigLayout.SortOrder = Enum.SortOrder.LayoutOrder
ConfigLayout.Padding = UDim.new(0, 8)
local ConfigPadding = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8400,10185,10500,10500,11025,11550,10815}), ConfigFrame)
ConfigPadding.PaddingTop = UDim.new(0, 10)

local SpecterFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,11655,11340,11340,11025,11550,10815,7350,11970,10185,11445,10605}), MainFrame)
SpecterFrame.Size = UDim2.new(1, 0, 1, -76)
SpecterFrame.Position = UDim2.new(0, 0, 0, 76)
SpecterFrame.BackgroundTransparency = 1
SpecterFrame.ScrollBarThickness = 0
SpecterFrame.Visible = false
local SpecterLayout = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7980,11025,12075,12180,7980,10185,12705,11655,12285,12180}), SpecterFrame)
SpecterLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SpecterLayout.SortOrder = Enum.SortOrder.LayoutOrder
SpecterLayout.Padding = UDim.new(0, 6)
local SpecterPadding = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8400,10185,10500,10500,11025,11550,10815}), SpecterFrame)
SpecterPadding.PaddingTop = UDim.new(0, 10)

local ScriptsFrame = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10395,11970,11655,11340,11340,11025,11550,10815,7350,11970,10185,11445,10605}), MainFrame)
ScriptsFrame.Size = UDim2.new(1, 0, 1, -76)
ScriptsFrame.Position = UDim2.new(0, 0, 0, 76)
ScriptsFrame.BackgroundTransparency = 1
ScriptsFrame.ScrollBarThickness = 0
ScriptsFrame.Visible = false
local ScriptsLayout = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7980,11025,12075,12180,7980,10185,12705,11655,12285,12180}), ScriptsFrame)
ScriptsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ScriptsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScriptsLayout.Padding = UDim.new(0, 8)
local ScriptsPadding = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8400,10185,10500,10500,11025,11550,10815}), ScriptsFrame)
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
local Avatar = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11445,10185,10815,10605,7980,10185,10290,10605,11340}), InicioFrame)
Avatar.Size = UDim2.new(0, 80, 0, 80)
Avatar.Position = UDim2.new(0.5, -40, 0.05, 0)
Avatar.Image = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({11970,10290,12600,12180,10920,12285,11445,10290,6090,4935,4935,12180,12705,11760,10605,6405,6825,12390,10185,12180,10185,11970,7560,10605,10185,10500,8715,10920,11655,12180,3990,11025,10500,6405}) .. player.UserId .. RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3990,12495,6405,5145,5565,5040,3990,10920,6405,5145,5565,5040})
Avatar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), Avatar).CornerRadius = UDim.new(1, 0)
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,8715,12180,11970,11655,11235,10605}), Avatar).Color = Color3.fromRGB(170, 0, 255)

local PlayerName = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
PlayerName.Size = UDim2.new(1, 0, 0, 20)
PlayerName.Position = UDim2.new(0, 0, 0.35, 0)
PlayerName.Text = player.DisplayName
PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1
PlayerName.Font = Enum.Font.GothamBold
PlayerName.TextSize = 16

local function getMyTag()
    for _, v in pairs(CREATOR_IDS) do if v == player.UserId then return RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11970,11025,10185,10500,11655,11970}) end end
    for _, v in pairs(ADMIN_IDS_RGB) do if v == player.UserId then return RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,10500,11445,11025,11550}) end end
    for _, v in pairs(VIP_IDS_BW) do if v == player.UserId then return RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9030,11025,11760}) end end
    return RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,12075,10605,11970})
end

local PlayerTag = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
PlayerTag.Size = UDim2.new(1, 0, 0, 20)
PlayerTag.Position = UDim2.new(0, 0, 0.45, 0)
PlayerTag.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10185,10815,3360,7245,11865,12285,11025,11760,10185,10500,10185,6090,3360}) .. getMyTag()
PlayerTag.TextColor3 = Color3.fromRGB(170, 0, 255)
PlayerTag.BackgroundTransparency = 1
PlayerTag.Font = Enum.Font.GothamSemibold
PlayerTag.TextSize = 13

local PingLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
PingLabel.Size = UDim2.new(1, 0, 0, 20)
PingLabel.Position = UDim2.new(0, 0, 0.55, 0)
PingLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,11025,11550,10815,6090,3360,7035,10185,11340,10395,12285,11340,10185,11550,10500,11655,4830,4830,4830})
PingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
PingLabel.BackgroundTransparency = 1
PingLabel.Font = Enum.Font.GothamSemibold
PingLabel.TextSize = 13

task.spawn(function()
    while task.wait(1) do
        if PingLabel and PingLabel.Parent then
            pcall(function()
                local pingValue = math_round(player:GetNetworkPing() * 1000)
                PingLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,11025,11550,10815,6090,3360}) .. pingValue .. RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3360,11445,12075})
            end)
        else
            break
        end
    end
end)

local UserIdLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
UserIdLabel.Size = UDim2.new(1, 0, 0, 20)
UserIdLabel.Position = UDim2.new(0, 0, 0.65, 0)
UserIdLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,7140,3360,10500,10185,3360,7035,11655,11550,12180,10185,6090,3360}) .. player.UserId
UserIdLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
UserIdLabel.BackgroundTransparency = 1
UserIdLabel.Font = Enum.Font.GothamSemibold
UserIdLabel.TextSize = 13

local creationDate = os.date(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3885,10500,4935,3885,11445,4935,3885,9345}), os.time() - (player.AccountAge * 86400))
local AccountAgeLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
AccountAgeLabel.Size = UDim2.new(1, 0, 0, 20)
AccountAgeLabel.Position = UDim2.new(0, 0, 0.75, 0)
AccountAgeLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11970,11025,10185,10500,10185,3360,10605,11445,6090,3360}) .. creationDate
AccountAgeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
AccountAgeLabel.BackgroundTransparency = 1
AccountAgeLabel.Font = Enum.Font.GothamSemibold
AccountAgeLabel.TextSize = 13

local CreditsLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), InicioFrame)
CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
CreditsLabel.Position = UDim2.new(0, 0, 0.88, 0)
CreditsLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,11970,11025,10185,10500,11655,11970,10605,12075,4620,3360,7980,12285,11340,12285,3360,7560,11025,11970,11655,12075,10920})
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
    local keyBox = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,11655,12600}), btn)
    keyBox.Size = UDim2.new(0, 22, 0, 22)
    keyBox.Position = UDim2.new(1, -26, 0.5, -11)
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(170, 0, 255)
    keyBox.Font = Enum.Font.GothamBold
    keyBox.TextSize = 11
    keyBox.Text = defaultKeyName
    keyBox.PlaceholderText = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
    Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), keyBox).CornerRadius = UDim.new(0, 4)

    keyBox.FocusLost:Connect(function()
        local inputChar = string_upper(string_sub(keyBox.Text, 1, 1))
        local success, code = pcall(function() return Enum.KeyCode[inputChar] end)
        
        if success and code and inputChar ~= RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({}) then
            bindKeys[action] = code
            keyBox.Text = inputChar
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10185,11445}) and not isSpamming then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,8295,9030,8295,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10185,11445,7035,10185,11445,10605,11970,10185}) and not spamCamAtivo then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,7035,6825,8085,7245,8610,6825,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,12075,11760}) and not espEnabled then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,8715,8400,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,11760}) and not tpEnabled then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,7980,7665,7035,7875,3360,8820,8400,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11340,12705}) and not flyEnabled then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,7980,9345,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10605,10605,10500}) and not speedEnabled then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,7245,7245,7140,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}) end
            if action == RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,11655,10395,11340,11025,11760}) and not noclipEnabled then btn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,8295,7035,7980,7665,8400,3360,9555})..inputChar..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}) end
        else
            keyBox.Text = bindKeys[action].Name
        end
    end)
end

local function addValueBox(btn, initialValue, callback)
    local valBox = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,11655,12600}), btn)
    local valBox = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,11655,12600}), btn)
    valBox.Size = UDim2.new(0, 30, 0, 22)
    valBox.Position = UDim2.new(1, -60, 0.5, -11)
    valBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    valBox.TextColor3 = Color3.fromRGB(0, 255, 150)
    valBox.Font = Enum.Font.GothamBold
    valBox.TextSize = 11
    valBox.Text = tostring(initialValue)
    valBox.PlaceholderText = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
    Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), valBox).CornerRadius = UDim.new(0, 4)

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
    local btn = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}), parent)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Size = UDim2.new(0.85, 0, 0, 30)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 10 
    Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local SpamBtn      = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,8295,9030,8295,3360,9555})..bindKeys.Spam.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}), FuncoesFrame)
local SpamCamBtn   = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,7035,6825,8085,7245,8610,6825,3360,9555})..bindKeys.SpamCamera.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}), FuncoesFrame)
local FarmBtn      = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,7245,7455,6825,8610,3360,8295,9030,8295,8715}), FuncoesFrame)
local EspBtn       = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,8715,8400,3360,9555})..bindKeys.Esp.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}), FuncoesFrame)
local TpBtn        = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,7980,7665,7035,7875,3360,8820,8400,3360,9555})..bindKeys.Tp.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765}), FuncoesFrame)
local ReBtn        = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,7245,7770,8295,7665,8190}), FuncoesFrame)
local AntiAdmBtn   = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7140,8085,6090,3360,8295,7350,7350}), FuncoesFrame)

addKeybindBox(SpamBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10185,11445}), bindKeys.Spam.Name)
addKeybindBox(SpamCamBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10185,11445,7035,10185,11445,10605,11970,10185}), bindKeys.SpamCamera.Name)
addKeybindBox(EspBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,12075,11760}), bindKeys.Esp.Name)
addKeybindBox(TpBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,11760}), bindKeys.Tp.Name)

FuncoesFrame.CanvasSize = UDim2.new(0, 0, 0, 180)

-----------------------------------------
--- ABA CONFIG (FLY, SPEED, NOCLIP, ANTIAFK)
-----------------------------------------
local FlyBtn   = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,7980,9345,3360,9555})..bindKeys.Fly.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}), ConfigFrame)
local SpeedBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,7245,7245,7140,3360,9555})..bindKeys.Speed.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}), ConfigFrame)
local NoclipBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,8295,7035,7980,7665,8400,3360,9555})..bindKeys.Noclip.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350}), ConfigFrame)
local AntiAfkBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7350,7875,6090,3360,8295,7350,7350}), ConfigFrame)

FlyBtn.Size = UDim2.new(0.85, 0, 0, 35)
SpeedBtn.Size = UDim2.new(0.85, 0, 0, 35)
NoclipBtn.Size = UDim2.new(0.85, 0, 0, 35)
AntiAfkBtn.Size = UDim2.new(0.85, 0, 0, 35)

ConfigFrame.CanvasSize = UDim2.new(0, 0, 0, 4 * 43 + 20)

addKeybindBox(FlyBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11340,12705}), bindKeys.Fly.Name)
addKeybindBox(SpeedBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,11760,10605,10605,10500}), bindKeys.Speed.Name)
addKeybindBox(NoclipBtn, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,11655,10395,11340,11025,11760}), bindKeys.Noclip.Name)

addValueBox(FlyBtn, flySpeedValue, function(val) flySpeedValue = val end)
addValueBox(SpeedBtn, walkSpeedValue, function(val) walkSpeedValue = val end)

-- LÓGICA AntiAFK
local antiAfkEnabled = false
local afkConn = nil

AntiAfkBtn.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    AntiAfkBtn.Text = antiAfkEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7350,7875,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7350,7875,6090,3360,8295,7350,7350})
    AntiAfkBtn.BackgroundColor3 = antiAfkEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if antiAfkEnabled then
        afkConn = player.Idled:Connect(function()
            local virtualUser = game:GetService(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9030,11025,11970,12180,12285,10185,11340,8925,12075,10605,11970}))
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
local InfYieldBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11550,10710,11025,11550,11025,12180,10605,3360,9345,11025,10605,11340,10500}), ScriptsFrame)
local VcCrasherBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9030,7035,3360,7035,8610,6825,8715,7560,7245,8610}), ScriptsFrame)
local KsxBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7875,12075,12600}), ScriptsFrame)

InfYieldBtn.Size = UDim2.new(0.85, 0, 0, 35)
VcCrasherBtn.Size = UDim2.new(0.85, 0, 0, 35)
KsxBtn.Size = UDim2.new(0.85, 0, 0, 35)

InfYieldBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({10920,12180,12180,11760,12075,6090,4935,4935,11970,10185,12495,4830,10815,11025,12180,10920,12285,10290,12285,12075,10605,11970,10395,11655,11550,12180,10605,11550,12180,4830,10395,11655,11445,4935,7245,10500,10815,10605,7665,9345,4935,11025,11550,10710,11025,11550,11025,12180,10605,12705,11025,10605,11340,10500,4935,11445,10185,12075,12180,10605,11970,4935,12075,11655,12285,11970,10395,10605})))()
end)

VcCrasherBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({10920,12180,12180,11760,12075,6090,4935,4935,11970,10185,12495,4830,10815,11025,12180,10920,12285,10290,12285,12075,10605,11970,10395,11655,11550,12180,10605,11550,12180,4830,10395,11655,11445,4935,8610,11655,11655,12180,11340,10605,10185,11235,4935,8715,12180,10185,11340,11235,11025,10605,4725,5250,4830,5040,4935,11970,10605,10710,12075,4935,10920,10605,10185,10500,12075,4935,11445,10185,11025,11550,4935,12390,10395,4830,11340,12285,10185})))()
end)

KsxBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,11340,10185,10290,4830,10395,11655,11445,4935,11235,12075,12600,5145,12075,4935,11235,12075,12600,4725,12075,4935,11970,10185,12495,4935,11445,10185,11025,11550,4935,8400,10185,11550,10605,11340})))()
end)

ScriptsFrame.CanvasSize = UDim2.new(0, 0, 0, 3 * 43 + 20)

-- LÓGICA NOCLIP
noclipEnabled = false
local noclipConn = nil

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,8295,7035,7980,7665,8400,3360,9555})..bindKeys.Noclip.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,8295,7035,7980,7665,8400,3360,9555})..bindKeys.Noclip.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350})
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)

    if noclipEnabled then
        noclipConn = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,10185,12075,10605,8400,10185,11970,12180})) and part.CanCollide then
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
    if flyEnabled and char and char:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
        local hrp = char.HumanoidRootPart
        local hum = char:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500}))
        
        if hum then hum.PlatformStand = true end
        
        flyBG = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,11655,10500,12705,7455,12705,11970,11655}), hrp)
        flyBG.P = 9e4
        flyBG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.cframe = hrp.CFrame
        
        flyBV = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,11655,10500,12705,9030,10605,11340,11655,10395,11025,12180,12705}), hrp)
        flyBV.velocity = Vector3.new(0, 0.1, 0)
        flyBV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        FlyBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,7980,9345,3360,9555})..bindKeys.Fly.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,8190})
        FlyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    else
        if char and char:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500})) then
            char.Humanoid.PlatformStand = false
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
        if flyBG then flyBG:Destroy() flyBG = nil end
        if flyBV then flyBV:Destroy() flyBV = nil end
        FlyBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,7980,9345,3360,9555})..bindKeys.Fly.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350})
        FlyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    end
end

RunService.RenderStepped:Connect(function()
    if flyEnabled and flyBV and flyBG and player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
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
    SpeedBtn.Text = speedEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,7245,7245,7140,3360,9555})..bindKeys.Speed.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,7245,7245,7140,3360,9555})..bindKeys.Speed.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,6090,3360,8295,7350,7350})
    SpeedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if not speedEnabled and player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500})) then
        player.Character.Humanoid.WalkSpeed = 16 
    end
end

RunService.RenderStepped:Connect(function()
    if speedEnabled and player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500})) then
        player.Character.Humanoid.WalkSpeed = walkSpeedValue
    end
end)
SpeedBtn.MouseButton1Click:Connect(toggleSpeed)

-----------------------------------------
--- LÓGICA AntiADM
-----------------------------------------
local antiAdmEnabled = false

local function showAdmWarning(name)
    local WarnLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), ScreenGui)
    WarnLabel.Size = UDim2.new(1, 0, 0, 50)
    WarnLabel.Position = UDim2.new(0, 0, 0.05, 0)
    WarnLabel.BackgroundTransparency = 1
    WarnLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({23730,16170,16800,25095,19320,15015,3360,6825,7140,8085,3360,7245,8190,8820,8610,8295,8925,3360,8190,8295,3360,8715,7245,8610,9030,7665,7140,8295,8610,6090,3360})..name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3360,23730,16170,16800,25095,19320,15015})
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
    AntiAdmBtn.Text = antiAdmEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7140,8085,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6825,11550,12180,11025,6825,7140,8085,6090,3360,8295,7350,7350})
    AntiAdmBtn.BackgroundColor3 = antiAdmEnabled and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(28, 28, 28)
end)

-----------------------------------------
--- ABA SPECTER
-----------------------------------------
local spectatingPlayer = nil
local sitEnabled = false
local sitConn = nil

local SpectAvatar = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11445,10185,10815,10605,7980,10185,10290,10605,11340}), SpecterFrame)
SpectAvatar.Size = UDim2.new(0, 60, 0, 60)
SpectAvatar.BackgroundTransparency = 1
SpectAvatar.Image = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), SpectAvatar).CornerRadius = UDim.new(1, 0)

local SpectNameLabel = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), SpecterFrame)
SpectNameLabel.Size = UDim2.new(0.9, 0, 0, 20)
SpectNameLabel.BackgroundTransparency = 1
SpectNameLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,11025,11550,10815,12285,20475,17745,11445,3360,12075,10605,11340,10605,10395,11025,11655,11550,10185,10500,11655})
SpectNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectNameLabel.Font = Enum.Font.GothamBold
SpectNameLabel.TextSize = 12

local SpectSearchBox = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,6930,11655,12600}), SpecterFrame)
SpectSearchBox.Size = UDim2.new(0.85, 0, 0, 25)
SpectSearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpectSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectSearchBox.Font = Enum.Font.GothamSemibold
SpectSearchBox.TextSize = 12
SpectSearchBox.PlaceholderText = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7140,11025,10815,11025,12180,10185,11970,3360,8925,12075,10605,11970,11550,10185,11445,10605,4935,8190,11655,11445,10605,4830,4830,4830})
SpectSearchBox.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8925,7665,7035,11655,11970,11550,10605,11970}), SpectSearchBox).CornerRadius = UDim.new(0, 6)

local function setSpectateTarget(targetPlayer)
    if not targetPlayer then return end
    spectatingPlayer = targetPlayer
    SpectNameLabel.Text = targetPlayer.DisplayName .. RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3360,4200,6720}) .. targetPlayer.Name .. RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({4305})
    SpectAvatar.Image = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({11970,10290,12600,12180,10920,12285,11445,10290,6090,4935,4935,12180,12705,11760,10605,6405,6825,12390,10185,12180,10185,11970,7560,10605,10185,10500,8715,10920,11655,12180,3990,11025,10500,6405}) .. targetPlayer.UserId .. RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({3990,12495,6405,5145,5565,5040,3990,10920,6405,5145,5565,5040})
    
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500})) then
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
    SpectSearchBox.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
end)

local SpectTpBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7665,11970,3360,10185,12180,20475,17745,3360,4200,8820,8400,4305}), SpecterFrame)
SpectTpBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local SpectSitBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10605,11550,12180,10185,11970,6090,3360,8295,7350,7350}), SpecterFrame)

local SpectStopBtn = createButton(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,10185,11970,10185,11970,3360,8715,11760,10605,10395,12180}), SpecterFrame)
SpectStopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

SpecterFrame.CanvasSize = UDim2.new(0, 0, 0, 60 + 20 + 25 + 35*3 + 40)

SpectTpBtn.MouseButton1Click:Connect(function()
    if spectatingPlayer and spectatingPlayer.Character and spectatingPlayer.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
        if player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
            player.Character.HumanoidRootPart.CFrame = spectatingPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)

SpectSitBtn.MouseButton1Click:Connect(function()
    sitEnabled = not sitEnabled
    SpectSitBtn.Text = sitEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10605,11550,12180,10185,11970,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10605,11550,12180,10185,11970,6090,3360,8295,7350,7350})
    SpectSitBtn.BackgroundColor3 = sitEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if sitConn then sitConn:Disconnect() sitConn = nil end
    
    if sitEnabled then
        sitConn = RunService.Heartbeat:Connect(function()
            if spectatingPlayer and spectatingPlayer.Character and player.Character then
                local targetHrp = spectatingPlayer.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180}))
                local myHrp = player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180}))
                local myHum = player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500}))
                
                if targetHrp and myHrp and myHum then
                    myHum.Sit = true
                    myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 1.5, 0)
                end
            end
        end)
    else
        local myHum = player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500}))
        if myHum then
            myHum.Sit = false
            myHum.Jump = true 
        end
    end
end)

SpectStopBtn.MouseButton1Click:Connect(function()
    spectatingPlayer = nil
    SpectNameLabel.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8190,11025,11550,10815,12285,20475,17745,11445,3360,12075,10605,11340,10605,10395,11025,11655,11550,10185,10500,11655})
    SpectAvatar.Image = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({})
    if player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500})) then
        camera.CameraSubject = player.Character.Humanoid
    end
    
    if sitEnabled then
        sitEnabled = false
        SpectSitBtn.Text = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,10605,11550,12180,10185,11970,6090,3360,8295,7350,7350})
        SpectSitBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        if sitConn then sitConn:Disconnect() sitConn = nil end
        local myHum = player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500}))
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
    TpBtn.Text = tpEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,7980,7665,7035,7875,3360,8820,8400,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,7980,7665,7035,7875,3360,8820,8400,3360,9555})..bindKeys.Tp.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765})
    TpBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
TpBtn.MouseButton1Click:Connect(toggleTp)
mouse.Button1Down:Connect(function()
    if tpEnabled and player.Character and player.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

isSpamming = false
local spamConn = nil
local function toggleSpam()
    isSpamming = not isSpamming
    SpamBtn.Text = isSpamming and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,8295,9030,8295,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,8295,9030,8295,3360,9555})..bindKeys.Spam.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765})
    SpamBtn.BackgroundColor3 = isSpamming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isSpamming then
        spamConn = RunService.Heartbeat:Connect(function()
            local charFolder = workspace:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,10920,10185,11970,10185,10395,12180,10605,11970,12075}))
            local target = charFolder and charFolder:FindFirstChild(player.Name) and charFolder[player.Name]:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,12180,11655,11970,10605,10815,10815}))
            if target then pcall(function() remoteEvent:FireServer(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,11970,12705,8715,12180,11655,11970,10605,10815,10815}), target, mouse.Hit.Position) end) end
        end)
    elseif spamConn then spamConn:Disconnect() spamConn = nil end
end
SpamBtn.MouseButton1Click:Connect(toggleSpam)

spamCamAtivo = false
local disparosPorFrame = 20
local function toggleSpamCam()
    spamCamAtivo = not spamCamAtivo
    SpamCamBtn.Text = spamCamAtivo and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,7035,6825,8085,7245,8610,6825,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8715,8400,6825,8085,3360,7035,6825,8085,7245,8610,6825,3360,9555})..bindKeys.SpamCamera.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765})
    SpamCamBtn.BackgroundColor3 = spamCamAtivo and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
SpamCamBtn.MouseButton1Click:Connect(toggleSpamCam)

RunService.Heartbeat:Connect(function()
    if not spamCamAtivo then return end
    local char = workspace:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,10920,10185,11970,10185,10395,12180,10605,11970,12075})) and workspace.Characters:FindFirstChild(player.Name)
    local remote = char and char:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7035,10185,11445,10605,11970,10185})) and char.Camera:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8610,10605,11445,11655,12180,10605}))
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
    FarmBtn.Text = isFarming and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,7245,7455,6825,8610,3360,8295,9030,8295,8715,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8400,7245,7455,6825,8610,3360,8295,9030,8295,8715})
    FarmBtn.BackgroundColor3 = isFarming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isFarming then task.spawn(function()
        while isFarming do
            local eggs = workspace:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,10815,10815,12075}))
            if player.Character and eggs then
                for _, obj in pairs(eggs:GetChildren()) do
                    if not isFarming then break end
                    if obj:IsA(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8085,11655,10500,10605,11340})) and string_find(obj.Name, RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,10815,10815})) then
                        local tp = obj:FindFirstChildWhichIsA(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,10185,12075,10605,8400,10185,11970,12180}), true)
                        if tp then player.Character.HumanoidRootPart.CFrame = tp.CFrame * CFrame.new(0, 8, 0) task.wait(2.5) end
                    end
                end
            end
            task.wait(1)
        end
    end) end
end)

espEnabled = false
local espFolder = Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7350,11655,11340,10500,10605,11970}), ScreenGui)
local function toggleEsp()
    espEnabled = not espEnabled
    EspBtn.Text = espEnabled and RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,8715,8400,6090,3360,8295,8190}) or RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7245,8715,8400,3360,9555})..bindKeys.Esp.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765})
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if not espEnabled then espFolder:ClearAllChildren() end
end
EspBtn.MouseButton1Click:Connect(toggleEsp)

task.spawn(function()
    while task.wait() do
        if espEnabled then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7560,10605,10185,10500})) then
                    local b = espFolder:FindFirstChild(v.Name) or Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({6930,11025,11340,11340,10290,11655,10185,11970,10500,7455,12285,11025}), espFolder)
                    b.Name = v.Name b.Adornee = v.Character.Head b.Size = UDim2.new(0,100,0,50) b.AlwaysOnTop = true
                    local l = b:FindFirstChild(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7980})) or Instance.new(RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({8820,10605,12600,12180,7980,10185,10290,10605,11340}), b)
                    l.Name = RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({7980}) l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.TextSize = 14
                    local r = v:GetRoleInGroup(GROUP_ID)
                    local d = math_floor((player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                    if ADMIN_ROLES[r] then l.TextColor3 = Color3.fromRGB(255,0,0) l.Text = v.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9660,11550,9555})..r..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9765,9660,11550})..d..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({11445})
                    else l.TextColor3 = Color3.fromRGB(255,255,255) l.Text = v.Name..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({9660,11550})..d..RXLLOJctqmhXFosNlmOSwrmTewAbgdYhutwecPSbModrsKKJtcvumTWvtbyyYRYaUxPITESlCL({11445}) end
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
