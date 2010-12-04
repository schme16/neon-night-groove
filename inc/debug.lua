gameDebug = {active = true}

function gameDebug:run()
	if gameDebug.active then
		advPrint(tostring(debugVal), 20,20,{255,255,255})
	end
end

function gameDebug.toggle()
	gameDebug.active = not gameDebug.active
end	