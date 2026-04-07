local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


-- [[ SISTEMA DE SEGURANÇA S7xhub v1.1.2 ]] --
local Players = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LIhRdNTdHPXqQuxsTsIuuItgPdOBXRpjCjQMPgSVjSaQTSYMtWhrdHvUGxheWVycw=='))
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
local VIP_IDS_BW = {648989434, 9987756245, 8450936471}

local function checkAuth(id)
    for _, v in pairs(CREATOR_IDS) do if v == id then return true end end
    for _, v in pairs(ADMIN_IDS_RGB) do if v == id then return true end end
    for _, v in pairs(VIP_IDS_BW) do if v == id then return true end end
    return false
end

if not checkAuth(player.UserId) then
    warn(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('iwhAaQIEqtqrwGADbdxpnHDwpOCXtbIzRJotBozmikcTQUfzNZhthcWUzd4aHViIHYxLjEuMjogQUNFU1NPIE5FR0FETy4='))
    return 
end

-- [[ INÍCIO DO SCRIPT ]] --
local ReplicatedStorage = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ABxfgVMsKclnqwfoSSXKqeIyJjpWowEfVKhHHrUSLTGLDHUZtIjZyjCUmVwbGljYXRlZFN0b3JhZ2U='))
local RunService = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('UwyyetktKavsnyZzvmGThKbHBsPtInGnIRRRrNviVBFQlbNaJzxYIbYUnVuU2VydmljZQ=='))
local UserInputService = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('bSYErBGErKBMXuElnTxXPxEQkPEWQbBtifzOTGpHDtCQlZLxuxQLWcpVXNlcklucHV0U2VydmljZQ=='))
local TeleportService = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('xTCvrhBOtVbvBuZQloEUTgPosvZoqysVclxCdJJwtEJvIRSsjjEqTQnVGVsZXBvcnRTZXJ2aWNl'))
local CoreGui = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('weFkSouHUDgMNGtUoIvaFiOKGUwBVrlEVEDpDslHWvXRkFBubpnlBLqQ29yZUd1aQ=='))
local TweenService = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('fcbWIpRUVSFpJxGKjeCEhLDkXQkkzMwfRvqtErAzYYUvzBeOjOOsUkcVHdlZW5TZXJ2aWNl'))

local targetParent = (RunService:IsStudio() or not CoreGui) and player:WaitForChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('xjcjXXuQWMeBcQzuTqPZcAPzVvYeyvfuOwMZoURgPgyTufFnpBPgCIrUGxheWVyR3Vp')) or CoreGui
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local remoteEvent = ReplicatedStorage:WaitForChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pXfJFRxNyohyobMxvOoEMMPnGZagteMTibznEvKjfpMigacumBzWTmPTW9kdWxlcw==')):WaitForChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('sUgTMYwajbeOtbqSnBjSQEylOCLanCMkHEKOSOLBVFleHBFRCGdUJJARXZlbnRz')):WaitForChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WyuUOvENqgtvRFCtuVZpEkXyTMTeuPdyQFMMeaTUlpdlFTMNzCMSPJeUmVtb3RlRXZlbnQ='))

-- DETECÇÃO DE PLATAFORMA
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local GROUP_ID = 34157675
local ADMIN_ROLES = {
    [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('NVntRMshpiqpcKRfTGMNlHqzJLgqdyGIQKvZnQuZMPNHuNoOJqJEztITWFya2V0aW5n')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jFHtkvEINapuXMoXBxCpdOPnmMuMXLUAiPNtlTbApURrrnRAtkbgSPTSW5mbHVlbmNlcg==')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('kPcLkLHnROkmrhrSktOXlAQEeXmVJENjLKJBIJTRKOLvelECaNUGIBZU29jaWFsIE1vZA==')] = true, 
    [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('kegMsfPYLNGfSTqyNjkxAovVtHLkUtbnATbVOrDbZaZPduGiOtcXOCRSGVscGVy')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('saguoUfuYwfZbbxTQvJhdPeYwxaIWjtokENxvADuhFIAeyNETFpgpyLU3VwZXJ2aXNvcg==')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hERXAJhOeZvtNJDbHBPxiXLPJInSaISFNgpnzrKNyxueYRDfrKDEhylTWFuYWdlcg==')] = true, 
    [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('MwoDBXZdKoNTBvLYaFVXCsrZEvvMWLsfrpuqNFLBdyhCMvsVVyRSugCQ29udHJpYnV0b3I=')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('eVNZmekAVHgqZHHEQZcJSlrNLjHnKKnXtPqveJaUQlfpZTtOHolHCNJRGV2ZWxvcGVy')] = true, [KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jgIgbuwjBpJbyjgyWPOQgNnSshdEsRvCvICEItZLrhymPXZVVZwjEOST3duZXI=')] = true
}

local ScreenGui = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('JOtlZGyfCoTfLFNFajGBVhloIHKmPoCBCtQHZMAYQRKNybzDwxGktnkU2NyZWVuR3Vp'), targetParent)
ScreenGui.Name = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('faqySKHSXFKqTNhuocPHYnRepQbUiNxdxHXVzuBurpvRAwQqyHkhiGZUzd4aHViX1BhbmVs')
ScreenGui.ResetOnSpawn = false

-----------------------------------------
--- NOTIFICAÇÃO PC (13 SEGUNDOS)
-----------------------------------------
if not isMobile then
    local NotifyFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('yDXsHOYXHZXSMpIVrkvjxvPAmfRsIHxpPRtUkRirkFJcNncpCyUyVZnVGV4dExhYmVs'), ScreenGui)
    NotifyFrame.Size = UDim2.new(0, 350, 0, 50)
    NotifyFrame.Position = UDim2.new(0.5, -175, 0.1, 0)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyFrame.BackgroundTransparency = 0.2
    NotifyFrame.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('aTYqtPVvWrFjFfVmkbyOamQJsOeBvYrhuEDPBXhqBuDZHjrjeYifaMpVVNFIEEgTEVUUkEgRyBQQVJBIEFCUklSIEUgRkVDSEFSIE8gUEFJTkVM')
    NotifyFrame.TextColor3 = Color3.fromRGB(170, 0, 255)
    NotifyFrame.Font = Enum.Font.GothamBold
    NotifyFrame.TextSize = 14
    Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WkIjMXmRMzSxxtFNHuZygBtOqYCrrKwxncUoJfpgzlTNmqfRBCdtzOsVUlDb3JuZXI='), NotifyFrame)
    Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LmUmyEOCrTnJLgbhLJNRuiUrtkvAHQnCcGvyLzHAltyslioTJcdFzeHVUlTdHJva2U='), NotifyFrame).Color = Color3.fromRGB(170, 0, 255)

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
local OpenBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gBRqrGtxDdYwwDePtJcDOjlzSymoUKqGqGJodmecvWNoOfoXgpmdtIBVGV4dEJ1dHRvbg=='), ScreenGui)
OpenBtn.Size = UDim2.new(0, 45, 0, 45)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -22)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('sfDSLAAETcDgxBxkJZlDttdeLvUyoxKnXcOWNAsVsnryQICwjmQfFXlUzc=')
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 18
OpenBtn.Visible = isMobile
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZOsUkImUqhizYzBHYhdXbYAeNbwrFvyaoNkYWjqCivEkIcvSzESRqZfVUlDb3JuZXI='), OpenBtn).CornerRadius = UDim.new(1, 0)
local Stroke = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('fOhwSHtlBWWqDAafBQwNtFTntomKFmSmuGcvfKHGcSjGuHgElhPNaAoVUlTdHJva2U='), OpenBtn)
Stroke.Color = Color3.fromRGB(170, 0, 255)
Stroke.Thickness = 2

