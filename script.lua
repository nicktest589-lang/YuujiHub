--------------------------------------------------
-- IMMORTAL AUTOMATION
-- TOWER / FISH / FOREST / SECT
--------------------------------------------------

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- REMOVE OLD GUI
--------------------------------------------------

local old = playerGui:FindFirstChild("ImmortalAutomation")

if old then
    old:Destroy()
end

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "ImmortalAutomation"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = playerGui

--------------------------------------------------
-- COLORS
--------------------------------------------------

local BLACK = Color3.fromRGB(5, 8, 14)
local DARK = Color3.fromRGB(8, 13, 22)
local BUTTON = Color3.fromRGB(8, 35, 60)

local BLUE = Color3.fromRGB(0, 140, 255)
local BRIGHT_BLUE = Color3.fromRGB(40, 190, 255)

local WHITE = Color3.fromRGB(225, 240, 255)
local OFF = Color3.fromRGB(110, 125, 145)

--------------------------------------------------
-- MAIN
--------------------------------------------------

local main = Instance.new("Frame")

main.Name = "Main"
main.Size = UDim2.new(0, 350, 0, 330)
main.Position = UDim2.new(0.5, -175, 0.5, -165)

main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = BLUE
mainStroke.Thickness = 2
mainStroke.Parent = main

--------------------------------------------------
-- HIDE BUTTON
--------------------------------------------------

local hideButton = Instance.new("TextButton")

hideButton.Name = "HideButton"

hideButton.Size = UDim2.new(0, 55, 0, 32)
hideButton.Position = UDim2.new(1, -65, 0, 10)

hideButton.BackgroundColor3 = BUTTON
hideButton.BorderSizePixel = 0

hideButton.Text = "HIDE"
hideButton.TextColor3 = BRIGHT_BLUE
hideButton.TextScaled = true
hideButton.Font = Enum.Font.GothamBold

hideButton.AutoButtonColor = false
hideButton.ZIndex = 100
hideButton.Parent = main

local hideCorner = Instance.new("UICorner")
hideCorner.CornerRadius = UDim.new(0, 8)
hideCorner.Parent = hideButton

local hideStroke = Instance.new("UIStroke")
hideStroke.Color = BLUE
hideStroke.Thickness = 1.5
hideStroke.Parent = hideButton

--------------------------------------------------
-- SHOW BUTTON
--------------------------------------------------

local showButton = Instance.new("TextButton")

showButton.Name = "ShowButton"

showButton.Size = UDim2.new(0, 75, 0, 42)
showButton.Position = UDim2.new(0, 15, 0.5, -21)

showButton.BackgroundColor3 = BLACK
showButton.BorderSizePixel = 0

showButton.Text = "SHOW"
showButton.TextColor3 = BRIGHT_BLUE
showButton.TextScaled = true
showButton.Font = Enum.Font.GothamBold

showButton.AutoButtonColor = false
showButton.Visible = false
showButton.ZIndex = 100
showButton.Parent = gui

local showCorner = Instance.new("UICorner")
showCorner.CornerRadius = UDim.new(0, 10)
showCorner.Parent = showButton

local showStroke = Instance.new("UIStroke")
showStroke.Color = BLUE
showStroke.Thickness = 2
showStroke.Parent = showButton

--------------------------------------------------
-- HIDE / SHOW
--------------------------------------------------

hideButton.MouseButton1Click:Connect(function()

    main.Visible = false
    showButton.Visible = true

end)

showButton.MouseButton1Click:Connect(function()

    main.Visible = true
    showButton.Visible = false

end)

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")

title.Size = UDim2.new(1, -30, 0, 40)
title.Position = UDim2.new(0, 15, 0, 10)

title.BackgroundTransparency = 1
title.Text = "IMMORTAL AUTOMATION"

title.TextColor3 = WHITE
title.TextScaled = true
title.Font = Enum.Font.GothamBold

title.Parent = main

--------------------------------------------------
-- SUBTITLE
--------------------------------------------------

local subtitle = Instance.new("TextLabel")

