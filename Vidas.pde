class Vidas extends Text {
  int vidas;

  Vidas() {
    super("NULL", #FF0000, courierNew, 20, RIGHT, TOP);
    this.reset();
  }


  void subsVidas(int v) {
    if (vidas - v <= 0) { 
      gameOver();
    } else if (v == 1) {
      failSound.play(1);
    }
    vidas -= v;
    message = Integer.toString(vidas);
  }

  void subsVidas() {
    subsVidas(1);
  }

  void show() {
    super.show(width - 10, 10);
  }

  void reset() {
    vidas = 3;
    message = Integer.toString(vidas);
  }
}