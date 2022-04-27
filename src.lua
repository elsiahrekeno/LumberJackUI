local CoreGui = game:GetService'CoreGui'
local Tween = game:GetService'TweenService'
local ms = game:GetService'Players'.LocalPlayer:GetMouse()
local Lib = {}
local Functions = {}
local InsertedObjects = {}
local tweeninfo = TweenInfo.new
local UIS = game:GetService'UserInputService'

function Functions.DestroyUI()
    for i,v in next, CoreGui:GetChildren() do
        if v.Name == "Apricot" then
            CoreGui["Apricot"]:Destroy()
        end
    end
end
for i, connection in pairs(getconnections(UIS.InputBegan)) do
    connection:Disable()
end
function Functions:Tween(instance, properties, duration, ...)
    Tween:Create(instance, tweeninfo(duration, ...), properties):Play()
end
function Functions:Pop(object, shrink)
    local clone = object:Clone()
    clone.AnchorPoint = Vector2.new(0.5, 0.5)
    clone.Size = clone.Size - UDim2.new(0, shrink, 0, shrink)
    clone.Position = UDim2.new(0.5, 0, 0.5, 0)
    clone.BorderSizePixel = 0
    clone.Parent = object
    local ui = Instance.new("UICorner")
    ui.CornerRadius = UDim.new(0,6)
    ui.Parent = clone

    wait()
    clone:ClearAllChildren()
    
    object.BackgroundTransparency = 1
    Functions:Tween(clone, {Size = object.Size}, 0.2)
    
    spawn(function()
        wait(0.2)
        object.BackgroundTransparency = 0
        clone:Destroy()
    end)
    
    return clone
end

Functions.DestroyUI()
function Functions.ToggleUI()
    CoreGui['Apricot'].Enabled = not CoreGui['Apricot'].Enabled 
end

function Lib.SendNotification(title,descriptioon)
   title = title or "Notification Title" 
    if not title then title = "Notification Title" end 
    descriptioon = descriptioon or 'Notification Description'
    if not descriptioon then descriptioon = 'Notification Description' end 

    local Opened = UDim2.new(0.007, 0,0.931, 0)
    local Closed = UDim2.new(-0.17, 0,0.931, 0)
    for index,noti in pairs(CoreGui:GetChildren()) do
        if noti:IsA("ScreenGui") and noti.Name == "Notification_AP" then
            noti:Destroy()
        end
   end 
                local Notification = Instance.new("ScreenGui")
                local Motherframe = Instance.new("Frame")
                local Name = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                local Desc = Instance.new("TextLabel")
                local Shadow = Instance.new("ImageLabel")
                local Close = Instance.new("TextButton")
                local Blur = Instance.new("Frame")
                local b = Instance.new("UICorner")
              
                Notification.Name = "Notification_AP"
                Notification.Parent = CoreGui
                Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                Motherframe.Name = "Motherframe"
                Motherframe.Parent = Notification
                Motherframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Motherframe.Position = UDim2.new(-0.17, 0,0.939, 0)
                Motherframe.Size = UDim2.new(0, 264, 0, 62)

                Name.Name = "Name"
                Name.Parent = Motherframe
                Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Name.BackgroundTransparency = 1.000
                Name.Position = UDim2.new(0.0416666679, 0, 0, 0)
                Name.Size = UDim2.new(0, 149, 0, 29)
                Name.Font = Enum.Font.GothamBold
                Name.Text = title
                Name.TextColor3 = Color3.fromRGB(75, 75, 75)
                Name.TextSize = 15.000
                Name.TextXAlignment = Enum.TextXAlignment.Left

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Motherframe
             
                Blur.Name = "Blur"
                Blur.Parent = Motherframe
                Blur.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Blur.BorderColor3 = Color3.fromRGB(255, 255, 255)
                Blur.Position = UDim2.new(0.0355151482, 0, 0.0645161271, 0)
                Blur.Size = UDim2.new(0, 1, 0, 54)
                
                b.CornerRadius = UDim.new(0, 4)
                b.Parent = Blur
                 
                Desc.Name = "Desc"
                Desc.Parent = Motherframe
                Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Desc.BackgroundTransparency = 1.000
                Desc.Position = UDim2.new(0.0416666679, 0, 0.467741936, 0)
                Desc.Size = UDim2.new(0, 149, 0, 29)
                Desc.Font = Enum.Font.GothamBold
                Desc.Text = descriptioon
                Desc.TextColor3 = Color3.fromRGB(75, 75, 75)
                Desc.TextSize = 12.000
                Desc.TextXAlignment = Enum.TextXAlignment.Left

                Shadow.Name = "Shadow"
                Shadow.Parent = Motherframe
                Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Shadow.BackgroundTransparency = 1.000
                Shadow.Position = UDim2.new(0, -15, 0, -15)
                Shadow.Size = UDim2.new(1, 30, 1, 30)
                Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                Shadow.ScaleType = Enum.ScaleType.Slice
                Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                Close.Name = "Close"
                Close.Parent = Motherframe
                Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Close.BackgroundTransparency = 1.000
                Close.Position = UDim2.new(0.848484874, 0, 0, 0)
                Close.Size = UDim2.new(0, 40, 0, 29)
                Close.Font = Enum.Font.GothamBold
                Close.Text = "x"
                Close.TextColor3 = Color3.fromRGB(75, 75, 75)
                Close.TextSize = 17.000

                local info = TweenInfo.new(
                    0.2,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut,
                    0,
                    false,
                    0
                )
                Close.MouseButton1Click:Connect(function()
                    local goal = {}
                    goal.Position = Closed
                        Tween:Create(Motherframe,info,goal):Play()                    
                end)
                    local goal = {}
                    goal.Position = Opened
                    Tween:Create(Motherframe,info,goal):Play()     
                    
                    delay(10,function()
                        if CoreGui["Notification_AP"] ~= nil then
                            local goal = {}
                            goal.Position = Closed
                            Tween:Create(Motherframe,info,goal):Play()    
                        end
                    end)
                end
