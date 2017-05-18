class GhostPelota extends Pelota {
  GhostPelota(float x, float y, float r, color c, float initial_vy) {
    super(x, y, r, c, initial_vy, true);
    vy = initial_vy;
    vx = 0;
    while (vx > -0.5 && vx < 0.5)
      vx = random(-3, 3);
  }

  void move() {
    x += vx;
    y += vy;

    if (y < r) {
      y = r;
      vy *= -1;
    } else if (y > (height - r)) {
      y = height - r;
      vy *= -1;
    }
    if (x < r) {
      x = r;
      vx *= -1;
    } else if (x > (width - r)) {
      x = width - r;
      vx *= -1;
    }
  }
}