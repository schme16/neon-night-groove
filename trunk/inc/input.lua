input = {}
mouse = {last = "", x = 0, y = 0,}

function input:update() 
	for e,a,b,c in love.events.poll() do
		--mouse.last = c
		debugVal = c
		
	end
end