function Lib.Init(settings)
    local Title = settings.Title or 'New Library'
    if not Title then Title = 'New Library' end 
    local Description = settings.Description or ''
    if not Description then Description = '' end 


            local Apricot = Instance.new("ScreenGui")
            local Motherframe = Instance.new("Frame")
            local Sidebar = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Cover = Instance.new("Frame")
            local TabContainer = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            local Name = Instance.new("TextLabel")
            local Desc = Instance.new("TextLabel")
            local UICorner_2 = Instance.new("UICorner")
            local Shadow = Instance.new("ImageLabel")
            local Pages = Instance.new("Folder")
            Apricot.Name = "Apricot"
            Apricot.Parent = CoreGui
            Apricot.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Apricot.DisplayOrder = 9e9

            Motherframe.Name = "Motherframe"
            Motherframe.Parent = Apricot
            Motherframe.AnchorPoint = Vector2.new(0.5, 0.5)
            Motherframe.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
            Motherframe.Position = UDim2.new(0.499405891, 0, 0.5, 0)
            Motherframe.Size = UDim2.new(0, 606, 0, 540)

            Sidebar.Name = "Sidebar"
            Sidebar.Parent = Motherframe
            Sidebar.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
            Sidebar.ClipsDescendants = true
            Sidebar.Size = UDim2.new(0, 151, 0, 540)

            UICorner.CornerRadius = UDim.new(0, 6)
            UICorner.Parent = Sidebar

            Cover.Name = "Cover"
            Cover.Parent = Sidebar
            Cover.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
            Cover.BorderSizePixel = 0
            Cover.Position = UDim2.new(0.942000031, 0, 0, 0)
            Cover.Size = UDim2.new(0, 19, 0, 540)

            TabContainer.Name = "TabContainer"
            TabContainer.Parent = Sidebar
            TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabContainer.BackgroundTransparency = 1.000
            TabContainer.Position = UDim2.new(0, 0, 0.175925925, 0)
            TabContainer.Size = UDim2.new(0, 129, 0, 445)

            UIListLayout.Parent = TabContainer
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 4)

            Name.Name = "Name"
            Name.Parent = Sidebar
            Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Name.BackgroundTransparency = 1.000
            Name.Size = UDim2.new(0, 149, 0, 29)
            Name.Font = Enum.Font.GothamBold
            Name.Text = Title
            Name.TextColor3 = Color3.fromRGB(160, 160, 160)
            Name.TextSize = 16.000

            Desc.Name = "Desc"
            Desc.Parent = Sidebar
            Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc.BackgroundTransparency = 1.000
            Desc.Position = UDim2.new(0, 0, 0.0388888866, 0)
            Desc.Size = UDim2.new(0, 149, 0, 29)
            Desc.Font = Enum.Font.GothamBold
            Desc.Text = Description
            Desc.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc.TextSize = 12.000
            Desc.TextWrapped = true

            UICorner_2.CornerRadius = UDim.new(0, 6)
            UICorner_2.Parent = Motherframe

            Shadow.Name = "Shadow"
            Shadow.Parent = Motherframe
            Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Shadow.BackgroundTransparency = 1.000
            Shadow.Position = UDim2.new(0, -15, 0, -15)
            Shadow.Size = UDim2.new(1, 30, 1, 30)
            Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
            Shadow.ScaleType = Enum.ScaleType.Slice
            Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
            Shadow.SizeConstraint = Enum.SizeConstraint.RelativeXY
            Pages.Name = "Pages"
            Pages.Parent = Motherframe

            local Inside = {}
            function Inside:Tab(Name)
                Name = Name or 'New Tab'
                if not Name then Name = 'New Tab' end 

                local Tab = Instance.new("TextButton")
                local Frame = Instance.new("Frame")
                local Frame_2 = Instance.new("Frame")
                local Page = Instance.new("ScrollingFrame")
                local UIListLayout_2 = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")


                Tab.Name = "Tab"
                Tab.Parent = TabContainer
                Tab.BackgroundColor3 = Color3.fromRGB(223, 230, 234)
                Tab.BorderSizePixel = 0
                Tab.Size = UDim2.new(0, 151, 0, 35)
                Tab.AutoButtonColor = false
                Tab.Font = Enum.Font.GothamSemibold
                Tab.Text = Name
                Tab.TextColor3 = Color3.fromRGB(66, 136, 166)
                Tab.TextSize = 12.000
                Tab.TextWrapped = true
    
                Frame.Parent = Tab
                Frame.BackgroundColor3 = Color3.fromRGB(66, 136, 166)
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(0, 151, 0, 2)
                Frame.Name = "Frame"
                Frame_2.Parent = Tab
                Frame_2.BackgroundColor3 = Color3.fromRGB(66, 136, 166)
                Frame_2.BorderSizePixel = 0
                Frame_2.Position = UDim2.new(0, 0, 0.971428573, 0)
                Frame_2.Size = UDim2.new(0, 151, 0, 2)
                Frame_2.Name = "Frame_2"
                
                Page.Name = "Page"
                Page.Parent = Pages
                Page.Active = true
                Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Page.BackgroundTransparency = 1.000
                Page.BorderSizePixel = 0
                Page.Position = UDim2.new(0.249174923, 0, 0, 0)
                Page.Size = UDim2.new(0, 455, 0, 540)
                Page.ScrollBarThickness = 4

                UIListLayout_2.Parent = Page
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 6)


                task.spawn(function()
                    while wait() do
                        Page.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y + 15)
                    end
                end)

                UIPadding.Parent = Page
                UIPadding.PaddingTop = UDim.new(0, 9)
                UIPadding.PaddingRight = UDim.new(0,4)
                local a = 0
                local b = 0

                for i,v in next, TabContainer:GetChildren() do
                    if v:IsA("TextButton") then
                        a = a + 1 
                        v.Name = tostring(a) .. "Tab"
                    end
                end
                for i,v in next, Pages:GetChildren() do
                    b = b + 1 
                    v.Name = tostring(b) .. "Page"
                end
                for i,v in next, Pages:GetChildren() do
                    if v.Name ~= "1Page" then 
                        v.Visible = false 
                    end
                end
                for i,v in next, TabContainer:GetChildren() do
                    if v:IsA('TextButton')  and v.Name ~= "1Tab" then
                        v.BackgroundTransparency = 1
                        v.Frame.BackgroundTransparency = 1 
                        v.Frame_2.BackgroundTransparency = 1 
                        v.TextColor3 = Color3.fromRGB(115, 115, 115)
                    end
                end
                local i = TweenInfo.new(.25)
                Tab.MouseButton1Click:Connect(function()
                    for i,v in next, TabContainer:GetChildren() do
                        if v:IsA('TextButton')  then
                            Tween:Create(v,TweenInfo.new(.25),{BackgroundTransparency = 1}) :Play()
                            Tween:Create(v,TweenInfo.new(.25),{TextColor3 = Color3.fromRGB(115, 115, 115)}):Play()
                            Tween:Create(v.Frame,TweenInfo.new(.25),{BackgroundTransparency = 1}):Play()
                            Tween:Create(v.Frame_2,TweenInfo.new(.25),{BackgroundTransparency =1 }):Play()     
                          end
                    end  
                    Tween:Create(Tab,TweenInfo.new(.25),{BackgroundTransparency = 0}):Play()
                    Tween:Create(Tab,TweenInfo.new(.25),{TextColor3 = Color3.fromRGB(66, 136, 166)}):Play()
                    Tween:Create(Tab.Frame,TweenInfo.new(.25),{BackgroundTransparency = 0}):Play()
                    Tween:Create(Tab.Frame_2,TweenInfo.new(.25),{BackgroundTransparency =0 }):Play()
                    for i,v in next, Pages:GetChildren() do
                        v.Visible = false 
                    end
                    Page.Visible = true 
                end)

                local Sections = {}
                function Sections:Section(nameofsection)
                    nameofsection = tostring(nameofsection) or 'New Section'
                    if not nameofsection then nameofsection = 'New Section' end 
                       
                    
                    local Section = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local SectionTitle = Instance.new("TextLabel")
                        local UIPadding = Instance.new("UIPadding")
                        local UIListLayout = Instance.new("UIListLayout")
                        local TextButton = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")

                        
                        Section.Name = "Section"
                        Section.Parent = Page
                        Section.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
                        Section.ClipsDescendants = true
                        Section.Position = UDim2.new(0.0274725277, 0, 0, 0)
                        Section.Size = UDim2.new(0, 426, 0, 75)

                        UICorner.CornerRadius = UDim.new(0, 6)
                        UICorner.Parent = Section

                        SectionTitle.Name = "SectionTitle"
                        SectionTitle.Parent = Section
                        SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SectionTitle.BackgroundTransparency = 1.000
                        SectionTitle.Size = UDim2.new(0, 418, 0, 20)
                        SectionTitle.Font = Enum.Font.GothamSemibold
                        SectionTitle.Text = nameofsection
                        SectionTitle.TextColor3 = Color3.fromRGB(35, 35, 35)
                        SectionTitle.TextSize = 14.000
                        SectionTitle.TextXAlignment = Enum.TextXAlignment.Center

                        UIPadding.Parent = SectionTitle
                        UIPadding.PaddingTop = UDim.new(0, 11)

                        UIListLayout.Parent = Section
                        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                        UIListLayout.Padding = UDim.new(0, 7)
                    --[[
                        TextButton.Parent = Section
                        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton.Position = UDim2.new(-0.225352108, 0, 0.295454532, 0)
                        TextButton.Size = UDim2.new(0, 409, 0, 39)
                        TextButton.AutoButtonColor = false
                        TextButton.Font = Enum.Font.GothamSemibold
                        TextButton.TextColor3 = Color3.fromRGB(50, 50, 50)
                        TextButton.TextSize = 13.000

                        UICorner_2.CornerRadius = UDim.new(0, 6)
                        UICorner_2.Parent = TextButton
                        ]]
                        spawn(function()
                            while wait() do
                                Tween:Create(Section,TweenInfo.new(.1), {Size = UDim2.new(0,426,0,UIListLayout.AbsoluteContentSize.Y + 10)}):Play()
                            end
                        end)

                        local elements = {}
                        function elements:Button(buttonname,callback)
                            buttonname = tostring(buttonname) or 'New Button'
                            if not buttonname then buttonname = 'New Button' end 
                            callback = callback or function () end 
                            if not callback then callback = function() end end 
                           
                            local Btn = Instance.new("TextButton")
                            local UICorner = Instance.new("UICorner")
                            local Sample = Instance.new("ImageLabel")

                            Btn.Name = "Btn"
                            Btn.Parent = Section
                            Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Btn.Position = UDim2.new(-0.225352108, 0, 0.295454532, 0)
                            Btn.Size = UDim2.new(0, 409, 0, 39)
                            Btn.AutoButtonColor = false
                            Btn.Font = Enum.Font.GothamSemibold
                            Btn.TextColor3 = Color3.fromRGB(50, 50, 50)
                            Btn.TextSize = 13.000
                            Btn.Text = buttonname
                            Btn.ClipsDescendants = true 

                            Sample.Name = "Sample"
                            Sample.Parent = Btn
                            Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Sample.BackgroundTransparency = 1.000
                            Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                            Sample.ImageColor3 = Color3.fromRGB(170,170,170)
                            Sample.ImageTransparency = 0.600
    
                            UICorner.CornerRadius = UDim.new(0, 6)
                            UICorner.Parent = Btn

                            Btn.MouseButton1Click:Connect(function()
                                pcall(callback)
                                Btn.TextSize = 0 
                                Functions:Tween(Btn, { TextSize = 15 }, 0.2)
                                wait(.2)
                                Functions:Tween(Btn,{TextSize = 13},.2)
                                local c = Sample:Clone()
                            c.Parent = Btn
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            local len, size = 0.35, nil
                            if Btn.AbsoluteSize.X >= Btn.AbsoluteSize.Y then
                                size = (Btn.AbsoluteSize.X * 1.5)
                            else
                                size = (Btn.AbsoluteSize.Y * 1.5)
                            end
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency = c.ImageTransparency + 0.05
                                wait(len / 12)
                            end
                            c:Destroy()
                            end)
                            Btn.MouseEnter:Connect(function(x, y)
                                Tween:Create(Btn,TweenInfo.new(.25),{BackgroundColor3 = Color3.fromRGB(222,222,222)}):Play()
                            end)
                            Btn.MouseLeave:Connect(function(x, y)
                                Tween:Create(Btn,TweenInfo.new(.25),{BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
                            end)
                         end
                         function elements:Toggle(togname,callback,default)
                             togname = togname or 'New Toggle'
                             if not togname then togname = 'New Toggle' end 
                             callback = callback or function () end 
                             if not callback then callback = function() end end 
                             if not default then default = false  end 

                        local Toggle = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local ToggleTitle = Instance.new("TextLabel")
                        local ToggleButton = Instance.new("TextButton")
                        local ToggleBack = Instance.new("Frame")
                        local UICorner_2 = Instance.new("UICorner")
                        local Sample = Instance.new("ImageLabel")
                        local Shadow = Instance.new("ImageLabel")

                       
                        
                        Toggle.Name = "Toggle"
                        Toggle.Parent = Section
                        Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Toggle.Size = UDim2.new(0, 409, 0, 39)
                        Toggle.ClipsDescendants = true
                        UICorner.CornerRadius = UDim.new(0, 6)
                        UICorner.Parent = Toggle

                        Sample.Name = "Sample"
                        Sample.Parent = Toggle
                        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Sample.BackgroundTransparency = 1.000
                        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                        Sample.ImageColor3 = Color3.fromRGB(170,170,170)
                        Sample.ImageTransparency = 0.600


                        ToggleTitle.Name = "ToggleTitle"
                        ToggleTitle.Parent = Toggle
                        ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleTitle.BackgroundTransparency = 1.000
                        ToggleTitle.Position = UDim2.new(0.0268948656, 0, 0, 0)
                        ToggleTitle.Size = UDim2.new(0, 339, 0, 39)
                        ToggleTitle.Font = Enum.Font.GothamSemibold
                        ToggleTitle.Text = togname
                        ToggleTitle.TextColor3 = Color3.fromRGB(35, 35, 35)
                        ToggleTitle.TextSize = 13.000
                        ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                        ToggleButton.Name = "ToggleButton"
                        ToggleButton.Parent = Toggle
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleButton.BackgroundTransparency = 1.000
                        ToggleButton.Size = UDim2.new(0, 409, 0, 39)
                        ToggleButton.Font = Enum.Font.SourceSans
                        ToggleButton.Text = ""
                        ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        ToggleButton.TextSize = 14.000

                        ToggleBack.Name = "ToggleBack"
                        ToggleBack.Parent = Toggle
                        ToggleBack.AnchorPoint = Vector2.new(0.5, 0.5)
                        ToggleBack.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
                        ToggleBack.Position = UDim2.new(0.956, 0,0.499, 0)
                        ToggleBack.Size = UDim2.new(0, 23, 0, 24)
                        ToggleBack.ZIndex = 3
                      
                        Shadow.Name = "Shadow"
                        Shadow.Parent = Toggle.ToggleBack
                        Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Shadow.BackgroundTransparency = 1.000
                        Shadow.Position = UDim2.new(0, -15, 0, -16)
                        Shadow.Size = UDim2.new(1, 30, 1, 30)
                        Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                        Shadow.ImageColor3 = Color3.fromRGB(49, 211, 255)
                        Shadow.ScaleType = Enum.ScaleType.Slice
                        Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
                        Shadow.ImageTransparency = 1 


                        UICorner_2.CornerRadius = UDim.new(0, 6)
                        UICorner_2.Parent = ToggleBack

                        local State = default
                      
                        if default then
                        State = true
                        else
                        State = false
                        end

                        ToggleButton.MouseButton1Click:Connect(function()
                            State = not State
                            local NewColour = State and Color3.fromRGB(37, 150, 190) or Color3.fromRGB(215, 215, 215)
                            Tween:Create(ToggleBack, TweenInfo.new(.25), {BackgroundColor3 = NewColour}):Play()
                            Tween:Create(Shadow,TweenInfo.new(.25),{ImageTransparency = 0}):Play()
                            pcall(callback, State)
                            if not State then
                                Tween:Create(Shadow,TweenInfo.new(.1),{ImageTransparency = 1}):Play()
                            end
                            local c = Sample:Clone()
                            c.Parent = Toggle 
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            local len, size = 0.35, nil
                            if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
                                size = (Toggle.AbsoluteSize.X * 1.5)
                            else
                                size = (Toggle.AbsoluteSize.Y * 1.5)
                            end
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency = c.ImageTransparency + 0.05
                                wait(len / 12)
                            end
                            c:Destroy()
                        end)
                        if default then
                            ToggleBack.BackgroundColor3 = Color3.fromRGB(37, 150, 190)
                            pcall(callback, State)
                            Shadow.ImageTransparency = 0
                        else
                            ToggleBack.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
                            Shadow.ImageTransparency = 1 
                            pcall(callback, State)
                            end
                         end
                         function elements:Dropdown(name,list,callback)
                            name = name or 'New Dropdown' 
                            if not name then name = 'New Dropdown'  end 
                            list = list or {} 
                            if not list then list = {"You forgot your list!"} end 
local dropped = false 
local dropfunctions = {}
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropToggle = Instance.new("TextButton")
                local ImageLabel = Instance.new("ImageLabel")
                local DropName = Instance.new("TextLabel")
                local f = Instance.new("UIListLayout")
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.ClipsDescendants = true
                Dropdown.Position = UDim2.new(0.0199530516, 0, 0.592039824, 0)
                Dropdown.Size = UDim2.new(0, 409, 0, 39)

                UICorner.CornerRadius = UDim.new(0, 6)
                UICorner.Parent = Dropdown

                DropToggle.Name = "DropToggle"
                DropToggle.Parent = Dropdown
                DropToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropToggle.BackgroundTransparency = 1.000
                DropToggle.Size = UDim2.new(0, 409, 0, 39)
                DropToggle.Font = Enum.Font.SourceSans
                DropToggle.Text = ""
                DropToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropToggle.TextSize = 14.000

                ImageLabel.Parent = DropToggle
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.Position = UDim2.new(0.926650405, 0, 0.153846145, 0)
                ImageLabel.Selectable = true
                ImageLabel.Size = UDim2.new(0, 23, 0, 27)
                ImageLabel.Image = "rbxassetid://9475301054"
                ImageLabel.ImageColor3 = Color3.fromRGB(35, 35, 35)
                ImageLabel.ScaleType = Enum.ScaleType.Fit

                DropName.Name = "DropName"
                DropName.Parent = DropToggle
                DropName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropName.BackgroundTransparency = 1.000
                DropName.Position = UDim2.new(0.0268948656, 0, 0, 0)
                DropName.Selectable = true
                DropName.Size = UDim2.new(0, 361, 0, 39)
                DropName.Font = Enum.Font.GothamSemibold
                DropName.Text = tostring(name)
                DropName.TextColor3 = Color3.fromRGB(35, 35, 35)
                DropName.TextSize = 13.000
                DropName.TextXAlignment = Enum.TextXAlignment.Left

                f.Parent = Dropdown
                f.HorizontalAlignment = Enum.HorizontalAlignment.Center
                f.SortOrder = Enum.SortOrder.LayoutOrder
                f.Padding = UDim.new(0, 6)

                local function newitem(v)
                    local Dropitem = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")
    
                
                Dropitem.Name = "Dropitem"
                Dropitem.Parent = Dropdown
                Dropitem.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
                Dropitem.Position = UDim2.new(0, 0, 1.15384614, 0)
                Dropitem.Size = UDim2.new(0, 402, 0, 25)
                Dropitem.AutoButtonColor = false
                Dropitem.Font = Enum.Font.Gotham
                Dropitem.Text = v
                Dropitem.TextColor3 = Color3.fromRGB(35, 35, 35)
                Dropitem.TextSize = 12.000

                UICorner_2.CornerRadius = UDim.new(0, 6)
                UICorner_2.Parent = Dropitem

                Dropitem.MouseButton1Click:Connect(function()
                    pcall(callback,Dropitem.Text)
                    Tween:Create(Dropdown,TweenInfo.new(.2),{Size = UDim2.new(0, 409, 0, 36)}):Play()
                    DropName.Text = name .. " - " .. Dropitem.Text
                    dropped = false 
                    Tween:Create(ImageLabel,TweenInfo.new(.2),{Rotation = 0}):Play()
                end)
                Dropitem.MouseEnter:Connect(function()
                    Tween:Create(Dropitem,TweenInfo.new(.25), { BackgroundColor3 = Color3.fromRGB(230,230,230)}):Play()
                end)
                Dropitem.MouseLeave:Connect(function()
                    Tween:Create(Dropitem,TweenInfo.new(.25), { BackgroundColor3 = Color3.fromRGB(215, 215, 215)}):Play()
                end)
                end

        for i,v in next, list do
            newitem(v)
        end
        DropToggle.MouseButton1Click:Connect(function()
            if dropped then
                dropped = false 
                Tween:Create(Dropdown,TweenInfo.new(.2),{Size = UDim2.new(0, 409, 0, 36)}):Play()
                Tween:Create(ImageLabel,TweenInfo.new(.2),{Rotation = 0}):Play()

            else
                dropped = true
                Tween:Create(ImageLabel,TweenInfo.new(.2),{Rotation = 180}):Play()
                Tween:Create(Dropdown,TweenInfo.new(.2),{Size = UDim2.new(0, 409, 0,f.AbsoluteContentSize.Y + 9)}):Play()
            end
          end)

          function dropfunctions:Refresh(newList)
            newList = newList or {}
                if not newList then newList = {"1"} end 
                for i,v in pairs(Dropdown:GetChildren()) do
                    if v:IsA("TextButton") and v.Name == "Dropitem" then
                        v:Destroy()
                    end
                end
                for i,v in pairs(newList) do 
                        newitem(v)
                end
            end   
          return dropfunctions
                         end
                         function elements:Textbox(title,callback,default)
                             title = title or "New Textbox"
                             if not title then title = "New Textbox" end 
                             if not default then default = "" end 
                             callback = callback or function() end 
                             if not callback then callback = function() end end 

                        local TB = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local TBTitle = Instance.new("TextLabel")
                        local Input = Instance.new("TextBox")
                        local UICorner_2 = Instance.new("UICorner")
                        local TBFocus = Instance.new("TextButton")
                            local adsad = Instance.new("UIPadding")
                        TB.Name = "TB"
                        TB.Parent = Section
                        TB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TB.Size = UDim2.new(0, 409, 0, 39)

                        UICorner.CornerRadius = UDim.new(0, 6)
                        UICorner.Parent = TB

                        TBTitle.Name = "TBTitle"
                        TBTitle.Parent = TB
                        TBTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TBTitle.BackgroundTransparency = 1.000
                        TBTitle.Position = UDim2.new(0.0268948656, 0, 0, 0)
                        TBTitle.Size = UDim2.new(0, 137, 0, 39)
                        TBTitle.Font = Enum.Font.GothamSemibold
                        TBTitle.Text = title 
                        TBTitle.TextColor3 = Color3.fromRGB(35, 35, 35)
                        TBTitle.TextSize = 13.000
                        TBTitle.TextXAlignment = Enum.TextXAlignment.Left


                        TBFocus.Name = "DropToggle"
                        TBFocus.Parent = TB
                        TBFocus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TBFocus.BackgroundTransparency = 1.000
                        TBFocus.Size = UDim2.new(0, 409, 0, 39)
                        TBFocus.Font = Enum.Font.SourceSans
                        TBFocus.Text = ""
                        TBFocus.TextColor3 = Color3.fromRGB(0, 0, 0)
                        TBFocus.TextSize = 14.000

                        Input.Name = "Input"
                        Input.Parent = TB
                        Input.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
                        Input.Position = UDim2.new(0.628361881, 0, 0.153846174, 0)
                        Input.Size = UDim2.new(0, 145, 0, 26)
                        Input.Font = Enum.Font.Gotham
                        Input.Text = ""
                        Input.TextColor3 = Color3.fromRGB(55, 55, 55)
                        Input.TextSize = 14.000
                        Input.TextTruncate = Enum.TextTruncate.AtEnd
                        Input.PlaceholderText = default

                        adsad.Parent = Input 
                        adsad.PaddingLeft = UDim.new(0,6)
            
                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = Input



                        TBFocus.MouseButton1Click:Connect(function()
                            Tween:Create(Input,TweenInfo.new(.13), { Size = UDim2.new(0,202,0,26)}):Play()
                            Tween:Create(Input,TweenInfo.new(.13), { Position = UDim2.new(0.489, 0,0.154, 0)}):Play()
                            Input.TextXAlignment = Enum.TextXAlignment.Left
                            Input:CaptureFocus()
                        end)
                        Input.Focused:Connect(function()
                            Tween:Create(Input,TweenInfo.new(.13), { Size = UDim2.new(0,202,0,26)}):Play()
                            Tween:Create(Input,TweenInfo.new(.13), { Position = UDim2.new(0.489, 0,0.154, 0)}):Play()
                            Input.TextXAlignment = Enum.TextXAlignment.Left
                        end)
                        Input.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
                            if enterPressed then
                                pcall(callback, Input.Text)
                                Tween:Create(Input,TweenInfo.new(.13), { Size = UDim2.new(0,145,0,26)}):Play()
                                Tween:Create(Input,TweenInfo.new(.13), { Position = UDim2.new(0.628361881, 0, 0.153846174, 0)}):Play()

                                Input.TextXAlignment = Enum.TextXAlignment.Center
                            end
                        end)
                        Input.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
                            if not enterPressed then
                                Tween:Create(Input,TweenInfo.new(.13), { Size = UDim2.new(0,145,0,26)}):Play()
                                Tween:Create(Input,TweenInfo.new(.13), { Position = UDim2.new(0.628361881, 0, 0.153846174, 0)}):Play()

                                Input.TextXAlignment = Enum.TextXAlignment.Center
                            end
                        end)
                         end
                         function elements:Keybind(title,key,callback)
                                title = title or 'New Keybind';
                                if not title then title = 'New Keybind' end 
                                if not key then key = Enum.KeyCode.F end 
                                callback = callback or function() end 
                                if not callback then callback = function() end end 

                             local   oldKey =  key.Name 

  
                    local Keybind = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local KeybindTitle = Instance.new("TextLabel")
                    local KeyToggle = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")
                    local Shadow = Instance.new("ImageLabel")

                    Keybind.Name = "Keybind"
                    Keybind.Parent = Section
                    Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Keybind.Size = UDim2.new(0, 409, 0, 39)

                    UICorner.CornerRadius = UDim.new(0, 6)
                    UICorner.Parent = Keybind

                    KeybindTitle.Name = "KeybindTitle"
                    KeybindTitle.Parent = Keybind
                    KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    KeybindTitle.BackgroundTransparency = 1.000
                    KeybindTitle.Position = UDim2.new(0.0268948656, 0, 0, 0)
                    KeybindTitle.Size = UDim2.new(0, 339, 0, 39)
                    KeybindTitle.Font = Enum.Font.GothamSemibold
                    KeybindTitle.Text = title
                    KeybindTitle.TextColor3 = Color3.fromRGB(35, 35, 35)
                    KeybindTitle.TextSize = 13.000
                    KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

                    KeyToggle.Name = "KeyToggle"
                    KeyToggle.Parent = Keybind
                    KeyToggle.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
                    KeyToggle.Position = UDim2.new(0.731051326, 0, 0.15384616, 0)
                    KeyToggle.Size = UDim2.new(0, 103, 0, 26)
                    KeyToggle.AutoButtonColor = false
                    KeyToggle.Font = Enum.Font.GothamSemibold
                    KeyToggle.Text = oldKey
                    KeyToggle.TextColor3 = Color3.fromRGB(35, 35, 35)
                    KeyToggle.TextSize = 12.000

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = KeyToggle

                    Shadow.Name = "Shadow"
                    Shadow.Parent = KeyToggle
                    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow.BackgroundTransparency = 1.000
                    Shadow.Position = UDim2.new(0, -15, 0, -15)
                    Shadow.Size = UDim2.new(1, 30, 1, 30)
                    Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                    Shadow.ImageColor3 = Color3.fromRGB(235, 235, 235)
                    Shadow.ScaleType = Enum.ScaleType.Slice
                    Shadow.SliceCenter = Rect.new(23, 23, 277, 277)


    
                    KeyToggle.MouseButton1Click:Connect(function()
                       
                        KeyToggle.TextSize = 0 
                        Functions:Tween(KeyToggle, { TextSize = 15 }, 0.2)
                        KeyToggle.Text = "..."
                        wait(.2)
                        Functions:Tween(KeyToggle,{TextSize = 13},.2)
                        KeyToggle.Text = "..."
                        local a, b = game:GetService('UserInputService').InputBegan:wait();
                        if a.KeyCode.Name ~= "Unknown" then
                            KeyToggle.Text = a.KeyCode.Name
                            oldKey = a.KeyCode.Name;
                        end
                    end)
                    game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                        if not ok then 
                            if current.KeyCode.Name == oldKey then 
                                pcall(callback)
                            end
                        end
                    end)
                         end
                         function elements:Slider(title,minvalue,maxvalue,callback)
                             title = title or 'New Slider'
                             if not title then title = 'New Slider' end
                             minvalue = minvalue or 16 
                             if not minvalue then minvalue = 16 end 
                             maxvalue = maxvalue or 500 
                             if not maxvalue then maxvalue = 500 end 
                            callback = callback or function() end 
                            if not callback then callback = function() end end 

 
