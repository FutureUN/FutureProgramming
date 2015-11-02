Composite sequence;
int n = 14;
void setup (){
  size ( 500, 500);
  sequence = new Composite();
  noLoop(); 
}

void draw() {
  sequence.display (n);
}