-----------------------------------------
--- LÓGICA DE TAGS DE CABEÇA
-----------------------------------------
local function createOverheadTag(targetPlayer, text, color, mode)
    local char = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
    local head = char:WaitForChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('HxSFdXMpkBqsKneoNLUkeYLsguzHqLiFFoPcgfGbYdSADRSQyeWnZtcSGVhZA=='))
    if head:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gvivbbrQFuIVOYprxbgunXewwHVsdmvzgvAgbaCHYuzlwJTQgyZrQOaUzd4VGFn')) then head.S7xTag:Destroy() end
    local billboard = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PwgZLlHIrBVPodRqSkAgEzqUyxnvqKuUYKvdvSaLyZoCkIDzsXAjOSTQmlsbGJvYXJkR3Vp'), head)
    billboard.Name = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('bbCnfuiqMCLnBCRzSdUIxPTlOWICKIjUhGajAsCwGUPFGsYGKeJAcdqUzd4VGFn')
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 120, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 100 
    local label = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hRIHUydvQbVbAsZhIHlNfSiuDxBBtVFiRLxukoDHyXYglSuegbQnrWMVGV4dExhYmVs'), billboard)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 17
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.4
    if mode == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('UuNurEyhqpCVCLfmIQRtHpFFvWwYBXilZaIoZtsubWRLlUABgVlQQenUkdC') then
        task.spawn(function()
            local hue = 0
            while billboard and billboard.Parent do
                hue = hue + (1/200)
                label.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait()
            end
        end)
    elseif mode == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zaPkFVRrKvROcZWDvTqSVprlPBleduIjFeUIabZOKgcaulDQxCWjDTgQlc=') then
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
        if p == player then createOverheadTag(p, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ACmAxTSRtSCHnbCiPcuKePzpsUhhBpPyrYMdODQRfAggAljsgFjjqPCVXNlcg=='), Color3.fromRGB(170, 0, 255), nil) end
        for _, id in pairs(CREATOR_IDS) do if p.UserId == id then createOverheadTag(p, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('MMAajuplPbaRjFKNOcfQRWXNsNzIFGxqJRNaNBURdyVgvcXPoBolOJdQ3JpYWRvcg=='), nil, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('nnvNIdvZpsPeSugluJmPHxheyzlKpQADrdWDuXVaUXgQaQUyjbCuClEUkdC')) end end
        for _, id in pairs(ADMIN_IDS_RGB) do if p.UserId == id then createOverheadTag(p, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pAmrOWLqnbmayubjlGDMUEMcmWDOOCvXDjJdbxmijdtrEwmwSVvZMjWQWRtaW4='), nil, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('MybhFDorGsdtAFTThfvZPnCQRyAXlovhKzfJmGgXxkQVVrMSEoqxjMGUkdC')) end end
        for _, id in pairs(VIP_IDS_BW) do if p.UserId == id then createOverheadTag(p, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('BTQpfGOCMEkJDsxJtewMPlCyLKsqDJhulHYiKOfhSGFrjHIixdHIKFJVmlw'), nil, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gVYqkSnVJCobdRoMirfUuNPZZnImSPFHqnBHxzftMnhCcOPUfXJiWYbQlc=')) end end
    end
    p.CharacterAdded:Connect(setup)
    if p.Character then setup(p.Character) end
end
for _, v in pairs(Players:GetPlayers()) do applySpecialTags(v) end
Players.PlayerAdded:Connect(applySpecialTags)

-----------------------------------------
--- INTERFACE PRINCIPAL
-----------------------------------------
local MainFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pJvWGPtOUDMrvJLqpdSxTSmXQRPNykHnwvDmNmpFrCNqzsuRQTJIeoBRnJhbWU='), ScreenGui)
MainFrame.Name = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('iKWtZsVexswkDghsXBrbrDxeKnbSoBxOuBTtXuZZaxTnlfTSdVSBxBSTWFpbkZyYW1l')
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.05, 50, 0.2, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = true -- INICIA VISÍVEL
MainFrame.ClipsDescendants = true
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vCorzFbCYSgwDAczRCcpSwpAdXKDcTqldPhWZzCsXKwOrUQdajKMEhDVUlDb3JuZXI='), MainFrame).CornerRadius = UDim.new(0, 8)
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('KxjdqSolAwsPqWoWUIaKtXmFgWibOszQgLpiPoRclCNoYxsefBHVBKrVUlTdHJva2U='), MainFrame).Color = Color3.fromRGB(170, 0, 255)

local TopBar = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('mVsDEjfckJJUrEWYbvHtFUSCgoPTZLiMttFOtNlZQYbXRrSUQfHAtOlRnJhbWU='), MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local Title = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('mfNfWjYOZkDiLFsxNyTBvCEhEPrWjjKeMDGFOWlDPxbcTDodgJYnRMSVGV4dExhYmVs'), TopBar)
Title.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('JTlwYOgYDerKqirJIgvUwKOxXgXxzepDMzPoLabJqdeVQBbXaRQokYUUzd4aHViIHYxLjEuMg==')
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

local Divider = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('kCeJhykmOaeLJCbnCvqcIUXCJCjZZAPoSsznwPdJCzWlXFffshQEEaaRnJhbWU='), MainFrame)
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.Position = UDim2.new(0, 0, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Divider.BorderSizePixel = 0

local TabMenu = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('auCuHlELmMfiQMmBKjjSDXrsdPfVrOFwXeqaBXDZiOVgodikrluvtwBRnJhbWU='), MainFrame)
TabMenu.Size = UDim2.new(1, 0, 0, 35)
TabMenu.Position = UDim2.new(0, 0, 0, 41)
TabMenu.BackgroundTransparency = 1

local InicioTabBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TdrkFDjcxZdikqaPdyWsPrdyxlGOizRqRHyvaWytvUiPQzbuXrZUpRdVGV4dEJ1dHRvbg=='), TabMenu)
InicioTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
InicioTabBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('GitgRUcaWnKiXreLAEOlDnTmHqiyJTrSaSCYHJHzhpuehUQxmllMBWKSW7DrWNpbw==')
InicioTabBtn.BackgroundTransparency = 1
InicioTabBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
InicioTabBtn.Font = Enum.Font.GothamBold
InicioTabBtn.TextSize = 9

local FuncoesTabBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('oEFvwMsUiutGKrqcgBXlsPxLcBfBdxNKrsQQolRPYrjDoILIgbMieOTVGV4dEJ1dHRvbg=='), TabMenu)
FuncoesTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
FuncoesTabBtn.Position = UDim2.new(0.2, 0, 0, 0)
FuncoesTabBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IscKqRiccBjWDUqHeoriesGmfqMjRwOPxLEnASSLhQucKrwbIGnMzKwRnVuw6fDtWVz')
FuncoesTabBtn.BackgroundTransparency = 1
FuncoesTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
FuncoesTabBtn.Font = Enum.Font.GothamBold
FuncoesTabBtn.TextSize = 9

local ConfigTabBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('DzoWnjZjoskwvkKkioakKgNDTvZZEvsLAQhzAmXoaJYRaZbHPympDpaVGV4dEJ1dHRvbg=='), TabMenu)
ConfigTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ConfigTabBtn.Position = UDim2.new(0.4, 0, 0, 0)
ConfigTabBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('UTopRkneTGBjoGcJmkrAbXIYurMqcIvwFgILOJeUcXMaywgCVMNbVssQ29uZmln')
ConfigTabBtn.BackgroundTransparency = 1
ConfigTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ConfigTabBtn.Font = Enum.Font.GothamBold
ConfigTabBtn.TextSize = 9

local SpecterTabBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hLtZBJFogdNgjwZKfDseuUJSNzAUmUupqtxrLpXrbtAKuBVEVEoMXqoVGV4dEJ1dHRvbg=='), TabMenu)
SpecterTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
SpecterTabBtn.Position = UDim2.new(0.6, 0, 0, 0)
SpecterTabBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('CnChIrHbgTQonhbmKgjrSnldpcrOFSydrOdOrLllMAddPsaCAqReqFYU3BlY3Rlcg==')
SpecterTabBtn.BackgroundTransparency = 1
SpecterTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
SpecterTabBtn.Font = Enum.Font.GothamBold
SpecterTabBtn.TextSize = 9

local ScriptsTabBtn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('oTZhMVRYnZVJcUDMRZJDeCThAqcwXCwQLWXeqJztBrWftJDbytbKQOVVGV4dEJ1dHRvbg=='), TabMenu)
ScriptsTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
ScriptsTabBtn.Position = UDim2.new(0.8, 0, 0, 0)
ScriptsTabBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('DjLUoPEIpgopJOsxqxjoXePhwzgIasEmIVjdtaRKbZaQOecriPzkpdvU2NyaXB0cw==')
ScriptsTabBtn.BackgroundTransparency = 1
ScriptsTabBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ScriptsTabBtn.Font = Enum.Font.GothamBold
ScriptsTabBtn.TextSize = 9

local InicioFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IqTHlVmFeogtcIhwnRULANFXcsYJHWXekmFSGMrKxJYDVUawesbumVTRnJhbWU='), MainFrame)
InicioFrame.Size = UDim2.new(1, 0, 1, -76)
InicioFrame.Position = UDim2.new(0, 0, 0, 76)
InicioFrame.BackgroundTransparency = 1
InicioFrame.Visible = true

local FuncoesFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZhEAhgrMGDyXeEYdTZoDHENSNAIOzOmiRrGVPrheQjmeITxFKhJFEhRU2Nyb2xsaW5nRnJhbWU='), MainFrame)
FuncoesFrame.Size = UDim2.new(1, 0, 1, -76)
FuncoesFrame.Position = UDim2.new(0, 0, 0, 76)
FuncoesFrame.BackgroundTransparency = 1
FuncoesFrame.ScrollBarThickness = 0
FuncoesFrame.Visible = false
local FuncoesLayout = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zBLrtztmmhBZWtdqUVBquisbXivouVuZbLyrItKnjBAdKRsSJWAlPQaVUlHcmlkTGF5b3V0'), FuncoesFrame)
FuncoesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
FuncoesLayout.SortOrder = Enum.SortOrder.LayoutOrder
FuncoesLayout.CellPadding = UDim2.new(0, 6, 0, 8)
FuncoesLayout.CellSize = UDim2.new(0.44, 0, 0, 35)
local FuncoesPadding = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('YlURCQUbFcAxKmrXDIziEhbRjnuPJJvLgoySMMNmzgoYweGLYEnbfdjVUlQYWRkaW5n'), FuncoesFrame)
FuncoesPadding.PaddingTop = UDim.new(0, 10)

local ConfigFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('MctbGjnYvmaydJJQoQiWoaBJuQPrZdMAIeLoQXbWfmvvyypkZKiRUbRU2Nyb2xsaW5nRnJhbWU='), MainFrame)
ConfigFrame.Size = UDim2.new(1, 0, 1, -76)
ConfigFrame.Position = UDim2.new(0, 0, 0, 76)
ConfigFrame.BackgroundTransparency = 1
ConfigFrame.ScrollBarThickness = 0
ConfigFrame.Visible = false
local ConfigLayout = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('UwaIAhTxUJmLHMKIepCMDEOOewBDVsbtKfwRbPxaGJnMohFpsxtzVzvVUlMaXN0TGF5b3V0'), ConfigFrame)
ConfigLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ConfigLayout.SortOrder = Enum.SortOrder.LayoutOrder
ConfigLayout.Padding = UDim.new(0, 8)
local ConfigPadding = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('eUlgDTHphNOYmxhzoljhKCNIBwqrjfJSKueUXfrFDBxQxMcFEqkZrayVUlQYWRkaW5n'), ConfigFrame)
ConfigPadding.PaddingTop = UDim.new(0, 10)

local SpecterFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZusIhYywlVLqooQfNYOusPLZRSgxwfrFvAeDoyjhNfaqXUhQLtGRIUyU2Nyb2xsaW5nRnJhbWU='), MainFrame)
SpecterFrame.Size = UDim2.new(1, 0, 1, -76)
SpecterFrame.Position = UDim2.new(0, 0, 0, 76)
SpecterFrame.BackgroundTransparency = 1
SpecterFrame.ScrollBarThickness = 0
SpecterFrame.Visible = false
local SpecterLayout = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('EixYEPdeSEyArswcMPKuJYSsMqIUGxpRtQFCoimTdtbbiyIyYhUrTzeVUlMaXN0TGF5b3V0'), SpecterFrame)
SpecterLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SpecterLayout.SortOrder = Enum.SortOrder.LayoutOrder
SpecterLayout.Padding = UDim.new(0, 6)
local SpecterPadding = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('emOaeHdjdAMGFGvgRMVhtYAcKIwBtySlDkEegKlqYdOutNoivPTBIsoVUlQYWRkaW5n'), SpecterFrame)
SpecterPadding.PaddingTop = UDim.new(0, 10)

local ScriptsFrame = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TKEtTNaSPpZdtQPynftXcoISNydOIBmboCWAnRMDpDmqRVpysBjpGAxU2Nyb2xsaW5nRnJhbWU='), MainFrame)
ScriptsFrame.Size = UDim2.new(1, 0, 1, -76)
ScriptsFrame.Position = UDim2.new(0, 0, 0, 76)
ScriptsFrame.BackgroundTransparency = 1
ScriptsFrame.ScrollBarThickness = 0
ScriptsFrame.Visible = false
local ScriptsLayout = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('iypGjHuYkdRKJKGmqcsGgXbJycCuosidqiMvHKJWHoBmzjqEVQZlIYvVUlMaXN0TGF5b3V0'), ScriptsFrame)
ScriptsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ScriptsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScriptsLayout.Padding = UDim.new(0, 8)
local ScriptsPadding = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('QkEwSJxVQRQKCZlaFQQCbHwntZUHtLjiYBMPiKIWpZQLnfzPRUapcTsVUlQYWRkaW5n'), ScriptsFrame)
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
local Avatar = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gFXqdUczlfDrwuYfqpEFwfcbjNmDSuNcUuDdKYmaBHnLmZUfjcIizaJSW1hZ2VMYWJlbA=='), InicioFrame)
Avatar.Size = UDim2.new(0, 80, 0, 80)
Avatar.Position = UDim2.new(0.5, -40, 0.05, 0)
Avatar.Image = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('abtVhBMTrofLTTlifqahDipUJNoRYliLkzzBFlqYdetslThrBuHmfKpcmJ4dGh1bWI6Ly90eXBlPUF2YXRhckhlYWRTaG90JmlkPQ==') .. player.UserId .. KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('wHeYzOtLoXCuJzhRatpACUKSqniWFmIdfjSBZJuaHAUHjPsGYOIxOjHJnc9MTUwJmg9MTUw')
Avatar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('dDKSrTuidzFTxgXnqeuDQKEKswpFmBKnKCbiUUuLaBbSSDPhymFxNTcVUlDb3JuZXI='), Avatar).CornerRadius = UDim.new(1, 0)
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gZWhjAXZsCtyWiHvPGUcBhQMbTscpOMMarszLVhcuZTnPsBGtesNEkuVUlTdHJva2U='), Avatar).Color = Color3.fromRGB(170, 0, 255)

local PlayerName = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('CGUgtIiMFsJFipFnvbSYVVUkcFQnmzpDUgCrlihJoKbElVvjpnQvaEIVGV4dExhYmVs'), InicioFrame)
PlayerName.Size = UDim2.new(1, 0, 0, 20)
PlayerName.Position = UDim2.new(0, 0, 0.35, 0)
PlayerName.Text = player.DisplayName
PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1
PlayerName.Font = Enum.Font.GothamBold
PlayerName.TextSize = 16

local function getMyTag()
    for _, v in pairs(CREATOR_IDS) do if v == player.UserId then return KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('yXXRojINtQNgBVIFzjdXvidJnXEWTaiORNPdljNXopMIhsOEFXWFwvMQ3JpYWRvcg==') end end
    for _, v in pairs(ADMIN_IDS_RGB) do if v == player.UserId then return KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('VkLxSvDvfYXejNtXhTmHDXYbHJhPTmrhqgodAnoJskuJPYLDnHuUfNTQWRtaW4=') end end
    for _, v in pairs(VIP_IDS_BW) do if v == player.UserId then return KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IvMYeIGemfWIbTFzxTkHJgmltCtKjsErPpzrrorfxMwIOLkVMCqwlfAVmlw') end end
    return KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PchgdMeQoZxfCDJyeXdqZLAJnSauVVJPGKvywqDZeRLFDxmCEMmfTBnVXNlcg==')
end

local PlayerTag = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LqgqifforoTHFSeSfACHwZnMimVkCCqZgQlvBKMNuYLOPfUtCyZOCsmVGV4dExhYmVs'), InicioFrame)
PlayerTag.Size = UDim2.new(1, 0, 0, 20)
PlayerTag.Position = UDim2.new(0, 0, 0.45, 0)
PlayerTag.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('wvQYFHZriMyREJiYdEBPMxBPxZQzlDMNSRqFSpYawjCFFzDdlXianwLVGFnIEVxdWlwYWRhOiA=') .. getMyTag()
PlayerTag.TextColor3 = Color3.fromRGB(170, 0, 255)
PlayerTag.BackgroundTransparency = 1
PlayerTag.Font = Enum.Font.GothamSemibold
PlayerTag.TextSize = 13

local PingLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('dpKQiwSDQSEhVFXXEujLHTtGSBZjkdJZBphfOikchYuGgbEEamrmkPAVGV4dExhYmVs'), InicioFrame)
PingLabel.Size = UDim2.new(1, 0, 0, 20)
PingLabel.Position = UDim2.new(0, 0, 0.55, 0)
PingLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('kAmjnlaNRPCtjLcgXKnWoMnYSNUkUhNxKqMUXEvBOAYzgfZydzPpvvLUGluZzogQ2FsY3VsYW5kby4uLg==')
PingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
PingLabel.BackgroundTransparency = 1
PingLabel.Font = Enum.Font.GothamSemibold
PingLabel.TextSize = 13

task.spawn(function()
    while task.wait(1) do
        if PingLabel and PingLabel.Parent then
            pcall(function()
                local pingValue = math_round(player:GetNetworkPing() * 1000)
                PingLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('FAmWHwcvwikpthdVhIvcTDAZaEMkaBqulMzWgkIUzPDNoGhKHyobstKUGluZzog') .. pingValue .. KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('QkRhBGXDFuyfkrxrjXstSBCyFvpwawACydgBrlJhMVktfXUjZnvMXPhIG1z')
            end)
        else
            break
        end
    end
end)

local UserIdLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('qaLdMeyFtFHzlxHNDuQBqFBlVunkCgcQYDDLCMwQiQDhdDNCxaIxNytVGV4dExhYmVs'), InicioFrame)
UserIdLabel.Size = UDim2.new(1, 0, 0, 20)
UserIdLabel.Position = UDim2.new(0, 0, 0.65, 0)
UserIdLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('bsrafxytzsQoTSjfKVRbwcIYAUlnCtybeDqhZjremOVQSDORyWNkatsSUQgZGEgQ29udGE6IA==') .. player.UserId
UserIdLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
UserIdLabel.BackgroundTransparency = 1
UserIdLabel.Font = Enum.Font.GothamSemibold
UserIdLabel.TextSize = 13

local creationDate = os.date(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('CrnibaiMZtgpcerItXSAHeHqSgWOxtmGgSOVsVZTcBSGBdDZFRzvVdMJWQvJW0vJVk='), os.time() - (player.AccountAge * 86400))
local AccountAgeLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('KRaMgvIjZwQxKjnUjKdLPKpAGXHOYakGfTlXJJcQYdvvnWYnZJtrZrBVGV4dExhYmVs'), InicioFrame)
AccountAgeLabel.Size = UDim2.new(1, 0, 0, 20)
AccountAgeLabel.Position = UDim2.new(0, 0, 0.75, 0)
AccountAgeLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('nnSRPYYdbRVRhfdfZNpPpjpmxIFOgVtiXTkVibnDldifYQwvsBkmqUqQ3JpYWRhIGVtOiA=') .. creationDate
AccountAgeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
AccountAgeLabel.BackgroundTransparency = 1
AccountAgeLabel.Font = Enum.Font.GothamSemibold
AccountAgeLabel.TextSize = 13

local CreditsLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('DVDyeFGgyZTQaXyQjWmngQIAPKoSXrLBaUICvFFTuXtxcJsZsHbqFyzVGV4dExhYmVs'), InicioFrame)
CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
CreditsLabel.Position = UDim2.new(0, 0, 0.88, 0)
CreditsLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('BaVgzTboeeBdEiwVIBHgunwtyuFjbbVhpLcodwbaUwJkKXMjKzojyXOQ3JpYWRvcmVzLCBMdWx1IEhpcm9zaA==')
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
    local keyBox = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('HVHQgxxZBjQdCUKOkToHOZUTsceeyTsDADbFmzSHCqigkaxiCIukaZKVGV4dEJveA=='), btn)
    keyBox.Size = UDim2.new(0, 22, 0, 22)
    keyBox.Position = UDim2.new(1, -26, 0.5, -11)
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(170, 0, 255)
    keyBox.Font = Enum.Font.GothamBold
    keyBox.TextSize = 11
    keyBox.Text = defaultKeyName
    keyBox.PlaceholderText = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('feJopEtbfGSLpXWoBzUJDCyeBSYXUgcKvwbIrRvfLNXMEndHBdTMWiO')
    Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('BeOsSuMewyTZDTuyQdmewlAoAAuTiasMsgAKNJggeSMLdoldVMRlIgQVUlDb3JuZXI='), keyBox).CornerRadius = UDim.new(0, 4)

    keyBox.FocusLost:Connect(function()
        local inputChar = string_upper(string_sub(keyBox.Text, 1, 1))
        local success, code = pcall(function() return Enum.KeyCode[inputChar] end)
        
        if success and code and inputChar ~= KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('HUjxqqnaAodEhffqBieLpRLxVlRPpMnPmrBYdVKitXNdLKJAMYMUQrK') then
            bindKeys[action] = code
            keyBox.Text = inputChar
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hMviGyPpTQnDKEtVwbxvXotzofnsrVSSOrHifwaiXPdokYIKarQwvDlU3BhbQ==') and not isSpamming then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('RglgTaiHhddFZeREfgoVFppneBfuuCzOCWmwLqhLCXhFzJybkWvNwowU1BBTSBPVk8gWw==')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IrQlPEinmcSjZruyponvUhjYCxIcnbmMWPskXqzmQyBiFOboghHKSmcXQ==') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gpGdKVRbYomszURlAqqpmznFEpqdwcCKeJETpPBbYOiyyyistIwYdFSU3BhbUNhbWVyYQ==') and not spamCamAtivo then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('OeLUZvwZTWYSYCnycyZOpQUIlPepBGVsOeqaOhlJaeYxHLoAQnNNxhcU1BBTSBDQU1FUkEgWw==')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('RMXoxhOKInAnnIeMgMBDocqkenPNXyzITKSZWGnVlUItXPEaYKuVDHbXQ==') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TENqSvlKOcNxoSfriChJAOzmioCGqKcFDGKwcBQuUrtCEzkneGsRAbcRXNw') and not espEnabled then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('aVShOqRWwcVJqfeaofaUzDbQhZMisJuqtRuhGPnvMNymIZKsDqkgeXuRVNQIFs=')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('lOqVHerLvmaSckdwhTDuwczYoJZyUepiISINVRxKVzQlaQdpVLWjxVLXQ==') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WdfhNeKVkLVVjlWlqiumlFxkcEfTKewBYrzcEZIygoEpGqHVZhhvIchVHA=') and not tpEnabled then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('DFGFjpZbXyiFhPJCrBSPaQAFetAEEpSfrNZMKfcBjTzYILJLxwGKMmgQ0xJQ0sgVFAgWw==')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('aplXeOFBQsFGfWJOcPmQshaccffdTljojVaIdbLpPIEiqGodLVrhfAaXQ==') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('rdytuztCZUIRdUSNfysGEGMdvFCEDrktfsYGaDYIlzROJEgRviQHGFSRmx5') and not flyEnabled then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('oCZKWXokOSFmwqHpuUshRoTdrMMQmmiJaaBTmauItVwAZpapaebOWSwRkxZIFs=')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('dogZFhrbTwalsyCTJJINxfvHYVcyVPCqUCEglrVlOpbsVatHsTRuUscXTogT0ZG') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PnJxXBteEDoIQoBTpPrpxZHXlUcTMkMSAPKpaeTWcdJXNTWgdhpUVldU3BlZWQ=') and not speedEnabled then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('lwvislVzFbEySNoQfmtkRlnCuILLdIyQhhnokTkZkDPMJCHlEZecYqNU1BFRUQgWw==')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZvmWhsttbDnIitnHvsXAqMTCslJDNgqTisAiudtxxTrUZoZvHChKnhSXTogT0ZG') end
            if action == KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pRWOItmyVftcqqCWXhqCmNnnXXSqCLtnwFHkvAONIJIdQusFdQDxwScTm9jbGlw') and not noclipEnabled then btn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jYVAlcBzbpslBSVyCBkkJkQimwnWhEzNyaVhWBoMqhKXKvcsKtycaBoTk9DTElQIFs=')..inputChar..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('HsyWtaWxpdshyPPfDCGFoFPbbwNXPHRdHjCZesKWDqaBZMiCikKLnURXTogT0ZG') end
        else
            keyBox.Text = bindKeys[action].Name
        end
    end)
end

