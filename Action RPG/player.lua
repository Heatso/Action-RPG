-- By Ryan Trozzolo (Heatso)
pl = {
	x = 100, -- player's x coordinate
	y = 100, -- player's y coordinate
	alive = true, -- alive or not
	dbg = true, -- show collision boxes
	spd = {
		top = 8, --max default speed
		real = 0, -- projected speed
		rate = 1 -- rate of increace/decrase of speed.
	},
	-- This speed thingy is so that movement is alot more fluid instead of robotic. kinda like SMB1 where you gradually speed up.
	dir = "s",
	box = {x = 0, y = 0, w = 18},
	img = {
        n = love.graphics.newImage("images/player/playern.png"),
        s = love.graphics.newImage("images/player/players.png"),
        e = love.graphics.newImage("images/player/playere.png"),
        w = love.graphics.newImage("images/player/playerw.png"),
        }
	}
	
function pl.load()
	require ("BoundingBox")
	require ("enemy")
end

function pl.spdup()
if pl.spd.real >= pl.spd.top then
		pl.spd.real = pl.spd.top
else
	pl.spd.real = pl.spd.real + pl.spd.rate
	end
end

function pl.update() --Movement and stuff
	pl.box.x = pl.x + 8
	pl.box.y = pl.y + 8
	
	if CheckCollision(pl.box.x,pl.box.y,pl.box.w,pl.box.w,en.getboxx(),en.getboxy(),en.getboxw(),en.getboxw()) == true then
		if en.getalive() == true then
			pl.alive = false
		end
	end
	if love.keyboard.isDown("w") then
			pl.y = pl.y - pl.spd.real
			pl.spdup()
			pl.dir = "n"
		elseif love.keyboard.isDown("a") then
			pl.x = pl.x - pl.spd.real
			pl.spdup()
			pl.dir = "w"
		elseif love.keyboard.isDown("s") then
			pl.y = pl.y + pl.spd.real
			pl.spdup()
			pl.dir = "s"
		elseif love.keyboard.isDown("d") then
			pl.x = pl.x + pl.spd.real
			pl.spdup()
			pl.dir = "e"
	else
		if not pl.spd.real == 0 then
			pl.spd.real = pl.spd.real - pl.spd.rate
		elseif pl.spd.real >= 0 then
			pl.spd.real = 0
		end
	end
	if pl.x % 2 ~= 0 then
	pl.x = pl.x + 1
	end
	if pl.y % 2 ~= 0 then
		pl.y = pl.y + 1
	end
end

function pl.getX() --for use with setting stuff relative to the player.
	return pl.x
end
function pl.getY()
	return pl.y
end
function pl.getdir()
	return pl.dir
end
function pl.getvis() -- for seeing if alive
	return pl.alive
end

function pl.dbgdraw(x,y)
love.graphics.print("Player Debug",x,y)
love.graphics.print("Player X Coordinate: " .. pl.x, x, y + 16 * 1)
love.graphics.print("Player Y Coordinate: " .. pl.y, x, y + 16 * 2)
love.graphics.print("Player Direction: " .. pl.dir, x, y + 16 * 3)
love.graphics.print("Player State: " .. tostring(pl.alive), x, y+16*4)
love.graphics.print("Player Speed: " .. pl.spd.real, x, y+16*5)
end
-- draws debug stuf


 function pl.draw() --draws the player. determines graphic to load and draws it.
	if pl.dir == "n" then
		love.graphics.draw(pl.img.n, pl.x, pl.y)
	elseif pl.dir == "s" then
		love.graphics.draw(pl.img.s,pl.x, pl.y)
	elseif pl.dir == "e" then
		love.graphics.draw(pl.img.e, pl.x, pl.y)
	elseif pl.dir == "w" then
		love.graphics.draw(pl.img.w, pl.x, pl.y)
	end
	if pl.dbg == true then
		pl.dbgdraw(0,0)
	end
end



