
---------------------------------------------------------------------------------------------------------
------------------------------------------Player Functions-----------------------------------------------
---------------------------------------------------------------------------------------------------------
player = {
	facing = 'left',
	x = 100,
	y = 100,
	speed = 140,
	world = 1,
	stage = 1,
	score = 21805,
	isPlayer = true,
	maxPosition = love.graphics.getWidth()/2,
}

function player:isColliding(xVal, yVal)
	local temp ={}
	temp.colMap = player.colMap
	temp.image = player.image

	if not xVal then temp.x = player.x else temp.x = xVal  end
	if not yVal then temp.y = player.y else temp.y = yVal end
	
	for i,v in pairs(items) do
		if v.colMap and collision:checkCollision( temp, v ) then return true end
	end
	
	for i,v in pairs(backgrounds) do
		if v.colMap and collision:checkCollision( temp, v ) then return true end
	end
end

function player:update(dt)
	player.sprite():update(dt)
	player:jumping()
	--player:walking() I will need to recode this
end

function player:draw()

end