local function addValueBox(btn, initialValue, callback)
    local valBox = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LgLHBaRBLfhTvoCcmWzITFmwXTpltyMTwzEOrTvvNdKDyYCExCmrLmXVGV4dEJveA=='), btn)
    valBox.Size = UDim2.new(0, 30, 0, 22)
    valBox.Position = UDim2.new(1, -60, 0.5, -11)
    valBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    valBox.TextColor3 = Color3.fromRGB(0, 255, 150)
    valBox.Font = Enum.Font.GothamBold
    valBox.TextSize = 11
    valBox.Text = tostring(initialValue)
    valBox.PlaceholderText = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('wgZYppINfLEptrnncQZAaeMwNtgrJTyMwQJiLLUTrPrzTDAzZIcBGvT')
    Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('OfvKqHNblbqWgNEhxITOrRPtHVQhgPDoXYHQGRymxFYyrPfaXqdgkPsVUlDb3JuZXI='), valBox).CornerRadius = UDim.new(0, 4)

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
    local btn = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('iarLNBAGekRgfiyFrSatyMNXcjvhiiKPLhOBNVLTIESEdvbUDkHQKchVGV4dEJ1dHRvbg=='), parent)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Size = UDim2.new(0.85, 0, 0, 30)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 10 
    Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('QrdeoqQuKSvxktJfRVeOaSxxnifvwNaPhNMPfZZudLeqtmkOdIOgPlHVUlDb3JuZXI='), btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local SpamBtn      = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('GJkXdcSuKMyeqiBubDLqmsQiyBrvkRhvOiqCVqVwoacMFhCjzUcXDGJU1BBTSBPVk8gWw==')..bindKeys.Spam.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zirEHyZzWnqvPjpEjJCSULiVrODfbPsayDwgbTapIYkJFjMtLyVIBddXQ=='), FuncoesFrame)
local SpamCamBtn   = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('yosrcymbKYLwAXWNRDTGIsapSdfmIyrhQJFsBUkjxZTwIbIbYKwVqmeU1BBTSBDQU1FUkEgWw==')..bindKeys.SpamCamera.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WrNtcwuagYhubEbqutldkWpAvkDaaqkSizHTuTdhgJkPFKjMREBlDKdXQ=='), FuncoesFrame)
local FarmBtn      = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('OSBklMngDAblphtRbmtILuDWMMLYNoDMwtJkCmhWhDPGxKoZtCflDQrUEVHQVIgT1ZPUw=='), FuncoesFrame)
local EspBtn       = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gTGihpuVIAMNedJNXHxlMAnkeeVIqbewoUBsJgmObcGwsPvkKionhWRRVNQIFs=')..bindKeys.Esp.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('nzVOmWPMRAsYYLWSUAwJRqRiRfUZYqFwAJbSrkCVgZFmlWgafZmVKPmXQ=='), FuncoesFrame)
local TpBtn        = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('sumwXMpxoggxvLJUKAVRIOYtHkANlcoqnjkkRTkslTnqlVCmhdqSNAFQ0xJQ0sgVFAgWw==')..bindKeys.Tp.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('QkevytptGnoKFQBbFOHvnruGdzpwVBErIPxsMokGdmWpBGxFeAJnebuXQ=='), FuncoesFrame)
local ReBtn        = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('abPQxcQxYSZVVAdffLSgWDjJPyiqbJbGwLRnywEdKlYOhosdWWHitHzUkVKT0lO'), FuncoesFrame)
local AntiAdmBtn   = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('fgAQClDSAmPwnyKyyMEzZZGKFzochekqmgJTQRfkFIzQAJZMdPWlJsgQW50aUFETTogT0ZG'), FuncoesFrame)

addKeybindBox(SpamBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('efItjOifdcpjQBrpqhAVbLMqdpQHPwDpSpTtSXtGLwFPluwEQlehLMfU3BhbQ=='), bindKeys.Spam.Name)
addKeybindBox(SpamCamBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('onCajVeIlwPxzEKLuXdKxvnpRguFOsdWecXOLuIozfqqCfFDbnvUALmU3BhbUNhbWVyYQ=='), bindKeys.SpamCamera.Name)
addKeybindBox(EspBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('xCEvkdttuYdptEZLEwLHzFdmOwPyakovIBTESRPTafRaDrDGMKQnesgRXNw'), bindKeys.Esp.Name)
addKeybindBox(TpBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('JdekAQqhIaBxbMflSCZEXUspRrAxQHIGJXKmJshyPhAYpefqOxkWFXqVHA='), bindKeys.Tp.Name)

FuncoesFrame.CanvasSize = UDim2.new(0, 0, 0, 180)

-----------------------------------------
--- ABA CONFIG (FLY, SPEED, NOCLIP, ANTIAFK)
-----------------------------------------
local FlyBtn   = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zDOxLgoRwDmzmNYwhdGQPUuYjKvyvYvrjIAaMGDzEEjHHVcNvbwxmGWRkxZIFs=')..bindKeys.Fly.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('JMxTMLnXmneGWgGiDoyUNIvORUNEqpOtpNCfMxhHkQtkseexVoUoLaWXTogT0ZG'), ConfigFrame)
local SpeedBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TllpphPLBgWKhxcwdAMyrAWKnUkCXmQOnIbeAvblIJLfRdxGAgsYyIiU1BFRUQgWw==')..bindKeys.Speed.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('uDircJoMKCPIGQoDOCdCrdXcHZtVLNATyWIRPYHzloZrEokFgHrerauXTogT0ZG'), ConfigFrame)
local NoclipBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ywBUpQPipackkrsvlmYCJaObazSjeupqtTQhljtekROoluigRgYCDtwTk9DTElQIFs=')..bindKeys.Noclip.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('XOkMsOzxHlPWSuwIwpGlXZqGuxrSjNnJjFmvsDpfKcGbntryeVvUxEKXTogT0ZG'), ConfigFrame)
local AntiAfkBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('XZvrDiLEdjYJOaZpgVOBgwdhGhvhWYJXKaKAWaCURXlvlYSnNHYyxVoQW50aUFGSzogT0ZG'), ConfigFrame)

FlyBtn.Size = UDim2.new(0.85, 0, 0, 35)
SpeedBtn.Size = UDim2.new(0.85, 0, 0, 35)
NoclipBtn.Size = UDim2.new(0.85, 0, 0, 35)
AntiAfkBtn.Size = UDim2.new(0.85, 0, 0, 35)

ConfigFrame.CanvasSize = UDim2.new(0, 0, 0, 4 * 43 + 20)

addKeybindBox(FlyBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('GMqRRjmjTqMojfLEYwQXSWmqiibmkKOnyzYkyFgRrQskUUJuhjBFkYgRmx5'), bindKeys.Fly.Name)
addKeybindBox(SpeedBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('UeJlfgczcGDKjfsFUuAwyMAUDppqwQyNvqmlzGXYdllbSuQUksiIzNcU3BlZWQ='), bindKeys.Speed.Name)
addKeybindBox(NoclipBtn, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vghIgwdBrnGimMTLQpqHcekxVumldFrfLPsvRrVFndNExFGIUnttQHWTm9jbGlw'), bindKeys.Noclip.Name)

addValueBox(FlyBtn, flySpeedValue, function(val) flySpeedValue = val end)
addValueBox(SpeedBtn, walkSpeedValue, function(val) walkSpeedValue = val end)

-- LÓGICA AntiAFK
local antiAfkEnabled = false
local afkConn = nil

AntiAfkBtn.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    AntiAfkBtn.Text = antiAfkEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jdCLqJJLxxmRfmwKLOCndBaBfnZmHxVYinQcaWyPEwqntrzfcANWcQBQW50aUFGSzogT04=') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('VjeCMrGPtZvhIxBOxMJXtWAUPgtZrTBxzKNYrGanbdvMmWNfMZGPeobQW50aUFGSzogT0ZG')
    AntiAfkBtn.BackgroundColor3 = antiAfkEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if antiAfkEnabled then
        afkConn = player.Idled:Connect(function()
            local virtualUser = game:GetService(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pKwlGbRnktDMXxanifXGLEdQoleKZvPlTEpNRNRZadwnXQEUoXHzPVuVmlydHVhbFVzZXI='))
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
local InfYieldBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vrHoBpPvieMEwRZCpilpssDTiVosVUDbCGFuwongBwPJVEYoiwpFoxOSW5maW5pdGUgWWllbGQ='), ScriptsFrame)
local VcCrasherBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WLbaEopLGBBUtdKnZBFrmDOikErbbBvmsqBByUPAjexvKQcgCMCKeadVkMgQ1JBU0hFUg=='), ScriptsFrame)
local KsxBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('howfAgAvMCVZaCQLUKJjRZpDBZmmqfMeNJttwwqqcTtufSYAHRXKqzMS3N4'), ScriptsFrame)

InfYieldBtn.Size = UDim2.new(0.85, 0, 0, 35)
VcCrasherBtn.Size = UDim2.new(0.85, 0, 0, 35)
KsxBtn.Size = UDim2.new(0.85, 0, 0, 35)

InfYieldBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('SRIgTGyVlBXJxfBJvyDzBdKabQtQJmdSNciJIrGCsOMqpxsDmRTiCIhaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0VkZ2VJWS9pbmZpbml0ZXlpZWxkL21hc3Rlci9zb3VyY2U=')))()
end)

VcCrasherBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gwBphFfJsddhfFrzdUXCsVFdVHGUGunxxaNOxMbljCMRmQyVyrqWMUgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1Jvb3RsZWFrL1N0YWxraWUtMi4wL3JlZnMvaGVhZHMvbWFpbi92Yy5sdWE=')))()
end)

KsxBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('cIRhIJvUDLGtHezDESpCmRROmfcNJpKuzswTmOTMbdPyDveoBqIFagMaHR0cHM6Ly9naXRsYWIuY29tL2tzeDFzL2tzeC1zL3Jhdy9tYWluL1BhbmVs')))()
end)

ScriptsFrame.CanvasSize = UDim2.new(0, 0, 0, 3 * 43 + 20)

-- LÓGICA NOCLIP
noclipEnabled = false
local noclipConn = nil

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hJLDelVvfQuWYMNlkhcpBGGfPOQcYBhDgojeiFYOlzfcfqiqvsBXGgRTk9DTElQIFs=')..bindKeys.Noclip.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('AjmgkFxpcLqSDXfnlNQUYZlqWqvybrWbFDRvjrxwnumdwFSzHPsaJAGXTogT04=') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('YUchPbSQxNHnNVqfnkIHVtymlkvTuWjrJBqEjrUfZbFuCgmoMApSgxMTk9DTElQIFs=')..bindKeys.Noclip.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ysaVbNOYEjphpEMtmdMAwZUmsBfaTPzwGJcVpZxzihLsQryhDsCbDBEXTogT0ZG')
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)

    if noclipEnabled then
        noclipConn = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('MoCwievTSpSrEtCmBKPkjawhyzDevogsgNzOEmSkedyUTZcrnplAtNhQmFzZVBhcnQ=')) and part.CanCollide then
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
    if flyEnabled and char and char:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('oDnIlaSiQbxtlMFfIjotXDeXCAeSMPIPMvAGqGdpDtsRLDAnEhDGAmbSHVtYW5vaWRSb290UGFydA==')) then
        local hrp = char.HumanoidRootPart
        local hum = char:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IKDOrHclWXOZxqCEWpWYwsUvIpcZKwYSGwZkYAGgZHtKjTndxSkjeicSHVtYW5vaWQ='))
        
        if hum then hum.PlatformStand = true end
        
        flyBG = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('uICKYrufpSBshcYGswoHzKovRVQRHRQhZKyPaapTApeklgJdzsCblSxQm9keUd5cm8='), hrp)
        flyBG.P = 9e4
        flyBG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.cframe = hrp.CFrame
        
        flyBV = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('VhxfjqaDwYCsqVUaOPkovfvfpXFIgjJPNJMtdUZPiLnupurvUXqJUOkQm9keVZlbG9jaXR5'), hrp)
        flyBV.velocity = Vector3.new(0, 0.1, 0)
        flyBV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        FlyBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('qfBFzzOvNrxxEztQMSgiMJswvXSpYALzXHKMvZcosMlsmnbxjcPoRKMRkxZIFs=')..bindKeys.Fly.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LXIhkmCOolCvsGoItovMvqEQcsAVyPuByvLhnKVqyMCSUYCDthowhHTXTogT04=')
        FlyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    else
        if char and char:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ykREpCTRXevjRFUmmCpMCXfHWTzPGIvMEBwpYTADPnwKCYOfJaqgBCFSHVtYW5vaWQ=')) then
            char.Humanoid.PlatformStand = false
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
        if flyBG then flyBG:Destroy() flyBG = nil end
        if flyBV then flyBV:Destroy() flyBV = nil end
        FlyBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PeodbTXFWMIAHOYKVFOEjcuTvaeoANWCMHPaPMVSLmjsZfCGOgqCcBrRkxZIFs=')..bindKeys.Fly.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('BjNcitBjIBDSxKASiIlbQhPXXZrDPYBIAQLbXGucJqHxSCAdlntVvuxXTogT0ZG')
        FlyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    end
end

RunService.RenderStepped:Connect(function()
    if flyEnabled and flyBV and flyBG and player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('KOwDwTPRUanSAERKLEBoVHrFtxelpkksSsbTfgyDTnYxjdCmlTQVywhSHVtYW5vaWRSb290UGFydA==')) then
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
    SpeedBtn.Text = speedEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jpLYYPSAbgRjWsjcOizYhjDEuLTgKnqvJCkqxjXulADsAQLtWnhtNxjU1BFRUQgWw==')..bindKeys.Speed.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('uAtKbjFyhtrIowfVUlHcyjeTvbFWqLCFwogKltAdfdSMxFJzHjmeanVXTogT04=') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('WxhKEgnRNSzXGuBpIzFELoDdlgBjzVMsuLyOklFzEBXjIfuTFoRbbXDU1BFRUQgWw==')..bindKeys.Speed.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('eHPKqyPegvmajKIVoHKecSpcHXwcpsqtmkPLnerpcLJghxUmFZbJqLTXTogT0ZG')
    SpeedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if not speedEnabled and player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('KnMEhOiXaYrWCAdSSmnMsrwMdpfRrzZnXUSeXrgZzQoANjQpvTRZVhjSHVtYW5vaWQ=')) then
        player.Character.Humanoid.WalkSpeed = 16 
    end
end

RunService.RenderStepped:Connect(function()
    if speedEnabled and player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('yLdgxvOeEklLBCWDbTSxxDSrtgmXnysOmqbjzUUbGhbSErALJtPpFsZSHVtYW5vaWQ=')) then
        player.Character.Humanoid.WalkSpeed = walkSpeedValue
    end
end)
SpeedBtn.MouseButton1Click:Connect(toggleSpeed)

-----------------------------------------
--- LÓGICA AntiADM
-----------------------------------------
local antiAdmEnabled = false

local function showAdmWarning(name)
    local WarnLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zzDFTafbWQnbxZYpYrgBpziCqCbSioghxeZLMwsTaDssAEaJUjAxQpQVGV4dExhYmVs'), ScreenGui)
    WarnLabel.Size = UDim2.new(1, 0, 0, 50)
    WarnLabel.Position = UDim2.new(0, 0, 0.05, 0)
    WarnLabel.BackgroundTransparency = 1
    WarnLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TVkHmiyxTyFqvrByQVVVaElnKYsHgWfmxsgvvBbJvfhizKGwWNCjzal4pqg77iPIEFETSBFTlRST1UgTk8gU0VSVklET1I6IA==')..name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('qEHChPFBoCDBaFBBzvLteSPaFdRtZUBBxTYtKKGfRNkHNXbYKHILcMYIOKaoO+4jw==')
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
    AntiAdmBtn.Text = antiAdmEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('RUGaeCHJipNpDOIEtWbNDIDseBzydUZrNuVDAgscdkOkjzZSrelTnPkQW50aUFETTogT04=') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ibVDJIhRozdrfpmQuftwIQrYAXGYbVnDusQZDeKjSLyptRepvISesVVQW50aUFETTogT0ZG')
    AntiAdmBtn.BackgroundColor3 = antiAdmEnabled and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(28, 28, 28)
end)

-----------------------------------------
--- ABA SPECTER
-----------------------------------------
local spectatingPlayer = nil
local sitEnabled = false
local sitConn = nil

local SpectAvatar = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('NzWzPUdsjmOfXeUkKaoAbnbXfhRMZAWyIFiNsWEnIncgiVYeXVTQLyrSW1hZ2VMYWJlbA=='), SpecterFrame)
SpectAvatar.Size = UDim2.new(0, 60, 0, 60)
SpectAvatar.BackgroundTransparency = 1
SpectAvatar.Image = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('newIaDRnwxhOADWkywWknBVNQGTzJPMlSrMgczHMlpmatyhgqAPfJkJ')
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('AmRGAYfaLrfzgcKIszDXcOeINCVHGAKLYvSGibsVApIepKCcyGhdCtbVUlDb3JuZXI='), SpectAvatar).CornerRadius = UDim.new(1, 0)

