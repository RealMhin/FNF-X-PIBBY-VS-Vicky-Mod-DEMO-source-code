-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'ded' then
		makeLuaSprite('ded', 'black', -600, -300);
		addLuaSprite('ded', true);
	end
end