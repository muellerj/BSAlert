-- define the border as "backdrop"
local backdrop = {
  edgeFile = "Interface\\AddOns\\BSAlert\\border", edgeSize = 64,
  insets = {left = 64, right = 64, top = 64, bottom = 64},
}

-- build the frame
local BSAlert = CreateFrame("Frame")
BSAlert:SetFrameStrata("BACKGROUND")
BSAlert:SetWidth(GetScreenWidth() * UIParent:GetEffectiveScale())
BSAlert:SetHeight(GetScreenHeight() * UIParent:GetEffectiveScale())
BSAlert:SetBackdrop(backdrop)
BSAlert:SetPoint("CENTER",0,0)
BSAlert:Hide()

function HasBuff(unit, texturename)
  local id = 1;
  while (UnitBuff(unit, id)) do
    local buffTexture = UnitBuff(unit, id);
    if (string.find(buffTexture, texturename)) then
      return true;
    end
    id = id + 1;
  end
  return nil;
end

-- register for events
BSAlert:RegisterEvent("PLAYER_AURAS_CHANGED")

-- show/hide on combat
BSAlert:SetScript("OnEvent", function()
  if HasBuff("player", "Ability_Warrior_BattleShout") then
		BSAlert:Hide()
  else
		BSAlert:Show()
  end
end)
