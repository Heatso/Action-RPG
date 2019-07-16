d = {
x = 683,
y = 67,
dir = "ne",
spd = 6,
img = love.graphics.newImage("images/dot.png")
}

function d.update()
	if d.dir == "ne" then
		d.x = d.x+d.spd
		d.y = d.y-d.spd
	elseif d.dir == "se" then
		d.x = d.x+d.spd
		d.y = d.y+d.spd
	elseif d.dir == "nw" then
		d.x = d.x-d.spd
		d.y = d.y-d.spd
	elseif d.dir == "sw" then
		d.x = d.x-d.spd
		d.y = d.y+d.spd
	end
	d.checkwall()
end

function d.draw()
love.graphics.draw(d.img,d.x,d.y) 
end

function d.checkwall()
	if d.x <= 0 then
		if d.dir == "sw" then
			d.dir = "se"
		end
		if d.dir == "nw" then
			d.dir = "ne"
		end
	end
	if d.x >= love.graphics.getWidth() then
		if d.dir == "se" then
			d.dir = "sw"
		end
		if d.dir == "ne" then
			d.dir = "nw"
		end
	end
	if d.y <= 0 then
		if d.dir == "ne" then
			d.dir = "se"
		end
		if d.dir == "nw" then
			d.dir = "sw"
		end
	end
	if d.y >= love.graphics.getHeight() then
		if d.dir == "se" then
			d.dir = "ne"
		end
		if d.dir == "sw" then
			d.dir = "nw"
		end
	end
end
