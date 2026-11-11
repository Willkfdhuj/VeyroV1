--!nocheck

local BASE_URL = "https://raw.githubusercontent.com/Willkfdhuj/Veyro/main/"
local function Download(path)
    local success, result = pcall(function()
        return game:HttpGet(BASE_URL .. path)
    end)

    if not success then
        warn("[Veyro] Failed to download " .. path)
        return nil
    end

    return result
end
