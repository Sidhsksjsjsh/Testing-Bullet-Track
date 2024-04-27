-- // Metatable Variables
local mt = getrawmetatable(game)
local backupindex = mt.__index
setreadonly(mt,false)

local ValiantAimHacks = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Sidhsksjsjsh/ROBLOX/master/Universal/Experimental%20Silent%20Aim%20Module.lua"))()

mt.__namecall = newcclosure(function(...)
    local args = {...}
    local method = getnamecallmethod()

    if (method == "FireServer") then
        if (args[1].Name == "RemoteNameHere") then
            return backupnamecall(unpack(args))
        end
    end

    return backupnamecall(...)
end)
setreadonly(mt,true)

mt.__index = newcclosure(function(t,k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        if (ValiantAimHacks.checkSilentAim()) then
            local TargetPart = ValiantAimHacks.SelectedPart
             return (k == "Hit" and ValiantAimHacks.SelectedPart.CFrame or ValiantAimHacks.SelectedPart)
        end
    end

    return backupindex(t,k)
end)
setreadonly(mt,true)
