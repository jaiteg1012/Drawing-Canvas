triangle[][] triGrid; // 2d array to store all the triangles in the grid
int click = 0;  // keeps track if the mouse has been clicked 

// Object that stores the xy coordinates of points a,b and c of the triangle, color and stroke color
class triangle {
  
  float ax; 
  float ay;
  float bx;
  float by;
  float cx;
  float cy;
  int c; 
  int stroke;
  triangle ( float ax, float ay, float bx, float by, float cx, float cy){  
  
  this.ax = ax; 
  this.ay = ay; 
  this.bx = bx; 
  this.by = by; 
  this.cx = cx; 
  this.cy = cy;
  c =#FFFFFF; // default color 
  stroke = #F5F5F5 ; // default stroke

}

}

// computes area of a triangle given the coordinates of points a, b, and c
float area( float ax, float ay, float bx, float by, float cx, float cy){

   return abs((ax*(by-cy) + bx*(cy-ay)+ cx*(ay-by))/2.0);
}


void setup(){
 background(255, 255, 255);
 size(1500, 800);
triGrid = new triangle[66][17];      
 
float x = 0; // keeps track of the x coordinate
float y = 0; // keeps track of the y coordinate 
 
int i = 0; // used to traverse the 2D array
int j = 0; // used to traverse the 2D array

triangle p; 


// infinte loop that is exited when the entire canvas is filled with equilateral triangles 
for (;;) {
  

if ( y >= 800) {
  x = x + (2 * sqrt(((50*50) -(25*25)))) ;
  y = 0; 
  j++;
  i = 0; 
}

if ( x >= 1462) break; 

float ax = x;
float ay = y; 
float cx = x + sqrt(((50*50) -(25*25)));
float cy = y + 25;
float bx = cx + sqrt(((50*50) -(25*25))); 
float by = y;
float d1 = x; 
float d2 = y + 50; 
float e1 = cx + sqrt(((50*50) -(25*25)));
float e2 = y + 50; 
float f1 = cx; 
float f2 = cy + 50; 


p = new triangle (ax,ay,cx,cy,d1,d2); 
triGrid[i][j] = p; 


p = new triangle (cx,cy, e1,e2,f1,f2);
triGrid [++i][j] = p;



p = new triangle(bx,by,cx,cy,e1,e2);  
triGrid [++i][j] = p;


p = new triangle (cx,cy,d1,d2,f1,f2); 
triGrid [++i][j] = p;

if (y == 0) {
float z1 = cx; 
float z2 = cy - 50; 

p = new triangle (cx,cy,ax,ay,z1,z2); 
triGrid[++i][j] = p;

p = new triangle (cx,cy,bx,by,z1,z2); 
triGrid[++i][j] = p;
}

i++;  
y = y + 50; 
}

}



void draw(){
  // draws the triangular grid 
  for (int j = 0; j < 17; j ++){
    for (int i = 0; i < 66; i ++){
      triangle t = triGrid[i][j];
      fill (t.c);
      stroke(t.stroke);
      triangle(t.ax, t.ay, t.bx, t.by, t.cx, t.cy); 
    }
  }
// when mouse is clicked, checks if  mouseX, mouseY are in a triangle and colors that triangle
if (click == 1) {
    for (int i = 0; i < 66; i++){
      int j = (int) (mouseX/(2 * sqrt(((50*50) -(25*25)))));
      triangle p = triGrid[i][j];
      float ax = (float)area(mouseX,mouseY,p.ax,p.ay,p.bx,p.by); 
      float ay = (float)area(mouseX,mouseY,p.ax,p.ay,p.cx,p.cy);
      float a3 = (float)area(mouseX,mouseY,p.bx,p.by,p.cx,p.cy);
      float area = (float)ax + ay + a3; 
    

      if ( abs(area - area(p.ax,p.ay,p.bx,p.by,p.cx,p.cy)) < 0.01) {
        if (p.c == #FFFFFF){
          
          p.c = #E56C07  ; 
          p.stroke = p.c;

        }
        
        else if(p.c == #E56C07) {
           
           p.c = #0A77C2  ; 
           p.stroke = p.c;
         
        }
        else if (p.c == #0A77C2){
          
           p.c = #A90A3F; 
           p.stroke = p.c;
        
        }
        else if (p.c == #A90A3F) {
          
           p.c =  #FFFFFF; 
           p.stroke = #F5F5F5  ; 
          
        }
        triangle(p.ax,p.ay,p.bx,p.by,p.cx,p.cy);
        click = 0; 
       
      }
    }
      
   }
}

// changes var click to one whenever the mouse is clicked 
void mouseClicked(){
   click = 1; 
}
                          
