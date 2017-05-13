class Pala extends Rectangulo {
  float vx;

  Pala(float x, float y, float w, float h, float vx) {
    super(x, y, w, h);
    this.c = #D3D3D3;
    this.useStroke = true;
    this.s = #666666;
    this.vx = vx;
  }

  void move() {
    if (x + vx <= width - w && x + vx >= 0)
      x += vx;
  }

  void collided(Pelota ball) {
    // FIXME: {
    if (ball.x < x && (ball.x + ball.r) >= x &&
      (((ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) || //superior
      ((ball.y - ball.r) >= y && (ball.y - ball.r) <= y + h))) { //inferior
      ball.vx *= -1; // esquinas de la izquierda
      ball.vy *= -1;
    } else if (ball.x > x + w &&
      ball.x + ball.r <= x + w &&
      ((ball.y + ball.r >= y && ball.y + ball.r <= y + h) || //superior
      (ball.y - ball.r >= y && ball.y - ball.r <= y + h))) { //inferior
      ball.vx *= -1; // esquinas de la derecha
      ball.vy *= -1;
    } else if (ball.y > y && ball.y <= (y + h) &&
      (ball.x <= x && (ball.x + ball.r) >= x || //izquierda
      ball.x >= (x + w) && (ball.x - ball.r) <= (x + w))) { //derecha
      ball.vx *= -1;
    } else if ((ball.x + ball.r) >= x && (ball.x - ball.r) <= (x + w) &&
      (((ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) || //arriba
      ((ball.y - ball.r) >= y && (ball.y - ball.r) <= (y + h)))) { //abajo
      if (ball.x >= x && ball.x <= (x + w * .4)) {
        ball.vx = map(ball.x, x, x + w * .4, -4, 0);
      } else if (ball.x >= (x + w * .6) && ball.x <= (x + w)) {
        ball.vx = map(ball.x, x + w * .6, x + w, 0, 4);
      }
      // } (FIXME)
    } else return;
    palaSound.play(1);
  }
}