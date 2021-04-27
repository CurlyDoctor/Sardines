local TestService = {}

function TestService:Start()
    type callback = {
        execute: () -> ()?
    }
    
    local myCallback: callback = {}

    print(type(callback))
end

function TestService:Init()


end

return TestService