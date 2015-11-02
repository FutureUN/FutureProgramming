
// Object declaration
Sequence sequence;
int n = 12;
void setup() {
  size(720, 640);
  colorMode(HSB,360,100,100,100);
  // Object init
  sequence = new Composite();
  //println(sequence.);
}

void draw() {
  noLoop();
  background(0);
  //object use
  //sequence.display(n);
  sequence.lineChart(n);
}