local poison = false;
function onCreate()
	--Iterate over all notes
	makeLuaSprite('cover', 'glow', -600, -300);
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shield' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ShieldNotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 0);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Shield' then
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('boyfriend', 'shoot', true);
		setProperty('health', getProperty('health')+0.15);
		cameraShake('game', '0.012', '0.1')
		characterPlayAnim('dad', 'singUP', true);
		setProperty('dad.specialAnim', true);
	end
end

function onStepHit()
    if poison==true then
		health = getProperty('health')
		if getProperty('health') > 0.35 then
        	setProperty('health', getProperty('health')-0.3);
		end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'poisonStop' then
        poison=false
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Shield' then
		addMisses(1);
		runTimer('poisonStop', '5', '1')
		poison=true
	end
end