subtitle.Size = UDim2.new(1, -30, 0, 18)
subtitle.Position = UDim2.new(0, 15, 0, 48)

subtitle.BackgroundTransparency = 1
subtitle.Text = "AUTOMATION PANEL"

subtitle.TextColor3 = BRIGHT_BLUE
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham

subtitle.Parent = main

--------------------------------------------------
-- TAB BAR
--------------------------------------------------

local tabBar = Instance.new("Frame")

tabBar.Size = UDim2.new(1, -20, 0, 42)
tabBar.Position = UDim2.new(0, 10, 0, 72)

tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local tabLayout = Instance.new("UIListLayout")

tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.Padding = UDim.new(0, 5)

tabLayout.Parent = tabBar

--------------------------------------------------
-- TAB CREATOR
--------------------------------------------------

local tabs = {}
local pages = {}

local function createTab(name)

    local button = Instance.new("TextButton")

    button.Size = UDim2.new(0, 78, 0, 38)

    button.BackgroundColor3 = BUTTON
    button.BorderSizePixel = 0

    button.Text = name
    button.TextColor3 = OFF
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold

    button.AutoButtonColor = false
    button.Parent = tabBar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = BLUE
    stroke.Thickness = 1
    stroke.Transparency = 0.4
    stroke.Parent = button

    tabs[name] = button

    return button
end

--------------------------------------------------
-- PAGE CREATOR
--------------------------------------------------

local function createPage(name)

    local page = Instance.new("Frame")

    page.Name = name
    page.Size = UDim2.new(1, -20, 0, 195)
    page.Position = UDim2.new(0, 10, 0, 120)

    page.BackgroundColor3 = DARK
    page.BorderSizePixel = 0

    page.Visible = false
    page.Parent = main

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = page

    local stroke = Instance.new("UIStroke")
    stroke.Color = BLUE
    stroke.Thickness = 1
    stroke.Transparency = 0.35
    stroke.Parent = page

    pages[name] = page

    return page
end

--------------------------------------------------
-- CREATE TABS
--------------------------------------------------

local towerTab = createTab("TOWER")
local fishTab = createTab("FISH")
local forestTab = createTab("FOREST")
local sectTab = createTab("SECT")

--------------------------------------------------
-- CREATE PAGES
--------------------------------------------------

local towerPage = createPage("TOWER")
local fishPage = createPage("FISH")
local forestPage = createPage("FOREST")
local sectPage = createPage("SECT")

--------------------------------------------------
-- PAGE SWITCHER
--------------------------------------------------

local function showPage(name)

    for pageName, page in pairs(pages) do
        page.Visible = pageName == name
    end

    for tabName, tab in pairs(tabs) do

        if tabName == name then

            tab.BackgroundColor3 = BUTTON
            tab.TextColor3 = BRIGHT_BLUE

        else

            tab.BackgroundColor3 = DARK
            tab.TextColor3 = OFF

        end

    end
end

towerTab.MouseButton1Click:Connect(function()
    showPage("TOWER")
end)

fishTab.MouseButton1Click:Connect(function()
    showPage("FISH")
end)

forestTab.MouseButton1Click:Connect(function()
    showPage("FOREST")
end)

sectTab.MouseButton1Click:Connect(function()
    showPage("SECT")
end)

--------------------------------------------------
-- PAGE TITLE
--------------------------------------------------

local function pageTitle(parent, text)

    local label = Instance.new("TextLabel")

    label.Size = UDim2.new(1, -30, 0, 40)
    label.Position = UDim2.new(0, 15, 0, 15)

    label.BackgroundTransparency = 1
    label.Text = text

    label.TextColor3 = BRIGHT_BLUE
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold

    label.Parent = parent

    return label
end

--------------------------------------------------
-- ACTION BUTTON
--------------------------------------------------

local function createActionButton(parent, text)

    local button = Instance.new("TextButton")

    button.Size = UDim2.new(1, -50, 0, 55)
    button.Position = UDim2.new(0, 25, 0, 70)

    button.BackgroundColor3 = BUTTON
    button.BorderSizePixel = 0

    button.Text = text
    button.TextColor3 = WHITE
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold

    button.AutoButtonColor = false
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = BLUE
    stroke.Thickness = 2
    stroke.Parent = button

    return button
