-----------------------------------
--
-- Zone: Kazham-Jeuno_Airship
--
-----------------------------------
local ID = require("scripts/zones/Kazham-Jeuno_Airship/IDs")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0) then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

zone_object.onTransportEvent = function(player, transport)
    player:startEvent(10)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if (csid == 10) then
        local prevzone = player:getPreviousZone()
        if (prevzone == xi.zone.KAZHAM) then
            player:setPos(-26.30, 12, 109.13, 0, 246)
        elseif (prevzone == xi.zone.PORT_JEUNO) then
            player:setPos(0, 0, 0, 0, 250)
        else
            --fix for black screen if prevzone is not getting set correctly
            --or the player logged out during the airship, and the pos_prevzone was set TO the airship
            --set to Port Jeuno position 0,0,0
            player:setPos(0, 0, 0, 0, 246)
        end
    end
end

return zone_object
