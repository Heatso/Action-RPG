-- By Ryan Trozzolo (Heatso)
pl2 = {
	x = 50, -- pl2ayer's x coordinate
	y = 50, -- pl2ayer's y coordinate
	alive = true, -- alive or not
	dbg = true, -- show collision boxes
	spd = 4, -- pl2ayer's speed
	dir = "s",
	box = {x = 0, y = 0, w = 18},
	img = {
        n = love.graphics.newImage("images/player/playern.png"),
        s = love.graphics.newImage("images/player/players.png"),
        e = love.graphics.newImage("images/player/playere.png"),
        w = love.graphics.newImage("images/player/playerw.png"),
        }
	}
	
function pl2.load()
	require ("BoundingBox")
	require ("enemy")
end




function pl2.update() --Movement and stuff
	pl2.box.x = pl2.x + 8
	pl2.box.y = pl2.y + 8
	
	if CheckCollision(pl2.box.x,pl2.box.y,pl2.box.w,pl2.box.w,en.getboxx(),en.getboxy(),en.getboxw(),en.getboxw()) == true then
		if en.getalive() == true then
			pl2.alive = false
		end
	end
	
		if love.keyboard.isDown("kp5") then
			pl2.y = pl2.y - pl2.spd
			pl2.dir = "n"
		elseif love.keyboard.isDown("kp1") then
			pl2.x = pl2.x - pl2.spd
			pl2.dir = "w"
		elseif love.keyboard.isDown("kp2") then
			pl2.y = pl2.y + pl2.spd
			pl2.dir = "s"
		elseif love.keyboard.isDown("kp3") then
			pl2.x = pl2.x + pl2.spd
			pl2.dir = "e"
		end
end

function pl2.getX() --for use with setting stuff relative to the pl2aheyr.
	return pl2.x
end
function pl2.getY()
	return pl2.y
end
function pl2.getdir()
	return pl2.dir
end
function pl2.getvis() -- for seeing if alive
	return pl2.alive
end


 function pl2.draw() --draws the pl2ayer. determines graphic to load and draws it.
	if pl2.dir == "n" then
		love.graphics.draw(pl2.img.n, pl2.x, pl2.y)
	elseif pl2.dir == "s" then
		love.graphics.draw(pl2.img.s,pl2.x, pl2.y)
	elseif pl2.dir == "e" then
		love.graphics.draw(pl2.img.e, pl2.x, pl2.y)
	elseif pl2.dir == "w" then
		love.graphics.draw(pl2.img.w, pl2.x, pl2.y)
	end
	if pl2.dbg == true then
		love.graphics.rectangle("line", pl2.box.x, pl2.box.y, pl2.box.w, pl2.box.w)
	end
end



