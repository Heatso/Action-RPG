--  by Ryan Trozzolo (Heatso) 2019
--  comments will be next to or under function / variable!!!
en = {
x = 0, -- x position
y = 0, -- y position
dir = "nw", -- direction (diagonal nsew)
dbg = true, -- debug (shows collision box)
spd = 5, -- speed 
img = love.graphics.newImage("images/enemy/enemy.png"), --image to show
alive = true, -- alive or not
box = {
x = 0,
y = 0,
w = 24
} -- collision box default (updated later)
}

function en.load(x,y)
	en.x = x
	en.y = y
	require("swipe")
	require("BoundingBox")
end

function en.getbox()
return {
x = en.box.x,
y = en.box.y,
w = en.box.w,
h = en.box.w
}
end

function en.update()
	en.box.x = en.x + 8
	en.box.y = en.y + 8

	if CheckCollision(en.getbox(),sw.getbox()) == true then
		if sw.getvis() == true then
			en.alive = false
		end
	end
	
	if en.dir == "ne" then
		en.x = en.x+en.spd
		en.y = en.y-en.spd
	elseif en.dir == "se" then
		en.x = en.x+en.spd
		en.y = en.y+en.spd
	elseif en.dir == "nw" then
		en.x = en.x-en.spd
		en.y = en.y-en.spd
	elseif en.dir == "sw" then
		en.x = en.x-en.spd
		en.y = en.y+en.spd
	end
	en.checkwall()
end
function en.checkwall()
if en.x <= 0 then
		if en.dir == "sw" then
			en.dir = "se"
		end
		if en.dir == "nw" then
			en.dir = "ne"
		end
	end
	if en.x >= love.graphics.getWidth() then
		if en.dir == "se" then
			en.dir = "sw"
		end
		if en.dir == "ne" then
			en.dir = "nw"
		end
	end
	if en.y <= 0 then
		if en.dir == "ne" then
			en.dir = "se"
		end
		if en.dir == "nw" then
			en.dir = "sw"
		end
	end
	if en.y >= love.graphics.getHeight() then
		if en.dir == "se" then
			en.dir = "ne"
		end
		if en.dir == "sw" then
			en.dir = "nw"
		end
	end
end

function en.dead()
	if en.alive == false then
	return true
	end
end




function en.draw()

	if not en.dead() then
		love.graphics.draw(en.img, en.x, en.y)
		if en.dbg == true then
			love.graphics.rectangle("line", en.box.x, en.box.y, en.box.w, en.box.w)
	end
	end
	
	
end