local SpectNameLabel = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('bihypCyftQoYPfhqqxDLWDGjJNkAUfzEBALKPuIMEKsUMjaSohizZlWVGV4dExhYmVs'), SpecterFrame)
SpectNameLabel.Size = UDim2.new(0.9, 0, 0, 20)
SpectNameLabel.BackgroundTransparency = 1
SpectNameLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vQEmOKiBuvdBwVTVPKyennsVdmMPVLOekoySmiMwGswfmWzqXwMQqjDTmluZ3XDqW0gc2VsZWNpb25hZG8=')
SpectNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectNameLabel.Font = Enum.Font.GothamBold
SpectNameLabel.TextSize = 12

local SpectSearchBox = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('pjSPVrFrfcqFeZHxohwwcRATeODhNBkHEAJDuuREfSZZguuLBVBrtvyVGV4dEJveA=='), SpecterFrame)
SpectSearchBox.Size = UDim2.new(0.85, 0, 0, 25)
SpectSearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpectSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectSearchBox.Font = Enum.Font.GothamSemibold
SpectSearchBox.TextSize = 12
SpectSearchBox.PlaceholderText = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('EPVysTTaPDLGTjBNpIMWuIGCtfYSWJhBKNObOltOpNMlMpAJoYnioMnRGlnaXRhciBVc2VybmFtZS9Ob21lLi4u')
SpectSearchBox.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('HJryNFOaahKegQKaUTHfMFsCttZDgGYxeqEdedMrprDBmXaPpLkuDTZ')
Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('BhbjXizzPvGMWLBbvfUNQaFjPCyBoqkDnBZNhSDppoQYlflSClUstnrVUlDb3JuZXI='), SpectSearchBox).CornerRadius = UDim.new(0, 6)

local function setSpectateTarget(targetPlayer)
    if not targetPlayer then return end
    spectatingPlayer = targetPlayer
    SpectNameLabel.Text = targetPlayer.DisplayName .. KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IgfQtGHugyXRNVAMOjSUDhnDYmHYuVhwxfbruoqqUuPpzegtWMRxzKyIChA') .. targetPlayer.Name .. KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('YXEcjllaaERpGceOgDdjjHEWahuURhRZotrqSMgxeIpdARAfjjMwIqMKQ==')
    SpectAvatar.Image = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IqGGFRsFwgcybZWUmYPkLGvQgDaaKfoSQrcdDhgDLkvusuzhYUJdLAocmJ4dGh1bWI6Ly90eXBlPUF2YXRhckhlYWRTaG90JmlkPQ==') .. targetPlayer.UserId .. KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('urErAUYJpXXIFVAuukHWfzmVcZQmkoBbSrIjWAQaWMTPywYskXDYBAKJnc9MTUwJmg9MTUw')
    
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('gdBwiyzXmJqPqNwsBogWaRdnaPdfVIAqcwCCXSqagSKMcigvXrdSMXOSHVtYW5vaWQ=')) then
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
    SpectSearchBox.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LFjqxPyUADCMRTewdlXMqMgkGyatmTBFcYKimQgAiAnaWaBlPeKmBMG')
end)

local SpectTpBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('FUcofYorIzFMfuTDpTWqZTiVhKMrMbUdgeqtqZAQJaurJGZNLHvfdPBSXIgYXTDqSAoVFAp'), SpecterFrame)
SpectTpBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local SpectSitBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vxmjwLjohFmpHzVCLtvmrRGSMXcbIgKdvvMJQZLllpODAryGQApbbCbU2VudGFyOiBPRkY='), SpecterFrame)

local SpectStopBtn = createButton(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('muoTFHrDEAnqyWYxoUmogzNLouHmuHNGgPttmpuIbmdBnfSfLNvKLEoUGFyYXIgU3BlY3Q='), SpecterFrame)
SpectStopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

SpecterFrame.CanvasSize = UDim2.new(0, 0, 0, 60 + 20 + 25 + 35*3 + 40)

SpectTpBtn.MouseButton1Click:Connect(function()
    if spectatingPlayer and spectatingPlayer.Character and spectatingPlayer.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('odnzhnAHlFkwLGIYTbJRkPTmgDXHQecVZhAscrwSyuAEOYtEwCutsCcSHVtYW5vaWRSb290UGFydA==')) then
        if player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZtwfzQRuRkrChpBtlmLdMCRYFCLCgmMdNRTGEcWaGyKhJekTOfeWhshSHVtYW5vaWRSb290UGFydA==')) then
            player.Character.HumanoidRootPart.CFrame = spectatingPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)

SpectSitBtn.MouseButton1Click:Connect(function()
    sitEnabled = not sitEnabled
    SpectSitBtn.Text = sitEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('GRBfEJeyFHXIKHMjROXEoLjzMAhGUgsLGjzLadhuhEULDkXhepIlANlU2VudGFyOiBPTg==') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jgIkOuyEtqNHhTTULDgvLvmEQZdvvQmlfAmnYpVEPQlOTXLNNQqKepGU2VudGFyOiBPRkY=')
    SpectSitBtn.BackgroundColor3 = sitEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    
    if sitConn then sitConn:Disconnect() sitConn = nil end
    
    if sitEnabled then
        sitConn = RunService.Heartbeat:Connect(function()
            if spectatingPlayer and spectatingPlayer.Character and player.Character then
                local targetHrp = spectatingPlayer.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('RXRzIoKVfBsdXBBhzdFwkvhKpTTudJxVYaSErrfXEdINPfCNgwPFjClSHVtYW5vaWRSb290UGFydA=='))
                local myHrp = player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('NBOoLpsJxRXmlnncuOXeVTtdqoyNNLwwKxdKYJiYLMTzlzeTPOVgWmISHVtYW5vaWRSb290UGFydA=='))
                local myHum = player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZVvHwXVaUYUeArSqpiGZCwckAOFbHTzCvBmovmEjmdxxMTCpCRkTboJSHVtYW5vaWQ='))
                
                if targetHrp and myHrp and myHum then
                    myHum.Sit = true
                    myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 1.5, 0)
                end
            end
        end)
    else
        local myHum = player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('lBTquKWpvNbKZYCAESiCMbKhrIDofXJexunmJzmSVYfusENaEsRlLfjSHVtYW5vaWQ='))
        if myHum then
            myHum.Sit = false
            myHum.Jump = true 
        end
    end
end)

SpectStopBtn.MouseButton1Click:Connect(function()
    spectatingPlayer = nil
    SpectNameLabel.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vuQPlRllxnkQrFhkXUeQrMMndnkqUrYNGdjvWwnVqBVnKpTOYJNUMQVTmluZ3XDqW0gc2VsZWNpb25hZG8=')
    SpectAvatar.Image = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('fWYVdzbxOAxTgLccWZubJrQIbObnPYzJGORdGMJEQiqhUolIlVylHsO')
    if player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LzfDsOJYDdXwQBUUQeaRSAnmdraqPqfYjvmulkkiXziYOLBfgHiAyFFSHVtYW5vaWQ=')) then
        camera.CameraSubject = player.Character.Humanoid
    end
    
    if sitEnabled then
        sitEnabled = false
        SpectSitBtn.Text = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ngmYZLjsxZijCUsyRwNYXCEKUpFnduppAbXRvAAtEjwNgLiVUeftJPGU2VudGFyOiBPRkY=')
        SpectSitBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        if sitConn then sitConn:Disconnect() sitConn = nil end
        local myHum = player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PiSPJweZBScHziZZURhRSXIMftGstFQqUOgWRuoCYnmyVPPWXkoJLfxSHVtYW5vaWQ='))
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
    TpBtn.Text = tpEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('EuzXxHljWKiwZmULviTrHvSVkhAzEiiLizwlhNZjFSkYlvUdiXzDjLvQ0xJQ0sgVFA6IE9O') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vSjPcPabfQeAaMCFuNhdptBivUKJiFBlWKoVeYPrVlWZvXoBLRemNGhQ0xJQ0sgVFAgWw==')..bindKeys.Tp.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vcpmxuVXNexcGNPcfjKgyuRsFzQuvTwsiXwwEVosrMRvnZLHTZrFZviXQ==')
    TpBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
