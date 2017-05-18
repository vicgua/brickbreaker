import ddf.minim.*;
import java.util.*;
// DEBUG permet pausar la partida prement 'p'.
// Mentre estigui pausada, mostrarà la posició del ratolí i de la pilota
final boolean DEBUG = false;

Pala pala; //objecte raqueta

Brick[][] bricks;
float dx, dy;
int filas, columnas;
Minim minim;
AudioPlayer brickSound, wallSound, palaSound, failSound, gameOverSound;

PFont courierNew;
float xPelota, yPelota, rPelota;
float vxPelota, vyPelota;
color cPelota;
boolean actPelota;
Pelota ball;
List<GhostPelota> ghostBalls;
Score marcador;
Vidas vidas;
boolean looping = true;
float xBrick, yBrick;
float wBrick, hBrick;

Button gameOverButton = null;
Button splashButton = null;

void setup() {
  size(1000, 600);
  init();
  splash();
}

void spawnLadrillos() {
  bricks = new Brick[filas][];
  for (int i = 0; i < filas; i++) {
    bricks[i] = new Brick[columnas];
    for (int j = 0; j < columnas; j++) {
      float x = xBrick + j * (wBrick + dx);
      float y = yBrick + i * (hBrick + dy);
      bricks[i][j] = new Brick(x, y, wBrick, hBrick);
    }
  }
}

void init() {
  float palax, palay; //posició
  float palav; //velocitat;
  float palaw, palah; //mida

  courierNew = loadFont("CourierNewPSMT-48.vlw");
  minim = new Minim(this);
  brickSound = minim.loadFile("brick.wav");
  wallSound = minim.loadFile("wall.wav");
  palaSound = minim.loadFile("pala.wav");
  failSound = minim.loadFile("fail.wav");
  gameOverSound = minim.loadFile("game_over.wav");

  palaw = 100;
  palah = 20;
  palax = (width - palaw)/2;
  palay = height-30-palah;
  palav = 0;
  pala = new Pala(palax, palay, palaw, palah, palav);

  //imgBrick = loadImage("brick.png");
  wBrick = 50;
  hBrick = 20;
  dx = dy = 2;
  filas = 8;
  columnas = (int)((width*.9) / (wBrick + dx));
  xBrick = (width - columnas * (wBrick + dx)) / 2;
  yBrick = 50;
  spawnLadrillos();

  rPelota = 7.5;
  cPelota = color(18, 209, 255);
  xPelota = pala.x + pala.w / 2;
  yPelota = pala.y - rPelota;
  ball = new Pelota(xPelota, yPelota, rPelota, cPelota, -3, false);
  marcador = new Score();
  vidas = new Vidas();
  ghostBalls = new ArrayList<GhostPelota>();
  print(filas * columnas, filas * columnas / 20);
}

void draw() {
  if (!looping) return;
  background(255);
  //control de la pala

  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      Brick brick = bricks[i][j];
      brick.show();
      brick.collided(ball);
    }
  }

  int gbNum = marcador.score / (filas * columnas / 20);
  
  color ghostColor = color(red(cPelota), green(cPelota), blue(cPelota), .6 * 255);
  while (ghostBalls.size() < gbNum) {
    ghostBalls.add(new GhostPelota(xPelota, yPelota, rPelota, ghostColor, -3));
  }
  pala.move();
  pala.show();
  ball.move();
  ball.show();
  
  for (GhostPelota gb : ghostBalls) {
    gb.move();
    gb.show();
  }
  
  marcador.show();
  vidas.show();  

  pala.collided(ball);  
  

  boolean foundAlive = false;

  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      Brick brick = bricks[i][j];
      if (brick.alive) { 
        foundAlive = true; 
        break;
      }
    }
    if (foundAlive) {
      break;
    }
  }
  if (!foundAlive) spawnLadrillos();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      pala.vx = 10;
    } else if (keyCode == LEFT) {
      pala.vx = -10;
    }
  } else if (key == 'p' && DEBUG) {
    if (looping) {
      looping = false;
    } else {
      looping = true;
    }
  }
}

void keyReleased() {
  pala.vx = 0;
  if (keyCode == ' ' && !ball.act) {
    ball.start();
  }
}

void gameOver() {
  looping = false;
  Text gameOverTxt = new Text("GAME OVER", #000000, courierNew, 60, CENTER, CENTER);
  gameOverTxt.show(width / 2, height / 2);
  gameOverButton = new GameOverButton();
  gameOverButton.show();
  gameOverSound.play(1);
}

void splash() {
  looping = false;
  gameOverButton = null; 
  background(#FFFFFF);
  Text splashTxt = new Text("Brick Breaker", #000000, courierNew, 80, CENTER, CENTER);
  splashTxt.show(width / 2, height / 2);
  splashButton = new SplashButton();
  splashButton.show();
}

void play() {
  init();
  looping = true;
  splashButton = null;
}

void mouseMoved() {
  if (!looping && gameOverButton == null && splashButton == null)
    println(mouseX, mouseY, ball.x, ball.y);
  else if (!looping && gameOverButton != null) {
    if (gameOverButton.inside(mouseX, mouseY)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  } else if (!looping && splashButton != null) {
    if (splashButton.inside(mouseX, mouseY)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  } else {
    cursor(ARROW);
  }
}

void mouseClicked() {
  if (!looping && gameOverButton != null && gameOverButton.inside(mouseX, mouseY)) {
    gameOverButton.onClick();
  } else if (!looping && splashButton != null && splashButton.inside(mouseX, mouseY)) {
    splashButton.onClick();
  }
}