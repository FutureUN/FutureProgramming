class Composite {
IntList arr;
IntList  num_div (int n ){
  arr = new IntList() ;
  for ( int i = 1; i<= n ; i ++)
  {
    if ( n % i == 0)
    arr.append (i);
  }
  return arr;
}
boolean is_comp ( int n ){
  for ( int i = 2; i < n; i ++)
    if ( n % i == 0 )
          return true;
  return false; 
}
int nth ( int n ){
  int cont = 0;
  int num = 1;
  int nth= -1;
  while (true){
    if (cont == n )
      break;
    if ( is_comp (num))
    {
      cont++;
      nth=num;
    } 
    num++;
  }
  return nth;
}
int [] n_array (int n )
{ 
  int arr [] = new int[n];
  for ( int i = 0; i < n ; i ++)
    arr [i]= nth (i+1);
  return arr;
}

void display(int n )
{
  background (0);
  stroke (250);
  float base=0, h=0 ;
  float xpos=0, ypos = 0; 
  IntList arr = num_div (n);
  int s = arr.size();
  float column = arr.get ( (s/2) - 1);
  float row = arr.get ( s / 2 );
  if ( s%2 == 1){
    base = sqrt(width * height /n);
    h = base;
    row = sqrt (n); 
  }
  if ( s % 2 == 0){
    base = (float )width / column;
    h=(float )height / row;
    row = arr.get ( (s/2) - 1);
    column = arr.get ( s / 2 );
   }
  int sq = 1; 
  for ( int i = 0; i < column ; i ++)
  {
    for ( int j = 0; j < row ; j ++)
    {
      fill (0);
      if ( ! is_comp(sq)){ 
         fill (100,50, map ( sq , 0 , n , 0 , 100));
       }
      rect ( xpos, ypos, base, h);
      //println ( xpos + "   " + ypos);
      xpos = xpos + base;
      sq++;
      //println (sq);
    }
        xpos = 0;
        ypos = ypos + h;
  }
 }
}