TpBtn.MouseButton1Click:Connect(toggleTp)
mouse.Button1Down:Connect(function()
    if tpEnabled and player.Character and player.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ggSTLyFmUIIKdBrrISfjdXiMLILXqYWMzvXlUNHPbyrPTAXLsFwJWEoSHVtYW5vaWRSb290UGFydA==')) then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

isSpamming = false
local spamConn = nil
local function toggleSpam()
    isSpamming = not isSpamming
    SpamBtn.Text = isSpamming and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('hBXMIMkDJLRJAHMvgzubaQJfarRRUFbnVOtGIhRNwwtMknYBJqRhTdoU1BBTSBPVk86IE9O') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZEeqXQniWaeZYjmNRaYDIbbHfbEVfSWhxXUKVFZSfmUFfkBSdsdJQcyU1BBTSBPVk8gWw==')..bindKeys.Spam.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ZgXiDUCiZroOwOYPNNupMvcedEqALQgWgOulpCWwgjmnCwRISuevSwnXQ==')
    SpamBtn.BackgroundColor3 = isSpamming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isSpamming then
        spamConn = RunService.Heartbeat:Connect(function()
            local charFolder = workspace:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('RGGMVoJdlZpuvUrrwVEtytHTmiDTZFrbAAIRPqlYIKiKMcsvKfEmbyjQ2hhcmFjdGVycw=='))
            local target = charFolder and charFolder:FindFirstChild(player.Name) and charFolder[player.Name]:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('dIaQCLxqOmrUTQyavsEUfjOBhdTiCbmrTDPLTHfeeUnQkTWPXfroORnU3RvcmVnZw=='))
            if target then pcall(function() remoteEvent:FireServer(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('jkblVPrbyyXeXzoreZEImwxDiPNAleUojGSrjabjGSQCqcIuIKkTuaTVHJ5U3RvcmVnZw=='), target, mouse.Hit.Position) end) end
        end)
    elseif spamConn then spamConn:Disconnect() spamConn = nil end
end
SpamBtn.MouseButton1Click:Connect(toggleSpam)

spamCamAtivo = false
local disparosPorFrame = 20
local function toggleSpamCam()
    spamCamAtivo = not spamCamAtivo
    SpamCamBtn.Text = spamCamAtivo and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('SsWiFKNCkjmWNlSsjsmrEaeRBqGWobIAJMaARDbMjQjRbpjXkEdtaxNU1BBTSBDQU1FUkE6IE9O') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LYXanKghtTsqKaHAyPajiGVxhDxIqMqyeZJNkWEZsvYGadZnphaYKKWU1BBTSBDQU1FUkEgWw==')..bindKeys.SpamCamera.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('qEUcqhIZNwkdZDdJsulCTKAupsSZLTzZEnEsdhvTwzGWLAXwcFunPnvXQ==')
    SpamCamBtn.BackgroundColor3 = spamCamAtivo and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
end
SpamCamBtn.MouseButton1Click:Connect(toggleSpamCam)

RunService.Heartbeat:Connect(function()
    if not spamCamAtivo then return end
    local char = workspace:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('sMKNKQjThddlCgUOgWqNbVfkYFkRNvXHQsjBsbFzWHTvYivckPKZCQrQ2hhcmFjdGVycw==')) and workspace.Characters:FindFirstChild(player.Name)
    local remote = char and char:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('oYaJjVuGFZVLJbVeZsWWtfJJRjkvgSLXeglNjeKbuPccqQLCbivqMcTQ2FtZXJh')) and char.Camera:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('vAywSHzpNGmGqmiaitfVaOtGXObGQFcUmnMVsPkibYoEVqOqStLHgvDUmVtb3Rl'))
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
    FarmBtn.Text = isFarming and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IpUaCAUfduXbUHxpcZlalEyYLFdAFMUCMjULcvIKijZbocbzDxjNCLqUEVHQVIgT1ZPUzogT04=') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('cDoxTdJgaHicMYjFFXZCVWaodtWimxvGdhjXAKVEfzBbkXqFoaOViWfUEVHQVIgT1ZPUw==')
    FarmBtn.BackgroundColor3 = isFarming and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if isFarming then task.spawn(function()
        while isFarming do
            local eggs = workspace:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('tFShpGjFfyKZjAwisSAITGTDieVbuhQYhCnUKaPUCMysXYgVZrGSVrDRWdncw=='))
            if player.Character and eggs then
                for _, obj in pairs(eggs:GetChildren()) do
                    if not isFarming then break end
                    if obj:IsA(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('TGPNELapZRMDiJlWCnoTejZhtwOVSnpfTVkALeMOmZXWZrhWFXqIhJNTW9kZWw=')) and string_find(obj.Name, KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('IfspMpFYvnxQahUDirDHWQbZswkzCBItxoRgTSDvVxaULwfIvxoJsPGRWdn')) then
                        local tp = obj:FindFirstChildWhichIsA(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('rzlZMymbZQFREUemWAhmybYPQBWtuvFvoOWpGXdpJKHkEkmADQPpuHAQmFzZVBhcnQ='), true)
                        if tp then player.Character.HumanoidRootPart.CFrame = tp.CFrame * CFrame.new(0, 8, 0) task.wait(2.5) end
                    end
                end
            end
            task.wait(1)
        end
    end) end
end)

espEnabled = false
local espFolder = Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('PmlKaHcPNIDonkTNyUKAWtpScuTUinvHtnfznhiBDDrDBbeeeTNjbzjRm9sZGVy'), ScreenGui)
local function toggleEsp()
    espEnabled = not espEnabled
    EspBtn.Text = espEnabled and KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('SDvdmYXZWcnZwhirutSyMagIldcwceYwObxHfXDQZBAbjuWhrGzEXpzRVNQOiBPTg==') or KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('ygqIEffIMCxePbHWzbTVmsYBlhsnfVDvASgygIrvidLDGdWqJjjPrKmRVNQIFs=')..bindKeys.Esp.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('odkUOVPcTQxFsCbmRjiOFqudUIItefmaczLitmHixAuzhjpRFtTJQHBXQ==')
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28)
    if not espEnabled then espFolder:ClearAllChildren() end
end
EspBtn.MouseButton1Click:Connect(toggleEsp)

task.spawn(function()
    while task.wait() do
        if espEnabled then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('rbOnjMJCUcRJIizndQqAlTmjWrRxxGpCgzKBSvHydUgmkncBsMacJUASGVhZA==')) then
                    local b = espFolder:FindFirstChild(v.Name) or Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('kNRftFcdbNeaZjYcANSJGXXOImzAmzVsbaHStSMrBQUCyizhCPStwGuQmlsbGJvYXJkR3Vp'), espFolder)
                    b.Name = v.Name b.Adornee = v.Character.Head b.Size = UDim2.new(0,100,0,50) b.AlwaysOnTop = true
                    local l = b:FindFirstChild(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('DkaLTvbYpqLDeNUubBIoLcUkONVyyLeTiQhntjGWsOOoojQjKfrmOMzTA==')) or Instance.new(KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('FAbKmsxgojVOPdXUqZPQSIvqnaXsaXSOBIupOAxhrfEOocXshKpWCnKVGV4dExhYmVs'), b)
                    l.Name = KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('sPupXOHZJNWAatNOXhaTGTcaZovrhhLOfzvYlXiGjNoYdiMQJGuyPuiTA==') l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.TextSize = 14
                    local r = v:GetRoleInGroup(GROUP_ID)
                    local d = math_floor((player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                    if ADMIN_ROLES[r] then l.TextColor3 = Color3.fromRGB(255,0,0) l.Text = v.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('mYGhLWsuzHNseiHcvMeOkHHTvHPAOQBULGvmEnVstYOSWIMbsdOJJseXG5b')..r..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('GJuJoYgbrDBcUTOjEJaRpqFMetFFRgvhsgfGedUqtoKYMRVEKVauOHaXVxu')..d..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('zUDjMbyzNpvElPZgHokaskrcaTQUIXxGvKGpFFrPXjVPLkXEgvKmQrPbQ==')
                    else l.TextColor3 = Color3.fromRGB(255,255,255) l.Text = v.Name..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('LWsVMiCLwystQyeRlsHCFeesOlmKzzaiRbjmfCNdbJvHelRxDfUZbmJXG4=')..d..KAJuxJsITFJozQuyHUjbcAUGNTRerhRZdUiVmttMCPWMwvQhOCmsPUfdqOJMsiuB('SghCxdDkYLmdMqRvBvBFaGADUHUXesPtPoFaomewiNpVVSxaJLaYsVfbQ==') end
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
