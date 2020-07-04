//  ——————————————————————————————————————————————
//  bliem level = 002;
//  Author: Benedikt Schläppi | www.onebus.ch insta @hajedbliem
//  LastMod: 04.07.2020 
//  Purpouse: Play around and get in touch with PImage
//  ——————————————————————————————————————————————

PImage img, img1;
int x, y;
int mx, my;
PVector location;
PVector velocity;
float radi = 100;
float radi_inc = 1.2;

void setup() {
  size(600, 600);
  //smooth();
  img = loadImage("unnamed.gif");
  //img = loadImage("brissago.jpg");
  img.resize(600, 600);
  // pixelDensity(2);
  // frameRate(30);
  location = new PVector(random(radi, width-radi), random(radi, height-radi) );
  velocity = new PVector(10, 6);

  background(img);
} 


void draw() {

  location.add(velocity);

  if ((location.x + (radi/2) > width ) || (location.x - (radi/2) < 0 )) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y + (radi/2) > height) || (location.y - (radi/2) < 0 )) {
    velocity.y = velocity.y * -1;
  }

  /* 
   // 000 Get the color linie by line
   loadPixels();
   for (int y = 0; y < img.pixels.length; y++){
   for (int x = 0; x < img.pixels.length; x++){
   int loc = x + y * width;    
   color c = img.pixels[loc];
   fill(c);
   }
   updatePixels(); 
   
   // 001 color with the get function
   if (x < 599) {
   x+= 599/100;
   } else { 
   if (y < img.height-1) {
   y += 599/100;
   }    
   x = 1;
   }
   color c = img.get(x, y);
   //sample circle;
   stroke(255, 0, 0);
   strokeWeight(2);
   ellipse(x, y, 5, 5);
   */

  // 003 Get the Color with the mouse
  mx = mouseX;
  my = mouseY;
  color c = img.get(mx, my);

  fill(c);
  noStroke();
  ellipseMode(CENTER);
  ellipse(location.x, location.y, radi, radi);
  /*
  if (keyPressed) {
   
   }
   */
}

void keyPressed() {
  if (keyCode == UP) {
    radi += radi_inc;
  }
  if (keyCode == DOWN) {
    radi -= radi_inc;
  }
  if (key == 's') {
    saveFrame("img/new_###.png");
  }
  if (key == 'n') {
    PImage newimg = img.get(width/2, 0, width/2, 600);
    image(newimg, 0, 0);
  }
  if (key == 'e') {
    background(img);
  }
  if (key == 't') {
    // location.x = mx +random(-radi,radi);
    // location.y = my +random(-radi,radi);
    location.x = mx;
    location.y = my;
  }
}
