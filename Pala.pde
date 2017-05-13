class Pala extends Rectangulo {
  float vx;
  boolean lastCollided;

  Pala(float x, float y, float h, float w, float vx) {
    super(x, y, h, w);
    this.c = #D3D3D3;
    this.useStroke = true;
    this.s = #666666;
    this.vx = vx;
    this.lastCollided = false;
  }

  void move() {
    if (x + vx <= width - w && x + vx >= 0)
      x += vx;
  }

  void collided(Pelota ball) {
    boolean col = (
      ((ball.x + ball.r)>= x) &&
      ((ball.x - ball.r) <= (x + w)) &&
      ((ball.y + ball.r) >= y) &&
      ((ball.y - ball.r) <= (y + h))
      );
    if (col && !lastCollided) {
      if (ball.x >= x + w * .4 && ball.x <= (x + w * .6)) {
        ball.vx = 0;
        ball.vy *= -1;
      } else if (ball.x >= x && ball.x < (x + w * .4)) {
        ball.vy *= -1;
        ball.vx = map(ball.x, x, x + w * .4, -4, 0);
      } else if (ball.x >= (x + w * .6) && ball.x < (x + w)) {
        ball.vy *= -1;
        ball.vx = map(ball.x, x + w * .6, x + w, 0, 4);
      }
      lastCollided = true;
    } else if (!col) {
      lastCollided = false;
    }
  }
}