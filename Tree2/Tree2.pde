float firstSegmentLength;
int numLevels = 8;
color trunkColor = color(255,255,0);


void setup() {
  size(1280,1024);
  firstSegmentLength = height/4;
}

void draw() {
  background(0);
  
  stroke(trunkColor);
  
  strokeWeight(numLevels + 2);
  line(width/2, height/2, width/2, height/2 + firstSegmentLength);
  
  noFill();
  ellipse(width/2, height/2, firstSegmentLength*2, firstSegmentLength*2);

  firstSegment(mouseX, mouseY);
  firstSegment( width/2 - (mouseX - width/2), mouseY); 
}

void firstSegment(float x, float y) {
  stroke(trunkColor);
  strokeWeight(numLevels + 1);
  
  float length = sqrt(sq(x - width/2) + sq(y - height/2));
  float angle = atan2(y - height/2, x - width/2);  

  float changeInLength = length / firstSegmentLength;

  line(width/2,height/2, x, y);
  

  stroke(255);
  drawSegments(x, y, angle, length, angle + PI/2, 
                    changeInLength, numLevels);
  
}

void drawSegments(float x, float y, float angle, float length, 
            float changeInAngle, float changeInLength, int level) {
  drawSegment(x,y,angle, length, changeInAngle, changeInLength, level);
  drawSegment(x,y,angle, length, -changeInAngle, changeInLength, level);
} 

void drawSegment(float x, float y, float angle, float length, float changeInAngle, float changeInLength, int level) {
  angle = angle + changeInAngle;
  length = length * changeInLength;

  float nx = x + cos(angle)*length;
  float ny = y + sin(angle)*length;

  strokeWeight(level);
  if (length < width/32) stroke(0,200,0);
  else stroke(255);
  
  line(x,y,nx,ny);

  if (level > 0) drawSegments(nx,ny,angle,length,
        changeInAngle,changeInLength, level - 1);  
  
}


