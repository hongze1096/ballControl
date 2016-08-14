import controlP5.*;
  ControlP5 cp5;
    int s1; //slider1
    int speed; //slider2
    int myColorBackground = color(0, 0, 0);
    int knobValue = 100;
     Knob myKnob;
    int sliderTicks1 = 100;
     Slider abc;
    float x;
    float y;
    float a;
    int dragX, dragY, moveX, moveY;
    boolean drawT = false;
    int frame = 0;

void setup() {
  size(1280, 768); 
  noStroke(); 
  
    cp5 = new ControlP5(this);
      cp5.addSlider("s1")
         .setPosition(40, 60)
         .setSize(200, 20)
         .setRange(100, 400)
         .setValue(250)
         .setLabel("size");
     
      cp5.addSlider("speed")
         .setPosition(40, 90)
         .setSize(200, 20)
         .setRange(10, 60)
         .setValue(250)
         .setColorCaptionLabel(color(255));
         
      cp5.addBang("bang")
         .setPosition(300, 60)
         .setSize(50, 50)
         .setTriggerEvent(Bang.RELEASE)
         .setLabel("changeBackground");
     
      myKnob = cp5.addKnob("knob")
                  .setRange(0,255)
                  .setValue(50)
                  .setPosition(400,20)
                  .setRadius(50)
                  .setDragDirection(Knob.HORIZONTAL);
      
      cp5.addSlider("sliderTicks1")
     .setPosition(40,120)
     .setSize(20,100)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     .setLabel("ball size");
     ;
      
}

void draw() { 
background(myColorBackground);
frameRate(speed);
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
  ellipse(x, y, sliderTicks1, sliderTicks1); //follow mouse
 
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
 
 ellipse(100, 100, s1, s1);//corner ellipse
 ellipse(100, 668, s1, s1);
 ellipse(1180, 100, s1, s1);
 ellipse(1180, 668, s1, s1);

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
  
  switch(key) {
    case('1'):myKnob.setValue(180);break;
    
    case('3'):myKnob.shuffle();;break;
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

//change background color
public void bang() {
  int theColor = (int)random(255);
  myColorBackground = color(theColor);
  println("### bang(). a bang event. setting background to "+theColor);
}

//change background color from black to white
void knob(int theValue) {
  myColorBackground = color(theValue);
  println("a knob event. setting background to "+theValue);

}




  