local InputController = {Server = {}}

local UIS = game:GetService("UserInputService")

function InputController.Server.Ready()
    InputController.Ready = true
end

function InputController.Server.NotYet()
    InputController.Ready = false
end

function InputController:Start()
    self.Ready = false
    

    UIS.InputBegan:Connect(function(input)
        if self.Ready == true  then 
                print("Hey")
            if input.KeyCode == Enum.KeyCode.E then 
                self:Fire("TurnOnFaucet")
            elseif input.KeyCode == Enum.KeyCode.R then 
                self:Fire("TurnOffFaucet")
            end
        
        end 
        
        
    end)
end

function InputController:Init()
    self:RegisterFunction()
end

return InputController