float x;
float y;
float a;
int dragX, dragY, moveX, moveY;
boolean drawT = false;
int frame = 0;

void setup() {
  size(1280, 768); 
  noStroke();  
   
}

void draw() { 
background(70);

//Cursor icon
   if (mousePressed == true) {
    cursor(HAND); // Draw cursor as hand
  } else {
    cursor(CROSS);
  }
//easing ball
  float easing = 0.01;
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  ellipse(x, y, 66, 66); //follow mouse
 
//Center ellipse
  float mx = mouseX;
  float my = mouseY;
  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  fill(random(255));
  ellipse(640, height/2, ix, iy);
  ellipse(640, height/2, iy, ix);

  
//Mouse buttons
   if (mousePressed == true) {
    if (mouseButton == LEFT) {
      stroke(random(255)); // flashing
    } else if (mouseButton == RIGHT) { 
      stroke(#F6FF12); // yellow
    }
    } else {
    stroke(#FF0303); // red
  }
    strokeWeight(15);
    noFill();
    ellipse(640,380,1000,720);  
 
 ellipse(100, 100, 400, 400);//corner ellipse
 ellipse(100, 668, 400, 400);
 ellipse(1180, 100, 400, 400);
 ellipse(1180, 668, 400, 400);

//Keyboard data
if (keyPressed == true) { // If the key is pressed
     line(0, 0, 1280, 768); // draw a line
     line(1280, 0, 0, 768);
 }
//Coded keys
if (key == CODED) { 
    if (keyCode == UP) {
      a = 200;
    } else if (keyCode == DOWN) {
      a = 568;
    }
  } else {
    a = 384;
  }
    line(0, a, 1280, a);

if (drawT == true) { 
    rect(390, 330, 500, 100);
    rect(590, 80, 100, 600);
  }

//Mouse Event   
   fill(0); 
  ellipse(dragX, dragY, 100, 100); // Black circle
}
   void mouseDragged() { // Move black circle
  dragX = mouseX;
  dragY = mouseY;
   }
//Key events
 
void keyPressed() {
  if ((key == 'T') || (key == 't')) {
    drawT = true;
  }
}

void keyReleased() {
  drawT = false;
}
void cursor(){
if (mousePressed == true) {
    cursor(HAND); // Draw cursor as hand
  } else {
    cursor(CROSS);
  }

}
  