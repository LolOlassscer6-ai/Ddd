-- Global Config
local repo_url = "https://raw.githubusercontent.com"

-- Simple GUI Loader
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

ScreenGui.Name = "SimpleLoader"
ScreenGui.Parent = (game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))

Frame.Size = UDim2.new(0, 200, 0, 80)
Frame.Position = UDim2.new(0.5, -100, 0.5, -40)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

Button.Size = UDim2.new(0.8, 0, 0.6, 0)
Button.Position = UDim2.new(0.1, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
Button.Text = "LOAD SCRIPT"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.Parent = Frame

Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

-- Load Logic
Button.MouseButton1Click:Connect(function()
    Button.Text = "Loading..."
    local success, err = pcall(function()
        loadstring(game:HttpGet(repo_url))()
    end)
    
    if success then
        Button.Text = "Success!"
        task.wait(1)
        ScreenGui:Destroy()
    else
        Button.Text = "Error!"
        warn("Load Error: " .. tostring(err))
    end
end)

