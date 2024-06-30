-- Gui to Lua
-- Version: 3.2

-- Instances:

local Health = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

--Properties:

Health.Name = "Health"
Health.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Health.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Health
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.291369766, 0, 0.312030077, 0)
Frame.Size = UDim2.new(0, 235, 0, 154)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 234, 0, 153)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "0/0"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 80.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.906382978, 0, -0.0519480519, 0)
TextButton.Size = UDim2.new(0, 22, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "X"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

-- Scripts:

local function UDGQF_fake_script() -- Frame.DraggableGUI 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(UDGQF_fake_script)()
local function WZAGF_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', TextLabel)

	pcall(function () 
		while true and task.wait() do
			script.Parent.Text = game.Players.LocalPlayer.Character.Humanoid.Health .. '/' .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth
		end
	end)
end
coroutine.wrap(WZAGF_fake_script)()
local function NCMF_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local gui = script.Parent.Parent.Parent
	script.Parent.MouseButton1Click:Connect(function ()
		gui:Destroy(); 
	end)
end
coroutine.wrap(NCMF_fake_script)()
