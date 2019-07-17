timer = {
frames = 0,
seconds = 0,
}
function timer.update() --ticks per frame
	timer.frames = timer.frames + 1
	if timer.frames % 60 == 0 then
		timer.seconds = timer.seconds + 1
	end
end

function timer.getframes()
	return timer.frames
end

function timer.drawframes(x,y) -- get the frames currently elapsed and print em'
	love.graphics.print(tostring(timer.frames), x, y)
end
function timer.drawseconds(x,y)-- get the seconds currently elapsed and print em'
	love.graphics.print(tostring(timer.seconds), x, y)
end



--[[
AAAAHHH big think time
how the fuck am i gonna make a timer?!

flowchart

set timer(10)
count
10 (-1)
9 (-1)
8 (-1)
7 (-1)
6 (-1)
5 (-1)
4 (-1)
3 (-1)
2 (-1)
1 (-1)
0 -- return done

OR it could be done like this?
set timer(10)
1 is 10? >> not 10.
2 is 10? >> not 10.
3 is 10? >> not 10.
4 is 10? >> not 10.
5 is 10? >> not 10.
6 is 10? >> not 10.
7 is 10? >> not 10.
8 is 10? >> not 10.
9 is 10? >> not 10.
10 is 10? >> YES!!!

but i have no idea how to implement these options!
:(

]]
