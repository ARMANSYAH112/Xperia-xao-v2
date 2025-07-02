-- LOADER XPERIA XAO FINAL - BY ARMANSYAH112

-- Loading Screen
local loading = Instance.new("ScreenGui", game.CoreGui)
local label = Instance.new("TextLabel", loading)
label.Size = UDim2.new(1, 0, 1, 0)
label.Text = "🔷 XPERIA XAO by ArmansyahOffc"
label.Font = Enum.Font.GothamBlack
label.TextScaled = true
label.TextColor3 = Color3.fromRGB(0, 255, 255)
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
wait(2)
loading:Destroy()

-- GUI Setup
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TPService = game:GetService("TeleportService")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "XPERIA_XAO_GUI"

local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.Size = UDim2.new(0, 260, 0, 400)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Text = "XPERIA XAO"
title.Size = UDim2.new(1, 0, 0, 35)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local minimize = Instance.new("TextButton", frame)
minimize.Text = "-"
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -35, 0, 3)
minimize.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimize.Font = Enum.Font.GothamBlack
minimize.TextScaled = true

local maxBtn = Instance.new("TextButton", gui)
maxBtn.Text = "+"
maxBtn.Size = UDim2.new(0, 40, 0, 40)
maxBtn.Position = UDim2.new(0, 10, 0.85, 0)
maxBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
maxBtn.TextColor3 = Color3.new(1, 1, 1)
maxBtn.Font = Enum.Font.GothamBlack
maxBtn.TextScaled = true
maxBtn.Visible = false
maxBtn.Draggable = true

local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1, 0, 1, -40)
container.Position = UDim2.new(0, 0, 0, 40)
container.BackgroundTransparency = 1

local y = 0
function addButton(name, callback)
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	btn.Text = name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamSemibold
	btn.TextScaled = true
	btn.BorderSizePixel = 0
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(callback)
	y = y + 34
	return btn
end

function addToggle(name, callback)
	local state = false
	local button
	local function update()
		pcall(function()
			callback(state)
			button.Text = name .. (state and " [ON]" or " [OFF]")
		end)
	end
	button = addButton(name .. " [OFF]", function()
		state = not state
		update()
	end)
	update()
end

-- Speed Hack
addToggle("Speed Hack", function(on)
	local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed = on and 120 or 16 end
end)

-- Jump Boost
addToggle("Jump Boost", function(on)
	local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.JumpPower = on and 300 or 50 end
end)

-- ESP Player
addToggle("ESP Player", function(on)
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
			if on then
				if not p.Character.Head:FindFirstChild("ESPName") then
					local esp = Instance.new("BillboardGui", p.Character.Head)
					esp.Name = "ESPName"
					esp.Size = UDim2.new(0, 100, 0, 40)
					esp.AlwaysOnTop = true
					local txt = Instance.new("TextLabel", esp)
					txt.Size = UDim2.new(1, 0, 1, 0)
					txt.Text = p.Name
					txt.BackgroundTransparency = 1
					txt.TextColor3 = Color3.new(1,1,1)
				end
				if not p.Character:FindFirstChild("XperiaHighlight") then
					local hl = Instance.new("Highlight", p.Character)
					hl.Name = "XperiaHighlight"
					hl.FillColor = Color3.new(1, 0, 0)
					hl.OutlineTransparency = 1
				end
			else
				if p.Character:FindFirstChild("XperiaHighlight") then p.Character.XperiaHighlight:Destroy() end
				if p.Character.Head:FindFirstChild("ESPName") then p.Character.Head.ESPName:Destroy() end
			end
		end
	end
end)

-- Aimbot: Karakter hadap ke musuh terdekat
addToggle("Aimbot", function(on)
	local RunService = game:GetService("RunService")
	if on then
		RunService:BindToRenderStep("XperiaAimbot", Enum.RenderPriority.Input.Value, function()
			local closest, dist = nil, math.huge
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local diff = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					if diff < dist then
						dist = diff
						closest = player
					end
				end
			end
			if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.CFrame = CFrame.lookAt(hrp.Position, closest.Character.HumanoidRootPart.Position)
				end
			end
		end)
	else
		RunService:UnbindFromRenderStep("XperiaAimbot")
	end
end)

-- Teleport to Sky (toggle naik turun)
local up = false
addButton("Teleport Sky", function()
	local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if root then
		if not up then
			root.CFrame = root.CFrame + Vector3.new(0, 200, 0)
		else
			root.CFrame = root.CFrame - Vector3.new(0, 200, 0)
		end
		up = not up
	end
end)

-- Hop Server
addButton("Hop Server", function()
	local PlaceId = game.PlaceId
	local bestServer = nil
	local bestScore = 0
	local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
	for _, s in pairs(servers) do
		if s.playing < s.maxPlayers and s.id ~= game.JobId then
			if s.playing > bestScore then
				bestScore = s.playing
				bestServer = s.id
			end
		end
	end
	if bestServer then
		TPService:TeleportToPlaceInstance(PlaceId, bestServer)
	end
end)

-- Minimize & Maximize
minimize.MouseButton1Click:Connect(function()
	frame.Visible = false
	maxBtn.Visible = true
end)
maxBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	maxBtn.Visible = false
end)
