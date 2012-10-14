float trunkLength;                      //The length of the first segment and the radius of the circle
int numLevels = 6;                      //Recursive depth to draw the fractal...  Higher numbers require more processing power.  It quickly becomes hard for the computer to draw so many lines!
color trunkColor = color(255,255,0);    
color branchColor = color(150,200,0);  
color leafColor = color(0,255,0);      
color circleColor = color(100);        
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

  strokeWeight(numLevels + 2);  
  noFill();
  stroke(circleColor);
  ellipse(trunkX, trunkY, trunkLength*2, trunkLength*2);

  stroke(trunkColor);  
  line(trunkX, trunkY, trunkX, trunkY + trunkLength);
  

  // first branch connect the end of the trunk to the mouse
  firstBranch(mouseX, mouseY);
  //  the second branch mirrors the first branch along the axis of the trunk
  firstBranch(trunkX - (mouseX - trunkX), mouseY); 
}


void firstBranch(float x, float y) {  
  stroke(trunkColor);
  strokeWeight(numLevels + 1);
  
  // pythagorean theroem the length of the branch is equal to the [Hypotenuse](http://en.wikipedia.org/wiki/Hypotenuse) of
  // the triangle from the end of the trunk with one leg parrallel to the x axis and one leg parallel to the y axis 
  float branchLength = sqrt(sq(x - trunkX) + sq(y - trunkY));

  // [atan2](http://www.processing.org/reference/atan2_.html) 
  // returns the angle of the right triangle above at the tip of the trunk.
  float angle = atan2(y - trunkY, x - trunkX);
  
  //
  float changeInAngle = angle + PI/2;  

  // lengthRation describes the change in length between the parent and child branch.  In this fractal this is a constant ratio.
  float lengthRatio = branchLength / trunkLength;

  line(trunkX,trunkY, x, y);
  
  drawBranches(x, y, angle, branchLength, changeInAngle, lengthRatio, numLevels);
}


void drawBranches(float x, float y, float angle, float length, float changeInAngle, float lengthRatio, int level) {
  drawBranch(x,y,angle, length, changeInAngle, lengthRatio, level);
  drawBranch(x,y,angle, length, -changeInAngle, lengthRatio, level);
} 





void drawBranch(float x, float y, float angle, float branchLength, float changeInAngle, float lengthRatio, int level) {
  //calc new angle and branch length
  angle = angle + changeInAngle;
  branchLength = branchLength * lengthRatio;
  
  //calculate ends of new segment
  float nx = x + cos(angle)*branchLength;
  float ny = y + sin(angle)*branchLength;

  //Stroke width
  strokeWeight(level);
  
  //Stroke color
  if (branchLength < width/32) {
    stroke(leafColor);
  } else {
    stroke(branchColor);
  }
  
  //draw segment
  line(x,y,nx,ny);

  //Recursive call!  
  //All recursive calls should have a stopping condition:
  //Level should be a positive integer.  Stop if it is negative or zero.
  if (level > 0) drawBranches(nx,ny,angle,branchLength,changeInAngle,lengthRatio, level - 1);    
}


