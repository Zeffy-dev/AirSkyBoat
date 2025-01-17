-----------------------------------
-- Nether Blast
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
require("scripts/globals/magic")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onPetAbility = function(target, pet, skill)
    local damage = pet:getMainLvl() + 2
    damage = xi.mobskills.mobMagicalMove(pet, target, skill, damage, xi.magic.ele.DARK, 5, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage.dmg, xi.magic.ele.DARK)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, skill, target, xi.attackType.BREATH, xi.damageType.DARK, 1)
    target:takeDamage(damage, pet, xi.attackType.BREATH, xi.damageType.DARK)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return ability_object
