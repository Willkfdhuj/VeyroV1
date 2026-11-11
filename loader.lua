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

local function Load(path)
    local source = Download(path)

    if not source then
        return false
    end

    local chunk = loadstring(source, path)

    if not chunk then
        warn("[Veyro] Failed to compile " .. path)
        return false
    end

    local success, result = pcall(chunk)

    if not success then
        warn("[Veyro] Error in " .. path .. ": " .. tostring(result))
        return false
    end

    print("[Veyro] Loaded " .. path)
    return true
end