end

--------------------------------------------------
-- STATUS
--------------------------------------------------

local function createStatus(parent)

    local label = Instance.new("TextLabel")

    label.Size = UDim2.new(1, -30, 0, 25)
    label.Position = UDim2.new(0, 15, 0, 135)

    label.BackgroundTransparency = 1

    label.Text = "STATUS: OFF"
    label.TextColor3 = OFF

    label.TextScaled = true
    label.Font = Enum.Font.Gotham

    label.Parent = parent

    return label
end

--------------------------------------------------
-- TOWER PAGE
--------------------------------------------------

pageTitle(
    towerPage,
    "TOWER AUTOMATION"
)

local towerButton = createActionButton(
    towerPage,
    "START TOWER"
)

local towerStatus = createStatus(towerPage)

--------------------------------------------------
-- FISH PAGE
--------------------------------------------------

pageTitle(
    fishPage,
    "FISH AUTO-TOUCH"
)

local fishButton = createActionButton(
    fishPage,
    "FISH AUTO-TOUCH: OFF"
)

local fishStatus = createStatus(fishPage)

--------------------------------------------------
-- FOREST PAGE
--------------------------------------------------

pageTitle(
    forestPage,
    "FOREST AUTOMATION"
)

local forestButton = createActionButton(
    forestPage,
    "START FOREST"
)

local forestStatus = createStatus(forestPage)

--------------------------------------------------
-- SECT PAGE
--------------------------------------------------

pageTitle(
    sectPage,
    "AUTO SECT QUEST"
)

local sectButton = createActionButton(
    sectPage,
    "START SECT"
)

local sectStatus = createStatus(sectPage)

--------------------------------------------------
-- REMOTES
--------------------------------------------------

local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)

if not Remotes then

    towerStatus.Text = "REMOTES NOT FOUND"
    towerStatus.TextColor3 = Color3.fromRGB(255, 80, 80)

