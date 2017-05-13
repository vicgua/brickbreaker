abstract class Button extends Rectangulo {
  Text txt;

  Button(float x, float y, float w, float h, color c, Text txt) {
    super(x, y, w, h);
    this.c = c;
    this.useStroke = true;
    this.s = #000000;
    txt.alignX = CENTER;
    txt.alignY = CENTER;
    this.txt = txt;
  }

  void show() {
    super.show();
    txt.show((x + (x + dx)) / 2, (y + (y + dy)) / 2);
  }

  boolean inside(float x, float y) {
    return (
      (x >= this.x) &&
      (x <= (this.x + dx)) &&
      (y >= this.y) &&
      (y <= (this.y + dy))
      );
  }

  abstract void onClick();
}

class GameOverButton extends Button {
  GameOverButton() {
    super(width / 2 - width / 8, height / 2 + height / 8, width / 4, height / 10, #FF0000, 
      new Text("Play again", #FFFFFF, courierNew, 40, CENTER, CENTER)
    );
  }

  void onClick() {
    splash();
  }
}

class SplashButton extends Button {
  SplashButton() {
    super(width / 2 - width / 8, height / 2 + height / 8, width / 4, height / 10, #00FF00, 
      new Text("PLAY", #000000, courierNew, 40, CENTER, CENTER)
    );
  }
  
  void onClick() {
    play();
  }
}