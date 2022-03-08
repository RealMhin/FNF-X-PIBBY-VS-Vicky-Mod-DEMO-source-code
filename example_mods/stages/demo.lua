local angleshit = 1;
local anglevar = 1;
function onCreate()
	makeLuaSprite('bg','dmbg',-343.15, -295.45)
	addLuaSprite('bg',false)

	makeAnimatedLuaSprite('sexualintercourse', 'sprites/pibby', 940, 90);
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

function onBeatHit()
	if curBeat < 388 then
		triggerEvent('Add Camera Zoom', 0.04,0.05)

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*3)
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
		
end

function onStepHit()
	if curBeat < 388 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end
end