local Slider = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local LargeTextboxText = Instance.new("TextLabel")
local SliderInt = Instance.new("TextLabel")
local SliderButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SliderInner = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")


Slider.Name = "Slider"
Slider.Parent = Section
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.Position = UDim2.new(0.0199530516, 0, 0.545647562, 0)
Slider.Size = UDim2.new(0, 409, 0, 53)

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Slider

LargeTextboxText.Name = "LargeTextboxText"
LargeTextboxText.Parent = Slider
LargeTextboxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LargeTextboxText.BackgroundTransparency = 1.000
LargeTextboxText.Position = UDim2.new(0.0268948656, 0, 0, 0)
LargeTextboxText.Size = UDim2.new(0, 339, 0, 39)
LargeTextboxText.Font = Enum.Font.GothamSemibold
LargeTextboxText.Text = title
LargeTextboxText.TextColor3 = Color3.fromRGB(35, 35, 35)
LargeTextboxText.TextSize = 13.000
LargeTextboxText.TextXAlignment = Enum.TextXAlignment.Left

SliderInt.Name = "SliderInt"
SliderInt.Parent = Slider
SliderInt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderInt.BackgroundTransparency = 1.000
SliderInt.Position = UDim2.new(0.726161361, 0, -0.00553459115, 0)
SliderInt.Size = UDim2.new(0, 102, 0, 39)
SliderInt.Font = Enum.Font.GothamSemibold
SliderInt.Text = tostring(minvalue)
SliderInt.TextColor3 = Color3.fromRGB(35, 35, 35)
SliderInt.TextSize = 13.000
SliderInt.TextXAlignment = Enum.TextXAlignment.Right
SliderInt.TextTransparency = 0


