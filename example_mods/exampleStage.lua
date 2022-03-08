function onCreate()

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	    makeLuaSprite('vickystage', 'vickystage', -600, -300);
	    setScrollFactor('vickystage', 0.9, 0.9);
	end

	addLuaSprite('vickystage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end