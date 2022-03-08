function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stagebackP', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefrontP', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	makeAnimatedLuaSprite('sexualintercourse', 'sprites/pibby', 920, 285);
	scaleObject('sexualintercourse', 0.9, 0.9);
	addAnimationByPrefix('sexualintercourse', 'first', 'pibby', 14, true);
	objectPlayAnimation('sexualintercourse', 'first');

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
		setScrollFactor('stagelight_left', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);
		
		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtainsP', -500, -300);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('sexualintercourse', false); -- false = add behind characters, true = add over characters
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
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

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.17 then
            setProperty('health', health - 0.015);
        end
    end
	local luckyRoll = math.random(1, 50)
    
    if (luckyRoll >= 45) then
		cameraShake('hud', 0.08, 0.05);
		if mustHitSection == false then
			if getProperty('health') > 0.17 then
				setProperty('health', getProperty('health')-0.15);
			end
        end
    end
end