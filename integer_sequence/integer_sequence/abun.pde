class Abundant extends Sequence{
  String author()
  {
     return "No-Name"; 
  }
  String description()
  {
    return "An abundant number is a number for wich the sum of its proper divisors is grater than the number itself";
  }
  
  int sum_of_div (int n )
  {
     int cont = 0;
     for ( int i = 1 ; i < n ; i ++)
       if ( n % i == 0)
         cont += i;
     return cont;
  }
  int compute ( int n )
  {
     int cont = 0;
     int number = 0;
     while (true)
     {
       number++;
       int divisors = sum_of_div (number);
       if ( divisors > number )
       {
            cont ++;
       }
       if (cont == n)
         break;
     }
     return number;
  }
  int[] sumDivArray ( int n )
  {
    int [] div = new int[n];
    for ( int i = 0 ; i < n ; i ++ )
    {
      div[i] = sum_of_div(compute(i+1));
    }
    return div;
  }
  void display(int n)
  {
     int terms = n;
     int abundants[][] = new int[2][terms];
     abundants[0] = toArray(terms);
     abundants[1] = sumDivArray ( terms);
     float wth = 0;
    
     for (int i = 0 ; i < terms; i ++)
       wth+= abundants[1][i];
     float x=0;
     if ( n < 3 )
       wth *= 3;
     for (int i = 0 ; i < terms; i ++)
     {
       x += map (abundants[1][i]/2, 0, wth, 0, width);
     //  println (x );
       float radious =map(abundants[0][i], 0, wth, 0, width);
       fill ( hue, map ( abundants [0][i], 0, abundants[0][terms-1], 0, 100),100);
       //println ( abundants [0][i] + " 0 "  + abundants[0][terms-1] + " 0 360 MAPEO " +  map ( abundants [0][i], 0,  abundants[0][terms-1], 0, 360));
       ellipse ( x ,radious/2 + mouseY, radious, radious);
       //float y = 2 * radious + map (abundants[i][0]/2, 0, wth, 0, 1000);
       float y = radious + map(abundants[1][i]/2, 0, wth, 0, width) + mouseY;
       //ellipse ( x ,y, abundants[i][0]/2, abundants[i][0]/2);
       radious =  map(abundants[1][i], 0, wth, 0, width);
       fill ( hue + 130, map ( abundants [1][i], 0, abundants[1][terms-1], 0, 100) , 100);
       ellipse ( x ,y, radious, radious);
       x +=  map (abundants[1][i]/2, 0, wth, 0, width);
       //println (x );
     }
  }
}