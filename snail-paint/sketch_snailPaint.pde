ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(1200, 800);
  background(255);
  noStroke();
  balls = new ArrayList();
  for (int i = 0; i < 10; i++) {
    addBall(10);
  }
}


void draw() {
  for (Ball ball : balls) {
    ball.show();
    ball.update();
    ball.changeColor();
  }
}

void addBall() {
  balls.add(new Ball((int)random(width), (int)random(height), (int)random(50), (int)random(2, 5)));
}

void addBall(int size) {
  balls.add(new Ball((int)random(width), (int)random(height), size, (int)random(2, 5)));
}

void drawLine() {
  for (Ball ball : balls) {
    for (Ball n : balls) {
      if (ball != n) {
        stroke(random(255), random(255), random(255));
        //stroke(0);
        strokeWeight(1);
        line(ball.x, ball.y, n.x, n.y);
      }
    }
  }
}
