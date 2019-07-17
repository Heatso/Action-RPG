-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- o1.x,o1.y are the top-left coords of the first box, while o1.w,o1.h are its width and height;
-- o2.x,o2.y,o2.w & o2.h are the same, but for the second box.
function CheckCollision(o1, o2)
    return o1.x < o2.x + o2.w and
    o2.x < o1.x + o1.w and
    o1.y < o2.y + o2.h and
    o2.y < o1.y + o1.h
  end