class Pelota {
  float x, y, r;
  float vx, vy;
  float initial_vy;
  color c;
  boolean act;

  Pelota(float x, float y, float r, color c, float initial_vy, boolean act) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.initial_vy = initial_vy;
    this.act = act;
    vx = 0;
    vy = 0;
  }

  void move() {
    if (act) {
      x += vx;
      y += vy;

      if (y < r) {
        y = r;
        vy *= -1;
      } else if (y > (height - r)) {
        act = false;
        vidas.subsVidas();
      } if (x < r) {
        x = r;
        vx *= -1;
        wallSound.play(1);
      } else if (x > (width - r)) {
        x = width - r;
        vx *= -1;
        wallSound.play(1);
      }
    } else {
      x = pala.x + pala.w / 2;
      y =  pala.y - r;
    }
  } 

  void show() {
    fill(c);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
  }
  
  void start() {
    act = true;
    vy = initial_vy;
  }
}