class Ball {
  public int x, y, radius, velocity;
  public boolean goingUp, goingRight;
  public boolean c1Inc, c2Inc, c3Inc;
  public int c1, c2, c3;
  public int length;

  public Ball(int x, int y, int radius, int velocity) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.velocity = velocity;
    if ((int)random(2) == 1) {
      goingUp = true;
    } else {
      goingUp = false;
    }
    if ((int)random(2) == 1) {
      goingRight = true;
    } else {
      goingRight = false;
    }
    c1 = (int)random(255);
    c2 = (int)random(255);
    c3 = (int)random(255);
  }

  public void show() {
    length += 1;
    if (length < 1500) {
      ellipse(x, y, radius*2, radius*2);
    } else {
      setup();
    }
  } 

  public void update() {
    if (this.x - radius <= 0) {
      goingRight = true;
    } else if (this.x + radius >= width) {
      goingRight = false;
    } else if (this.y - radius <= 0) {
      goingUp = false;
    } else if (this.y + radius >= height) {
      goingUp = true;
    }

    if (goingUp) {
      this.y-= velocity;
    } else {
      this.y+= velocity;
    }

    if (goingRight) {
      this.x+= velocity;
    } else {
      this.x-= velocity;
    }
  }


  public void changeColor() {
    fill(c1, c2, c3);

    if (c1 >= 255) {
      c1Inc = false;
    } else if (c1 <= 0) {
      c1Inc = true;
    }
    if (c2 >= 255) {
      c2Inc = false;
    } else if (c2 <= 0) {
      c2Inc = true;
    }
    if (c3 >= 255) {
      c3Inc = false;
    } else if (c3 <= 0) {
      c3Inc = true;
    }

    if (c1Inc) {
      c1 += (int)random(5);
    } else {
      c1 -= (int)random(5);
    }

    if (c2Inc) {
      c2 += (int)random(5);
    } else {
      c2 -= (int)random(5);
    }

    if (c3Inc) {
      c3 += (int)random(5);
    } else {
      c3 -= (int)random(5);
    }
  }
}
