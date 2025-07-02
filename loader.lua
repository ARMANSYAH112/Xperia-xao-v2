-- LOADING AWAL
local loadingScreen = Instance.new("ScreenGui", game.CoreGui)
loadingScreen.Name = "XperiaLoading"
local textLabel = Instance.new("TextLabel", loadingScreen)
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "🔷 Xperia XAO by Armansyah"
textLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
textLabel.TextStrokeTransparency = 0
textLabel.Font = Enum.Font.GothamBlack
textLabel.TextScaled = true

wait(2)
loadingScreen:Destroy()

-- GUI UTAMA
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local FeaturesFrame = Instance.new("Frame")
local Maximize = Instance.new("TextButton")

ScreenGui.Name = "XperiaXAO_GUI"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.1, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 240, 0, 320)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 2

Title.Parent = Frame
Title.Text = "[Xperia XAO]"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextScaled = true

Minimize.Parent = Frame
Minimize.Text = "-"
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -30, 0, 0)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextScaled = true
Minimize.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

Maximize.Parent = ScreenGui
Maximize.Text = "+"
Maximize.Size = UDim2.new(0, 40, 0, 40)
Maximize.Position = UDim2.new(0, 10, 0.8, 0)
Maximize.Font = Enum.Font.GothamBold
Maximize.TextScaled = true
Maximize.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
Maximize.Visible = false

FeaturesFrame.Parent = Frame
FeaturesFrame.Size = UDim2.new(1, 0, 1, -30)
FeaturesFrame.Position = UDim2.new(0, 0, 0, 30)

function createButton(text, color, func)
	local btn = Instance.new("TextButton", FeaturesFrame)
	btn.Size = UDim2.new(1, -10, 0, 30)
	btn.BackgroundColor3 = color
	btn.Text = text
	btn.Font = Enum.Font.Gotham
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.BorderSizePixel = 0
	btn.MouseButton1Click:Connect(func)
	return btn
end

-- FUNGSI FITUR
createButton("Hop Server", Color3.fromRGB(100, 0, 255), function()
	local TPS = game:GetService("TeleportService")
	local PlaceID = game.PlaceId
	TPS:Teleport(PlaceID)
end)

createButton("Godmode", Color3.fromRGB(255, 0, 0), function()
	local lp = game.Players.LocalPlayer
	if lp.Character then
		lp.Character:FindFirstChildOfClass("Humanoid").Name = "God"
	end
end)

createButton("Aimbot", Color3.fromRGB(255, 100, 0), function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Ekb0RJRC"))() -- bisa diganti ke versi kamu sendiri
end)

createButton("Speed Hack", Color3.fromRGB(0, 255, 0), function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 48
end)

createButton("Jump Boost", Color3.fromRGB(255, 255, 0), function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
end)

createButton("ESP Player", Color3.fromRGB(255, 0, 0), function()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and player.Character then
			local esp = Instance.new("BillboardGui", player.Character.Head)
			esp.Size = UDim2.new(0, 100, 0, 40)
			esp.AlwaysOnTop = true
			local name = Instance.new("TextLabel", esp)
			name.Size = UDim2.new(1, 0, 1, 0)
			name.Text = player.Name
			name.BackgroundTransparency = 1
			name.TextColor3 = Color3.new(1, 0, 0)
		end
	end
end)

createButton("ESP Brainrot", Color3.fromRGB(0, 200, 255), function()
	for _, v in pairs(workspace:GetDescendants()) do
		if v.Name:lower():find("brain") or v.Name:lower():find("anomali") then
			local gui = Instance.new("BillboardGui", v)
			gui.Size = UDim2.new(0,100,0,40)
			gui.AlwaysOnTop = true
			local text = Instance.new("TextLabel", gui)
			text.Size = UDim2.new(1,0,1,0)
			text.Text = v.Name
			text.BackgroundTransparency = 1
			text.TextColor3 = Color3.new(0, 1, 1)
			game.Players.LocalPlayer.Character:MoveTo(v.Position)
			break
		end
	end
end)

createButton("Teleport to Sky", Color3.fromRGB(100, 100, 255), function()
	local char = game.Players.LocalPlayer.Character
	char:MoveTo(Vector3.new(char.HumanoidRootPart.Position.X, char.HumanoidRootPart.Position.Y + 200, char.HumanoidRootPart.Position.Z))
end)

-- MINIMIZE MAXIMIZE
Minimize.MouseButton1Click:Connect(function()
	Frame.Visible = false
	Maximize.Visible = true
end)

Maximize.MouseButton1Click:Connect(function()
	Frame.Visible = true
	Maximize.Visible = false
end)
