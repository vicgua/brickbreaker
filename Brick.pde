class Brick extends Rectangulo {
  PImage img;
  boolean alive;
  Brick(float x, float y, float w, float h, PImage img) {
    super(x, y, w, h);
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
    boolean col = (
      ((ball.x + ball.r)>= x) && ((ball.x - ball.r) <= (x + w)) && ((ball.y - ball.r) >= y) && ((ball.y - ball.r) <= (y + h))
      );
    if (col) {
      ball.vy *= -1;
      this.die();
    }
  }
}