
// Super abstract class Sequence
import java.util.Arrays;

abstract class Sequence {
  /**
   * The sequence author
   */
  color hue;
  abstract String author();

  /**
   * The sequence description
   */
  abstract String description();

  /**
   * Computes the nth sequence term
   */
  abstract int compute(int n);

  void setHue( color h )
  {
    hue = h;
    return;
  }
  
  color getHue ()
  {
    return hue;
  }
  /**
   * Returns the first n seq terms as an array.
   */
  int [] toArray(int n) {
    int[] seq = new int[n];
    for (int i=0; i<n; i++)
      seq[i] = compute(i+1);
    return seq;
  }

  /**
   * Returns the first n seq terms as a string.
   * Sequence may then simply be printed as: println(sequence.toString(n))
   */
  String toString(int n) {
    return Arrays.toString(toArray(n));
  }

  // All display functions must scale the canvas properly

  /**
   * Display n seq terms as you wish
   */
  abstract void display(int n);

  /**
   * Display n seq terms as a bar chart: https://en.wikipedia.org/wiki/Bar_chart
   * Warning: Should be implemented here in the super class!
   */
  void barChart(int n) {
      int[] arr = toArray(n);
      int count = 0;
      for(int i=0; i<n;i++)
      {
          float wid = map (arr[i], arr[0],arr[n-1],arr[0],width);
          stroke(hue,100,30);
          fill ( 255);
          rect(0,(height/n)*count,wid,height/n);
          count++;
      }  
  }

  /**
   * Display n seq terms as a line chart: https://en.wikipedia.org/wiki/Line_chart
   * Warning: Should be implemented here in the super class!
   */
  void lineChart(int n) {
    float xpos=0;
    float ypos=height;
    int nth=1;
    int[] seq=  toArray(n);
    //  println(seq);
    for ( int i = 0; i < n; i ++)
    {
      float xpos1=  map (nth, 0, n, 0, width);
      nth ++;
      float ypos1 = map ( seq[i], 0, seq[n-1], height, 0);
      ellipse ( xpos1, ypos1, 6, 6);
      stroke (255);
      if ( i == 0)
        stroke(0);    
      line (xpos, ypos, xpos1, ypos1); 
      xpos=xpos1;
      ypos=ypos1;
      // println(xpos + " " + ypos);*/
    }
    //TODO misssing implementation
  }

  /**
   * Display n seq terms as a curve firring: https://en.wikipedia.org/wiki/Curve_fitting
   * Hint: refer to the section 'Curves' here: https://processing.org/reference/
   * Warning: Should be implemented here in the super class!
   */
  void curveFitting(int n) {
    //TODO misssing implementation
    noFill();
    if ( n < 3 )
      return;
    float xpos=0;
    float ypos=height;
    int nth=1;
    int[] seq=  toArray(n);
    //  println(seq);
    float x = map (nth, 0, n, 0, width);
    float y = map (seq[0], 0, seq[n-1], height , 0);
    float x1 = map (nth + 1, 0, n, 0, width);
    float y1 = map (seq[1], 0, seq[n-1], height , 0);
    float x2 = map (nth + 2, 0, n, 0, width);
    float y2 = map (seq[2], 0, seq[n-1], height , 0);
    stroke ( 255,0,0);
    curve (x,y,x,y,x1,y1,x2,y2); 
    nth ++;
    for ( int i = 1; i < n - 2; i ++)
    {
      x1 =  map (nth, 0, n, 0, width);
      y1 = map (seq[i], 0, seq[n-1], height , 0);
      x2 = map (nth + 1, 0, n, 0, width);
      y2 = map (seq[i + 1], 0, seq[n-1], height , 0);
      float x3 = map (nth + 2, 0, n, 0, width);
      float y3 = map (seq[i + 2], 0, seq[n-1], height , 0);
      nth ++;
      stroke (255,0,0);
      curve ( x,y,x1,y1,x2,y2,x3,y3);
      
      x = x1;
      y = y1;
      // println(xpos + " " + ypos);*/
    }
     x1 = map (nth, 0, n, 0, width);
     y1 = map (seq[n-2], 0, seq[n-1], height , 0);
     x2 = map (nth + 1, 0, n, 0, width);
     y2 = map (seq[n-1], 0, seq[n-1], height , 0);
    stroke ( 255,0,0);
    curve ( x,y,x1,y1,x2,y2,x2,y2);
   }   
   
    
 
}