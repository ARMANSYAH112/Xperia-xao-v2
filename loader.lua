-- LOADING SCREEN
local loading = Instance.new("ScreenGui", game.CoreGui)
local label = Instance.new("TextLabel", loading)
label.Size = UDim2.new(1, 0, 1, 0)
label.Text = "🔷 XPERIA XAO by ARMANSYAH112"
label.Font = Enum.Font.GothamBlack
label.TextScaled = true
label.TextColor3 = Color3.fromRGB(0, 255, 255)
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.TextStrokeTransparency = 0.5
wait(2)
loading:Destroy()

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "XPERIA_XAO_GUI"

local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.Size = UDim2.new(0, 270, 0, 390)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- UI corner & shadow
local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)
local dropShadow = Instance.new("ImageLabel", frame)
dropShadow.Image = "rbxassetid://1316045217"
dropShadow.ImageTransparency = 0.6
dropShadow.Size = UDim2.new(1, 60, 1, 60)
dropShadow.Position = UDim2.new(-0.1, 0, -0.1, 0)
dropShadow.BackgroundTransparency = 1
dropShadow.ZIndex = -1

-- HEADER
local title = Instance.new("TextLabel", frame)
title.Text = "[XPERIA XAO]"
title.Size = UDim2.new(1, 0, 0, 35)
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextStrokeTransparency = 0.6

local minimize = Instance.new("TextButton", frame)
minimize.Text = "-"
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -35, 0, 3)
minimize.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
minimize.Font = Enum.Font.GothamBlack
minimize.TextScaled = true
minimize.TextColor3 = Color3.new(1, 1, 1)

local maxBtn = Instance.new("TextButton", gui)
maxBtn.Text = "+"
maxBtn.Size = UDim2.new(0, 40, 0, 40)
maxBtn.Position = UDim2.new(0, 10, 0.85, 0)
maxBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
maxBtn.TextColor3 = Color3.new(1, 1, 1)
maxBtn.Font = Enum.Font.GothamBlack
maxBtn.TextScaled = true
maxBtn.Visible = false
maxBtn.Active = true
maxBtn.Draggable = true

local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1, 0, 1, -40)
container.Position = UDim2.new(0, 0, 0, 40)
container.BackgroundTransparency = 1

-- Toggle system
local y = 0
function addToggle(name, color, callback)
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, y)
	btn.BackgroundColor3 = color
	btn.Text = name .. " [OFF]"
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamSemibold
	btn.TextScaled = true
	btn.BorderSizePixel = 0
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)

	local state = false
	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = name .. (state and " [ON]" or " [OFF]")
		callback(state)
	end)
	y = y + 34
end

-- FITUR-FITUR
addToggle("Speed Hack", Color3.fromRGB(0,255,0), function(on)
	local h = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed = on and 48 or 16 end
end)

addToggle("Jump Boost", Color3.fromRGB(255,255,0), function(on)
	local h = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.JumpPower = on and 120 or 50 end
end)

addToggle("Godmode", Color3.fromRGB(255, 0, 0), function(on)
	local char = game.Players.LocalPlayer.Character
	if on and char then
		char:FindFirstChildOfClass("Humanoid").Name = "God"
	end
end)

addToggle("ESP Player", Color3.fromRGB(255, 0, 0), function(on)
	for _, p in pairs(game.Players:GetPlayers()) do
		if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
			if on then
				local esp = Instance.new("BillboardGui", p.Character.Head)
				esp.Name = "XperiaESP"
				esp.Size = UDim2.new(0, 100, 0, 40)
				esp.AlwaysOnTop = true
				local txt = Instance.new("TextLabel", esp)
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.Text = p.Name
				txt.BackgroundTransparency = 1
				txt.TextColor3 = Color3.new(1, 0, 0)
			else
				if p.Character.Head:FindFirstChild("XperiaESP") then
					p.Character.Head.XperiaESP:Destroy()
				end
			end
		end
	end
end)

addToggle("ESP Brainrot", Color3.fromRGB(0, 255, 255), function(on)
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Model") and (v.Name:lower():find("brain") or v.Name:lower():find("anomali")) and v:FindFirstChild("HumanoidRootPart") then
			if on then
				local gui = Instance.new("BillboardGui", v.HumanoidRootPart)
				gui.Name = "XperiaESPBrain"
				gui.Size = UDim2.new(0,100,0,40)
				gui.AlwaysOnTop = true
				local txt = Instance.new("TextLabel", gui)
				txt.Size = UDim2.new(1,0,1,0)
				txt.Text = v.Name
				txt.BackgroundTransparency = 1
				txt.TextColor3 = Color3.new(0, 1, 1)
				game.Players.LocalPlayer.Character:MoveTo(v.HumanoidRootPart.Position)
			else
				if v.HumanoidRootPart:FindFirstChild("XperiaESPBrain") then
					v.HumanoidRootPart.XperiaESPBrain:Destroy()
				end
			end
		end
	end
end)

addToggle("Aimbot", Color3.fromRGB(255, 100, 0), function(on)
	if on then
		loadstring(game:HttpGet("https://pastebin.com/raw/Ekb0RJRC"))()
	end
end)

addToggle("Teleport to Sky", Color3.fromRGB(100,100,255), function(on)
	local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if on and root then
		root.CFrame = root.CFrame + Vector3.new(0, 200, 0)
	end
end)

addToggle("Teleport to Ground", Color3.fromRGB(50,200,255), function(on)
	local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if on and root then
		root.CFrame = root.CFrame - Vector3.new(0, 200, 0)
	end
end)

addToggle("Hop Server", Color3.fromRGB(200, 0, 255), function(on)
	if on then
		local TPS = game:GetService("TeleportService")
		local PlaceID = game.PlaceId
		TPS:Teleport(PlaceID)
	end
end)

-- MINIMIZE LOGIC
minimize.MouseButton1Click:Connect(function()
	frame.Visible = false
	maxBtn.Visible = true
end)

maxBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	maxBtn.Visible = false
end)
