class Brick extends Rectangulo {
  PImage img;
  boolean alive;
  Brick(float x, float y, float w, float h, PImage img) {
    super(x, y, h, w);
    this.img = img;
    this.alive = true;
    this.c = #BF8040;
  }

  void show() {
    if (alive) {
      super.show();
    }
  }

  void die() {
    alive = false;
    marcador.addScore();
    brickSound.play(1);
  }

  void collided(Pelota ball) {
    if (!alive) return;
    if (ball.x < x && (ball.x + ball.r) >= x &&
      (((ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) || //superior
      ((ball.y - ball.r) >= y && (ball.y - ball.r) <= y + h))) { //inferior
      ball.vx *= -1; // esquinas de la izquierda
      alive = false;
      marcador.addScore();
    } else if (ball.x > x + w &&
      ball.x + ball.r <= x + w &&
      ((ball.y + ball.r >= y && ball.y + ball.r <= y + h) || //superior
      (ball.y - ball.r >= y && ball.y - ball.r <= y + h))) { //inferior
      ball.vx *= -1; // esquinas de la derecha
      alive = false;
      marcador.addScore();
    } else if (ball.y > y && ball.y <= (y + h) &&
      (ball.x <= x && (ball.x + ball.r) >= x || //izquierda
      ball.x >= (x + w) && (ball.x - ball.r) <= (x + w))) { //derecha
      ball.vx *= -1;
      alive = false;
      marcador.addScore();
    } else if ((ball.x + ball.r) >= x && (ball.x - ball.r) <= (x + w) &&
      (((ball.y + ball.r) >= y && (ball.y + ball.r) <= (y + h)) || //arriba
      ((ball.y - ball.r) >= y && (ball.y - ball.r) <= (y + h)))) { //abajo
      ball.vy *= -1;// arriba y abajo
      alive = false;
      marcador.addScore();
    } else return;
    brickSound.play(1);
  }
}