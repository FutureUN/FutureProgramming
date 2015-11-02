
// Object declaration
Sequence sequence;
int n = 10;
color value = 0;
void setup() {
  size(700,700 );
  colorMode(HSB,360,100,100,100);
  // Object init
  sequence = new Leyland();
}

void mouseMoved() {
  value = (value + 1) % 360;
}

void draw() {
 // noLoop();
  background(0);
  sequence.setHue(value);
  //println ( sequence.huehue );
   sequence.lineChart(n);
  sequence.curveFitting(n);
  sequence.barChart(n);
  //sequence.display(n);
}