else

    local Clicked = Remotes:WaitForChild("Clicked", 10)
    local Battle = Remotes:WaitForChild("Battle", 10)

    if not Clicked or not Battle then

        towerStatus.Text = "REMOTE ERROR"
        towerStatus.TextColor3 = Color3.fromRGB(255, 80, 80)

    else

        --------------------------------------------------
        -- TOWER AUTOMATION
        --------------------------------------------------

        local TOTAL_ATTACKS = 99
        local ATTACK_TIME = 14
        local ATTACK_DELAY = ATTACK_TIME / TOTAL_ATTACKS
        local TOWER_COOLDOWN = 14

        local towerRunning = false
        local attacking = false

        local towerCycle = 0
        local towerStartTime = 0

        local function fireTower(id)

            if not towerRunning or id ~= towerCycle then
                return
            end

            towerStartTime = os.clock()

            Clicked:FireServer(
                "ServerQuest",
                false,
                "Tower"
            )

        end

        local function attackTower(id)

            if not towerRunning then
                return
            end

            if attacking then
                return
            end

            if id ~= towerCycle then
                return
            end

            attacking = true

            for i = 1, TOTAL_ATTACKS do

                if not towerRunning or id ~= towerCycle then

                    attacking = false
                    return

                end

                Clicked:FireServer(
                    "ServerQuest",
                    false,
                    "Move",
                    "3"
                )

                if i < TOTAL_ATTACKS then
                    task.wait(ATTACK_DELAY)
                end

            end

            attacking = false

            if not towerRunning or id ~= towerCycle then
                return
            end

            Clicked:FireServer(
                "ServerQuest",
                false,
                "flee"
            )

            local elapsed = os.clock() - towerStartTime
            local remaining = TOWER_COOLDOWN - elapsed

            if remaining > 0 then
                task.wait(remaining)
            end

            if not towerRunning or id ~= towerCycle then
                return
            end

            towerCycle += 1

            fireTower(towerCycle)

        end

        --------------------------------------------------
        -- BEAST DETECTION
        --------------------------------------------------

        Battle.OnClientEvent:Connect(function(action, data)

            if not towerRunning then
                return
            end

            if attacking then
                return
            end

            if action ~= "TurnStart" then
                return
            end

            if not data or not data.Names then
                return
            end

            local opponent = data.Names[2]

            if typeof(opponent) ~= "string" then
                return
            end

            if not string.find(
                opponent,
                "TOWER BEAST",
                1,
                true
            ) then
                return
            end

            local id = towerCycle

            task.spawn(function()
                attackTower(id)
            end)

        end)

        --------------------------------------------------
        -- TOWER BUTTON
        --------------------------------------------------

        towerButton.MouseButton1Click:Connect(function()

            if towerRunning then

                towerRunning = false
                attacking = false

                towerCycle += 1
                towerStartTime = 0

                towerButton.Text = "START TOWER"

                towerStatus.Text = "STATUS: OFF"
                towerStatus.TextColor3 = OFF

            else

                towerRunning = true
                attacking = false

                towerCycle += 1

                towerButton.Text = "STOP TOWER"

                towerStatus.Text = "STATUS: ON"
                towerStatus.TextColor3 = BRIGHT_BLUE

                local id = towerCycle

                fireTower(id)

            end

        end)

        --------------------------------------------------
        -- FOREST AUTOMATION
        --------------------------------------------------

        local forestRunning = false
        local forestCycle = 0

        local FOREST_WAIT = 55

        local function createForest()

            Clicked:FireServer(
                "Forest",
                false,
                "Create"
            )

        end

        local function destroyForest()

            Clicked:FireServer(
                "Forest",
                false,
                "Destroy"
            )

        end

        local function runForest(id)

            while forestRunning and id == forestCycle do

                createForest()

                task.wait(FOREST_WAIT)

                if not forestRunning or id ~= forestCycle then
                    return
                end

                destroyForest()

                task.wait(0.1)

                if not forestRunning or id ~= forestCycle then
                    return
                end

                createForest()

            end

        end

        --------------------------------------------------
        -- FOREST BUTTON
        --------------------------------------------------

        forestButton.MouseButton1Click:Connect(function()

            forestRunning = not forestRunning

            forestCycle += 1

            if forestRunning then

                forestButton.Text = "STOP FOREST"

                forestStatus.Text = "STATUS: ON"
                forestStatus.TextColor3 = BRIGHT_BLUE

                local id = forestCycle

                task.spawn(function()
                    runForest(id)
                end)

            else

                forestButton.Text = "START FOREST"

                forestStatus.Text = "STATUS: OFF"
                forestStatus.TextColor3 = OFF

            end

        end)

        --------------------------------------------------
        -- AUTO SECT QUEST
        --------------------------------------------------

        local sectRunning = false
        local sectCycle = 0

        local SECT_DELAY = 0.1

        local function sectFire(...)

            Clicked:FireServer(
                "ServerQuest",
                false,
                ...
            )

        end

        local function runSect(id)

            while sectRunning and id == sectCycle do

                --------------------------------------------------
                -- GET RANDOM SECT QUEST
                --------------------------------------------------

                sectFire(
                    "GetQuest",
                    "Sect"
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 28
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-28",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 29
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-29",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 30
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-30",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 31
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-31",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 32
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-32",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- SECT 33
                --------------------------------------------------

                sectFire(
                    "Begin",
                    "Sect-33",
                    1
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- RUSH
                --------------------------------------------------

                sectFire(
                    "Rush"
                )

                task.wait(SECT_DELAY)

                if not sectRunning or id ~= sectCycle then
                    return
                end

                --------------------------------------------------
                -- MOVE 1
                --------------------------------------------------

                sectFire(
                    "Move",
                    "1"
                )

                task.wait(SECT_DELAY)

            end

        end

        --------------------------------------------------
        -- SECT BUTTON
        --------------------------------------------------

        sectButton.MouseButton1Click:Connect(function()

            sectRunning = not sectRunning

            sectCycle += 1

            if sectRunning then

                sectButton.Text = "STOP SECT"

                sectStatus.Text = "STATUS: ON"
                sectStatus.TextColor3 = BRIGHT_BLUE

                local id = sectCycle

                task.spawn(function()
                    runSect(id)
                end)

            else

                sectButton.Text = "START SECT"

                sectStatus.Text = "STATUS: OFF"
                sectStatus.TextColor3 = OFF

            end

        end)

    end

end

--------------------------------------------------
-- FISH AUTOMATION
--------------------------------------------------

local fishEnabled = false
local touching = false

--------------------------------------------------
-- FIXED TOUCH POSITION
--------------------------------------------------

local TOUCH_X = 422
local TOUCH_Y = -10

local FISH_THRESHOLD = 0.01

--------------------------------------------------
-- PRESS TOUCH
--------------------------------------------------

local function pressTouch()

    if touching then
        return
    end

    touching = true

    VirtualInputManager:SendTouchEvent(
        1,
        0,
        TOUCH_X,
        TOUCH_Y
    )

end

--------------------------------------------------
-- RELEASE TOUCH
--------------------------------------------------

local function releaseTouch()

    if not touching then
        return
    end

    touching = false

    VirtualInputManager:SendTouchEvent(
        1,
        2,
        TOUCH_X,
        TOUCH_Y
    )

end

--------------------------------------------------
-- FISH HEARTBEAT
--------------------------------------------------

RunService.Heartbeat:Connect(function()

    if not fishEnabled then

        releaseTouch()
        return

    end

    local screenGui =
        playerGui:FindFirstChild("ScreenGui")

    if not screenGui then

        releaseTouch()
        return

    end

    local fishFrame =
        screenGui:FindFirstChild("FishFrame")

    if not fishFrame then

        releaseTouch()
        return

    end

    local leaveFrame =
        fishFrame:FindFirstChild("LeaveFrame")

    if not leaveFrame then

        releaseTouch()
        return

    end

    local container =
        leaveFrame:FindFirstChild("MinigameContainer")

    if not container then

        releaseTouch()
        return

    end

    local track =
        container:FindFirstChild("MinigameTrack")

    if not track then

        releaseTouch()
        return

    end

    local red =
        track:FindFirstChild("TensionZone")

    local yellow =
        track:FindFirstChild("TargetFish")

    if not red or not yellow then

        releaseTouch()
        return

    end

    if not fishFrame.Visible
        or not leaveFrame.Visible
        or not container.Visible
        or not track.Visible
        or not red.Visible
        or not yellow.Visible then

        releaseTouch()
        return

    end

    --------------------------------------------------
    -- FIND CENTER OF RED
    --------------------------------------------------

    local redCenter =
        red.Position.X.Scale +
        red.Size.X.Scale * 0.5

    --------------------------------------------------
    -- FIND CENTER OF YELLOW
    --------------------------------------------------

    local yellowCenter =
        yellow.Position.X.Scale +
        yellow.Size.X.Scale * 0.5

    --------------------------------------------------
    -- DIFFERENCE
    --------------------------------------------------

    local difference =
        yellowCenter - redCenter

    --------------------------------------------------
    -- MOVE RED TOWARD YELLOW
    --------------------------------------------------

    if difference > FISH_THRESHOLD then

        pressTouch()

    elseif difference < -FISH_THRESHOLD then

        releaseTouch()

    end

end)

--------------------------------------------------
-- FISH BUTTON
--------------------------------------------------

fishButton.MouseButton1Click:Connect(function()

    fishEnabled = not fishEnabled

    if fishEnabled then

        fishButton.Text = "FISH AUTO-TOUCH: ON"

        fishStatus.Text = "STATUS: ON"
        fishStatus.TextColor3 = BRIGHT_BLUE

    else

        fishButton.Text = "FISH AUTO-TOUCH: OFF"

        fishStatus.Text = "STATUS: OFF"
        fishStatus.TextColor3 = OFF

        releaseTouch()

    end

end)

--------------------------------------------------
-- DEFAULT PAGE
--------------------------------------------------

showPage("TOWER")

--------------------------------------------------
-- END
--------------------------------------------------
