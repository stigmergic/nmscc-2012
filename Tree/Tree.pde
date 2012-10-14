float trunkLength;                      //The length of the first segment and the radius of the circle

color trunkColor = color(255,255,0);    
color backgroundColor = color(0);    

float trunkX;
float trunkY;


// setup sets up initial conditions for the app every processing app has this method
void setup() {
  size(1280,824);

  // setup initial trunk values -- note size must be set before height and width have proper values
  trunkLength = height/3;
  trunkX = width/2;
  trunkY = height/2;
  
}


// gets called over and over to animate the app every processing app has this method
void draw() {
  background(backgroundColor);
  
  strokeWeight(6);

  stroke(trunkColor);  
  line(trunkX, trunkY, trunkX, trunkY + trunkLength);
  
  stroke(trunkColor);
  line(trunkX,trunkY,mouseX,mouseY);
}

