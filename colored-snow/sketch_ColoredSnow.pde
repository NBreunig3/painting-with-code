private ArrayList<Ball> balls;
private int sizes[] = {25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,50};

void setup() {
  size(1200, 800);
  background(0);
  frameRate(60);
  noStroke();
  balls = new ArrayList<Ball>();
}

void draw() {
  background(0);
  if (random(5) > 0) {
    Ball newBall = new Ball(int(random(1200)), int(random(-100, 0)), sizes[int(random(sizes.length))], 10);
    while (overlapping(newBall)) {
      newBall = new Ball(int(random(1200)), int(random(-100, 0)), sizes[int(random(sizes.length))], 10);
    }
    balls.add(newBall);
  }
  

  for (Ball b : balls) {
    for (Ball other : balls) {
      if (other != b) {
        if (overlapping(b, other)) {
          other.moving = false;
          b.moving = false;
          if (b.c1 == 0 && b.c2 == 0 && b.c3 == 0) {
            copyColor(b, other);
          } else {
            copyColor(other, b);
          }
        }
      }
    }
    b.animate();
    fill(b.c1, b.c2, b.c3);
    ellipse((float)b.x, (float)b.y, (float)b.radius*2, (float)b.radius*2);
  }
  cleanup();
  if (done()) {
    cleanForPic();
    delay(2000);
    background(0);
    setup();
  }
}

//b1 color becomes b2 color
void copyColor(Ball b1, Ball b2) {
  b1.c1 = b2.c1;
  b1.c2 = b2.c2;
  b1.c3 = b2.c3;
  b1.colorSet = true;
  b1.col = b2.col;
}  

//remove uncolored balls
void cleanForPic() {
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    if (b.y >= 0 && b.colorSet == false) {
      balls.remove(b);
    }
  }
}

//remove stuck balls
void cleanup() {
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    if (b.y <= 0 && b.moving == false) {
      balls.remove(b);
    }
  }
}

//checks if two circles are touching
boolean overlapping(Ball ball1, Ball ball2) {
  if (dist(ball1.x, ball1.y, ball2.x, ball2.y) <= (ball1.radius + ball2.radius)) {
    return true;
  }
  return false;
}

//checks if one circle is touching any other circle
boolean overlapping(Ball ball) {
  for (Ball b : balls) {
    if (Math.abs(dist(b.x, b.y, ball.x, ball.y)) <= (b.radius + ball.radius)) {
      return true;
    }
  }
  return false;
}

boolean done() {
  if (balls.size() <= 5) {
    return false;
  }

  for (Ball b : balls) {
    if (!b.colorSet && b.y >= -5) {
      return false;
    }
  }
  return true;
}

Ball getTopColor(String col) {
  Ball curTop = balls.get(0); //<>//
  for (Ball cur : balls) {
    if (cur.col.equals(col)) {
      if (cur.y < curTop.y) {
        curTop = cur;
      }
    }
  }
  return curTop;
}
