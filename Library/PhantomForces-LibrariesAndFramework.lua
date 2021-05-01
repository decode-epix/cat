-- Libaries and framework (open source for faster loading time)
local getLibraries = function()
    local libs = { }
    success = pcall(function()
        local _ = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Library/CattoriESPLibrary.lua", true))
        local __ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/UILibrary.lua", true))
        libs = {
            esp = _(),
            ui = __()
        }
    end)
    return libs, success
end
local getFramework = function()
    local framework = { }
    local success = true
    
    success = pcall(function()
        for i,v in pairs(getgc(true)) do
            if type(v) == "function" then
                local function_name = debug.getinfo(v).name:lower()
                if function_name == "trajectory" and not framework.trajectory then
                    framework.trajectory = v
                end
                if function_name == "getgunlist" and not framework.getgunlist then
                    framework.getgunlist = v
                end
            end
            if type(v) == "table" then
                if rawget(v, "step") and rawget(v, "reset") and rawget(v, "new") and not framework.sound then
                    framework.particle = v
                end 
                if rawget(v, "PlaySoundId") and not framework.sound then
                    framework.sound = v
                end 
                if rawget(v, "setmovementmode") and not framework.character then
                    framework.character = v
                end    
                if rawget(v, "send") and not framework.network then
                    framework.network = v
                end
                if rawget(v, "gammo") and not framework.gamelogic then
                    framework.gamelogic = v
                end
                if rawget(v, "basecframe") and not framework.camera then
                    framework.camera = v
                end
                if rawget(v, "breakwindow") and not framework.effects then
                    framework.effects = v
                end
                if rawget(v, "firehitmarker") and not framework.uieffects then
                    framework.uieffects = v
                end
                if rawget(v, "getbodyparts") and not framework.replication then
                    framework.replication = v
                end
                if rawget(v, "bulletLifeTime") and not framework.publicsettings then
                    framework.publicsettings = v
                end
            end
        end
    end)
    return framework, success and (framework.trajectory and framework.getgunlist and framework.particle and framework.sound and framework.character and framework.network and framework.gamelogic and framework.camera and framework.effects and framework.uieffects and framework.replication and framework.publicsettings)
end
return getLibraries, getFramework