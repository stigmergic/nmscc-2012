color trunkColor = color(255,255,0);    
color backgroundColor = color(0);    


// setup sets up initial conditions for the app every processing app has this method
void setup() {
  size(1280,824);
  
}


// gets called over and over to animate the app every processing app has this method
void draw() {
  background(backgroundColor);
  
  stroke(trunkColor);
  line(width/2,height/2,mouseX,mouseY);
}