SliderButton.Name = "SliderButton"
SliderButton.Parent = Slider
SliderButton.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
SliderButton.Position = UDim2.new(0.0220048893, 0, 0.723018885, 0)
SliderButton.Size = UDim2.new(0, 390, 0, 9)
SliderButton.AutoButtonColor = false
SliderButton.Font = Enum.Font.SourceSans
SliderButton.Text = ""
SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderButton.TextSize = 14.000

UICorner_2.Parent = SliderButton

SliderInner.Name = "SliderInner"
SliderInner.Parent = SliderButton
SliderInner.BackgroundColor3 = Color3.fromRGB(37, 150, 190)
SliderInner.BorderColor3 = Color3.fromRGB(255, 255, 255)
SliderInner.Size = UDim2.new(0, 0, 0, 9)


UICorner_3.Parent = SliderInner


local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")
local Value;
 

SliderButton.MouseButton1Down:Connect(function()
Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 390) * SliderInner.AbsoluteSize.X) + tonumber(minvalue)) or 0

    
    pcall(callback)
    SliderInt.Text = Value
                
  Tween:Create(SliderInt,TweenInfo.new(.7), { TextTransparency = 0 }):Play()
  SliderInt.TextTransparency = 0


SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 390), 0, 9)
moveconnection = mouse.Move:Connect(function()
    SliderInt.Text = Value
                
    Tween:Create(SliderInt,TweenInfo.new(.7), { TextTransparency = 0 }):Play()
    SliderInt.TextTransparency = 0
  
    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 390) *SliderInner.AbsoluteSize.X) + tonumber(minvalue))
    pcall(callback)
    SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 390), 0, 9)
end)
releaseconnection = uis.InputEnded:Connect(function(Mouse)
    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 390) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
        SliderInt.Text = Value
                
        Tween:Create(SliderInt,TweenInfo.new(.7), { TextTransparency = 0 }):Play()
        SliderInt.TextTransparency = 0
      
        pcall(callback)
        SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 390), 0, 9)
        moveconnection:Disconnect()
        releaseconnection:Disconnect()
    end
end)
end)




                         end
                         return elements
                end
                return Sections
            end
            return Inside 
end
print("elsiah was here ⚔")
return Lib

