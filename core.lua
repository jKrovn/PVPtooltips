local function Update(id)
    -- If Spell ID was not passed, search for it
    if not id then
        local _, spellID = GameTooltip:GetSpell();
        id = spellID;
    end

    local function CheckModifiers(name)
        if name[id] then
            GameTooltip:AddLine(string.format("\n%s %s.\n", "|cFF00aaffPvP:|r", name[id]["text"]));
        end
    end

    -- Loop through all Classes and Specilizations 
    for k, _ in pairs(Specilizations) do
        CheckModifiers(k)
    end

    -- Check modifiers which affects all Classes
    if RestModifiers[id] then
        GameTooltip:AddLine(string.format("\n%s %s.\n", "|cFF00aaffPvP:|r", RestModifiers[id]["text"]));
    else
        if id then
            GameTooltip:AddLine("\nSpell ID: " .. id, 0.6, 0.6, 0.6);
        end
    end

    GameTooltip:Show();
end

do
    hooksecurefunc(GameTooltip, "SetTalent", function()
        Update();
    end);
    hooksecurefunc(GameTooltip, "SetAction", function()
        Update();
    end);
    hooksecurefunc(GameTooltip, "SetSpellByID", function()
        Update();
    end);
    hooksecurefunc(GameTooltip, "SetShapeshift", function()
        Update();
    end);
    hooksecurefunc(GameTooltip, "SetSpellBookItem", function()
        Update();
    end);
    hooksecurefunc(GameTooltip, "SetSpellByID", function()
        Update();
    end);
end
