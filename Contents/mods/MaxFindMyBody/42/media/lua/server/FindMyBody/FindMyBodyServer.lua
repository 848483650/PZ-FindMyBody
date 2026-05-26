local FindMyBodyServer = {
}
local px, py = nil, nil
local findBodymarker = nil

---@param player IsoPlayer
function OnPlayerDeath(player)
    if player ~= nil then
    px = player:getX()
    py = player:getY()

    if findBodymarker == nil then
        findBodymarker = FindMyBodyServer.addMarker(px, py)
    end
end
end

function FindMyBodyServer.reset()
    if findBodymarker ~= nil then FindMyBodyServer.removeMarker(findBodymarker) end
    findBodymarker = nil
    px, py = nil, nil
end

function FindMyBodyServer.addMarker(x, y)
  local map = ISWorldMap_instance.mapAPI;
  local markers = map:getMarkersAPI()
    -- x y radius red green blue alp
    return markers:addGridSquareMarker(x, y, 0.5, 0, 255, 0, 0.5)
end

function FindMyBodyServer.removeMarker(marker)
        local mapAPI = ISWorldMap.mapAPI;
    local markers = mapAPI:getMarkersAPI();
    markers:removeMarker(marker);
end
Events.OnPlayerDeath.Add(OnPlayerDeath)