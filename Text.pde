class Text {
  String message;
  color c;
  PFont font;
  int size;
  int alignX, alignY;
  
  Text(String message, color c, PFont font, int size, int alignX, int alignY) {
    this.message = message;
    this.c = c;
    this.font = font;
    this.size = size;
    this.alignX = alignX;
    this.alignY = alignY;
  }
  
  void show(float x, float y) {
      textFont(font);
      textSize(size);
      textAlign(alignX, alignY);
      fill(c);
      text(message, x, y);
  }
}