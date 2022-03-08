function onCreate()
	addCharacterToList('icon-bfv2', 'boyfriend');
	addCharacterToList('bf', 'boyfriend');
end

function onUpdate(elapsed)
	if getProperty('health') >= 1.6 then
	triggerEvent('Change Character', 0, 'bf11');
	else if getProperty('health') < 1.6 then
	triggerEvent('Change Character', 0, 'bf');
	
	end
	end
	end