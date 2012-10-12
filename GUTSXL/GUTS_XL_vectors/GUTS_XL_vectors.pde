
float dx,dy,l;

void setup() {
 size(500,500);
 
}

void draw() {
  background(0);
  stroke(255,255,0);
  line(width/2, height/2, mouseX, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
  
  dx = (mouseX-width/2);
  dy = (mouseY-height/2);
  l = sqrt(sq(dx) + sq(dy));
  
  if (l>0) {
    dx = dx / l;
    dy = dy / l;
  
    stroke(255,0,0);
    line(mouseX, mouseY, 
              mouseX-dx*l/3, mouseY-dy*l/3);
    
    line(mouseX-dx*l/3 + dy*l/3, mouseY-dy*l/3 - dx*l/3,
          mouseX-dx*l/3 - dy*l/3, mouseY-dy*l/3 + dx*l/3);
    
  }
}
