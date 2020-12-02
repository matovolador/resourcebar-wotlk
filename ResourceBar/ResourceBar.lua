local f_health_background = CreateFrame("StatusBar","CustomHealthBarBackground",UIParent)
local f_health = CreateFrame("Statusbar","CustomHealthBar",UIParent)
local f_resource_background = CreateFrame("StatusBar","CustomResourceBarBackground",UIParent)
local f_resource = CreateFrame("Statusbar","CustomResourceBar",UIParent)

f_health_background:SetMinMaxValues(0,100)
f_health_background:SetPoint("CENTER",0,-60)
f_health_background:SetSize(120,10)
f_health_background:Show()
f_health_background:SetValue(100)
f_health_background:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
f_health_background:SetStatusBarColor(1,1,1,0.5)
f_health_background:SetFrameLevel(0)

f_health:SetMinMaxValues(0,100)
f_health:SetPoint("CENTER",0,-60)
f_health:SetSize(120,10)
f_health:Show()
f_health:SetValue(100)
f_health:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
f_health:SetStatusBarColor(0, 1,0,1)
f_health:SetFrameLevel(1)

f_resource_background:SetMinMaxValues(0,100)
f_resource_background:SetPoint("CENTER",0,-70)
f_resource_background:SetSize(120,10)
f_resource_background:Show()
f_resource_background:SetValue(100)
f_resource_background:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
f_resource_background:SetStatusBarColor(1,1,1,0.5)
f_resource_background:SetFrameLevel(0)

f_resource:SetMinMaxValues(0,100)
f_resource:SetPoint("CENTER",0,-70)
f_resource:SetSize(120,10)
f_resource:Show()
f_resource:SetValue(100)
f_resource:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
f_resource:SetStatusBarColor(0.3, 0.4,0.4)
f_resource:SetFrameLevel(1)

f_health:SetScript("OnEvent",function(self,unit)
    
    f_health:SetValue(UnitHealth("player")/UnitHealthMax("player")*100);
    
end);

f_resource:SetScript("OnEvent",function(self,unit)
    self:SetValue(UnitMana("player")/UnitManaMax("player")*100)
    power_type = UnitPowerType("player")
    -- if (power_type == 0) then
    --     resource_bar:SetStatusBarColor(0.18, 0.44, 0.75, 1)
    -- elseif (power_type == 1) then
    --     resource_bar:SetStatusBarColor(1,0,0,1)
    -- elseif (power_type == 3) then
    --     resource_bar:SetStatusBarColor(1,1,0,1)
    -- elseif (power_type == 6) then
    --     resource_bar:SetStatusBarColor(0, 0.82, 1, 1)
    -- end
    -- if (UnitMana("player") == 0) then
    --     resource_bar:SetStatusBarColor(0,0,0,0)
    -- end
    self:SetStatusBarColor(PowerBarColor[power_type].r, PowerBarColor[power_type].g, PowerBarColor[power_type].b)
end);

f_health:RegisterEvent("UNIT_HEALTH");
f_resource:RegisterEvent("UNIT_MANA","UNIT_POWER")
f_resource:RegisterEvent("UNIT_RAGE","UNIT_POWER")
f_resource:RegisterEvent("UNIT_ENERGY","UNIT_POWER")
f_resource:RegisterEvent("UNIT_FOCUS","UNIT_POWER")
f_resource:RegisterEvent("UNIT_RUNIC_POWER","UNIT_POWER")

f_health:RegisterEvent("PLAYER_ENTERING_WORLD")
f_health:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f_resource:RegisterEvent("PLAYER_ENTERING_WORLD")
f_resource:RegisterEvent("ZONE_CHANGED_NEW_AREA")