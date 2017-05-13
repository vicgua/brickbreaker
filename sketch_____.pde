/*
if ((y + r) > pala.y && (y + r) < pala.y + pala.h && vy > 0) {
  if (x >= pala.x + pala.w * .4 && x <= (pala.x + pala.w * .6)) { // OK
    vx = 0;
    vy *= -1;
  } else if (x >= pala.x && x < (pala.x + pala.w * .4)) {
    vy *= -1;
    vx = map(x, pala.x, pala.x + pala.w * .4, -6, 0);
  } else if (x >= (pala.x + pala.w * .6) && x < (pala.x + pala.w)) {
    vy *= -1;
    vx = map(x, pala.x + pala.w * .6, pala.x + pala.w, 0, 6);
  }
}
*/

/*boolean col = (
     ((ball.x + ball.r)>= x) && ((ball.x - ball.r) <= (x + w)) && ((ball.y - ball.r) >= y) && ((ball.y - ball.r) <= (y + h))
     );
     if (col) {
     ball.vy *= -1;
     this.die();
     }*/