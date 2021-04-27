local WithinRangeService = {}

local TweenService = game:GetService("TweenService")


function WithinRangeService:Start()
    local LoadedAnimationID = Instance.new("Animation")
    LoadedAnimationID.AnimationId = "rbxassetid://".. 6735496381

    local OldSize = Vector3.new(0.465, 0.05, 0.332)
    local NewSize = Vector3.new(0.465, 3.65, 0.332)

    local TWEEN_INFO = TweenInfo.new(1)
    local Property = {
        
    }

    local Anim 
    local Instance = game.Workspace.Kitchen.Water


    self:ConnectEvent("TurnOnFaucet", function(player)
        Property.Size =  NewSize
        Property.Position = Vector3.new(-9.053, 2.125, -37.178)
        
        local Tween =  TweenService:Create(Instance, TWEEN_INFO, Property)
        Tween:Play()

        Tween.Completed:Connect(function()
            game.Workspace.Smooth.Transparency = 0
        end)

            self.Shared.FastWait.Wait()

            Anim = player.Character.Humanoid:LoadAnimation(LoadedAnimationID)
            Anim:Play()
            Anim.Looped = true

    end)
    
    self:ConnectEvent("TurnOffFaucet", function(player)
        Property.Position = Vector3.new(-9.053, 3.818, -37.178)
        Property.Size = OldSize
 

        local Tween = TweenService:Create(Instance, TWEEN_INFO, Property)
        Tween:Play()
        Tween.Completed:Connect(function()
            game.Workspace.Smooth.Transparency = 1
        end)
        if Anim then
            print("Animation is There!")
            Anim:Stop()
            Anim:Destroy()
        end
    end)



        game.Workspace.Kitchen.Inner.Touched:Connect(function(hit)
            if hit.Parent:FindFirstChild("Humanoid") then
                game.Workspace.Kitchen.BillboardGui.Enabled = true
                self:FireClient("Ready", game.Players:GetPlayerFromCharacter(hit.Parent))
              end
        end)
        game.Workspace.Kitchen.Outer.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            game.Workspace.Kitchen.BillboardGui.Enabled = false 
            self:FireClient("NotYet", game.Players:GetPlayerFromCharacter(hit.Parent))

            if Anim then
                Anim:Stop()
                Anim:Destroy()
            end
          end
        end)
    
end

function WithinRangeService:Init()
    self:RegisterEvent("TurnOnFaucet")
    self:RegisterEvent("TurnOffFaucet")
    self:RegisterFunction("Ready")
    self:RegisterFunction("NotYet")
end

return WithinRangeService