function onCreate()
	-- background shit
	makeLuaSprite('vickystage', 'vickystage', -600, -300);
	setScrollFactor('vickystage', 0.9, 0.9);
	

	makeAnimatedLuaSprite('sexualintercourse', 'sprites/pibby', 920, 285);
	scaleObject('sexualintercourse', 0.9, 0.9);
	addAnimationByPrefix('sexualintercourse', 'first', 'pibby', 14, true);
	objectPlayAnimation('sexualintercourse', 'first');

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end

	addLuaSprite('vickystage', false);
	addLuaSprite('sexualintercourse', false); -- false = add behind characters, true = add over characters
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('sexualintercourse', 'first');
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('sexualintercourse', 'first');
	end
end