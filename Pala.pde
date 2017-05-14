class Pala extends Rectangulo {
  float vx;
  boolean lastCollided;

  Pala(float x, float y, float w, float h, float vx) {
    super(x, y, w, h);
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
    int col = 0;
    if (ball.x < x && (ball.x + ball.r) >= x &&
      (ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) { //inferior
      col = 1; // esquinas de la izquierda
    } else if (ball.x > (x + w) &&
      ball.x + ball.r <= x + w &&
      (ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) { //inferior
      col = 2; // esquinas de la derecha
    } else if (ball.y > y && ball.y <= (y + h) &&
      ball.x <= x && (ball.x + ball.r) >= x) { // izquierda
      col = 3;
    } else if (ball.y > y && ball.y <= (y + h) &&
      ball.x >= (x + w) && (ball.x - ball.r) <= (x + w)) { // derecha
      col = 4;
    } else if ((ball.x + ball.r) >= x && (ball.x - ball.r) <= (x + w) &&
      (ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) { //arriba
      if (ball.x >= x && ball.x <= (x + w * .4)) {
        col = 5;
      } else if (ball.x >= (x + w * .6) && ball.x <= (x + w)) {
        col = 6;
      } else {
        col = 7;
      }
    }
    if (!ball.act) col = 7;
    if (col != 0 && lastCollided) return;
    switch (col) {
    case 0:
      lastCollided = false;
      return;
    case 1:
    case 2:
      ball.vx *= -1; 
      break;
    case 3:
      ball.vx = min(-4, -ball.vx);
      break;
    case 4: 
      ball.vx = max(4, -ball.vx);
      break;
    case 5:
      ball.vx = map(ball.x, x, x + w * .4, -4, 0);
      ball.vy *= -1;
      break;
    case 6:
      ball.vx = map(ball.x, x + w * .6, x + w, 0, 4);
      ball.vy *= -1;
      break;
    case 7:
      ball.vy *= -1;
      break;
    }
    if (ball.act) palaSound.play(1);
    lastCollided = true;
  }
}