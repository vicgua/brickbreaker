class Score extends Text {
  int score;
  
  Score() {
    super("NULL", #000000, courierNew, 20, LEFT, TOP);
    this.reset();
  }
  
  void addScore(int p) {
    score += p;
    message = Integer.toString(score);
  }
  
  void addScore() {
    addScore(1);
  }
  
  void reset() {
    score = 0;
    message = Integer.toString(score);
  }
  
  void show() {
    super.show(10, 10);
  }
}