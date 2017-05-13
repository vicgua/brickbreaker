class Rectangulo {
  float x, y;
  float h, w;
  color c;
  boolean useStroke;
  color s;

  Rectangulo(float x, float y, float h, float w) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.c = #000000;
    this.useStroke = false;
    this.s = c;
  }

  void show() {
    rectMode(CORNER);
    fill(c);
    if (useStroke) stroke(s);
    else noStroke();
    rect(x, y, w, h);
  }
}