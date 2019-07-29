public class Ball {
  public int radius, x, y, acceleration;
  public float c1, c2, c3;
  public boolean moving = true;
  public boolean colorSet = false;
  public String col = "";

  public Ball(int x, int y, int diameter, int acceleration) {
    this.x = x;
    this.y = y;
    this.radius = diameter/2;
    this.acceleration = acceleration;
    c1 = 255; 
    c2 = 255; 
    c3 = 255;
  }

  public void animate() {
    if (moving) {
      y += acceleration;
    }
    if (y >= 800 - radius) {
      moving = false;
      if (!colorSet) {
        int rand = int(random(7));
        switch(rand) {
        case 0: 
          c1 = 255.0; 
          c2 = 0.0; 
          c3 = 0.0;//red
          col = "red";
          break;
        case 1: 
          c1 = 0; 
          c2 = 0; 
          c3 = 255; //blue
          col = "blue";
          break;
        case 2: 
          c1 = 255; 
          c2 = 255; 
          c3 = 0; //yellow
          col = "yellow";
          break;
        case 3: 
          c1 = 128; 
          c2 = 0; 
          c3 = 128; //purple
          col = "purple";
          break;
        case 4: 
          c1 = 0; 
          c2 = 128; 
          c3 = 0; //green
          col = "green";
          break;
        case 5: 
          c1 = 255; 
          c2 = 165; 
          c3 = 0; //orange
          col = "orange";
          break;
        case 6: 
          c1 = 255; 
          c2 = 105; 
          c3 = 180; //pink
          col = "pink";
          break;
        }
        colorSet = true;
      }
    }
  }
}
