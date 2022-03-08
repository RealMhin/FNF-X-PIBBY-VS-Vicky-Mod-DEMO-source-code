function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet' then
		playSound('shoot', 0.6);
		characterPlayAnim('boyfriend', 'attack', true);
		setProperty('boyfriend.specialAnim', true)
	if getProperty('dad.curCharacter') == 'v-rage' then
		playSound('zappershoot', 2);
		characterPlayAnim('dad', 'shoot', true)
		setProperty('dad.specialAnim', true)
		end
	end
end	

local healthDrain = 0;

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet' and difficulty == 2 then
		setProperty('health', -1);
		playSound('hankshoot', 0.6);
	elseif noteType == 'Bullet' and difficulty == 1 then
		healthDrain = healthDrain + 0.6;
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.2 * elapsed;
		setProperty('health', getProperty('health') - 0.2 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end