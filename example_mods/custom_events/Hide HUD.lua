function onEvent(name, value1, value2)
	if name == 'Hide HUD' then
		value1=tonumber(value1);

		if value1 == 1 then --hide
			setProperty('scoreTxt.visible', false);
			setProperty('healthBar.visible', false);
			setProperty('healthBarBG.visible', false);	
			setProperty('iconP1.visible', false);
			setProperty('iconP2.visible', false);
			setProperty('botplayTxt.visible', false);
			setProperty('timeBar.visible', false);
			setProperty('timeBarBG.visible', false);
			setProperty('timeTxt.visible', false);
		elseif value1 == 0 then --bring it back
			setProperty('scoreTxt.visible', true);
			setProperty('healthBar.visible', true);
			setProperty('healthBarBG.visible', true);
			setProperty('iconP1.visible', true);
			setProperty('iconP2.visible', true);
			if botPlay == true then --in case it's supposed to stay hidden
				setProperty('botplayTxt.visible', true); 
			end
			setProperty('timeBar.visible', true);
			setProperty('timeBarBG.visible', true);
			setProperty('timeTxt.visible', true);
		end
	end
end