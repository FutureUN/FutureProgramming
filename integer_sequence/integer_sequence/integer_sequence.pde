
// Object declaration
Sequence sequence;
int n = 3, seq = 1 , rep = 1;
//String[] toppings = {"Cheese", "Pepperoni", "Black Olives"};
String[] nameSeq = { "Composite" , "Abundant" , "Leyland"};
color value = 0;
void setup() {
  size(700,700 );
  colorMode(HSB,360,100,100,100);
  // Object init
  
}

void mouseMoved() {
  value = (value + 1) % 360;
}

void draw() {
 // noLoop();
  background(0);
  
  
  if ( seq == 0 )
    sequence = new Composite();
  else if ( seq == 1)
    sequence = new Abundant();
  else 
    sequence = new Leyland();
  
  sequence.setHue(value);

  
  if ( rep == 1 )
    sequence.lineChart(n);
  if ( rep == 2 )
    sequence.curveFitting(n); 
   if ( rep == 3 )
     sequence.barChart(n);
   if ( rep == 4 )
    sequence.display(n);
    
    textSize(25);
  fill ( 0 ,0 ,100);
  text(nameSeq[seq] + "  n = " + n , 50, 30); 
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      n ++;
     
    } else if (keyCode == DOWN) {
      if ( n >= 4 )
        n --;
    }
    else if ( keyCode == LEFT )
    {
      if ( seq == 0 )
        seq = 2;
      else
        seq = seq - 1 ;
    }
    else if ( keyCode == RIGHT )
    {
      seq = (seq+1) % 3;
    }
    
    clear();
  }
  if ( key == 'l' || key == 'L')
      rep = 1;
   else if ( key == 'c' || key == 'C')
      rep = 2;
   else if ( key == 'b' || key == 'B')
      rep = 3;
   else if ( key == 'd' || key == 'D')
      rep = 4;
}