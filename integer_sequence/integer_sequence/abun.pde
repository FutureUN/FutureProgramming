class Abundant extends Sequence{
  String author()
  {
     return "noname"; 
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
     for (int i = 0 ; i < terms; i ++)
     {
       x += map (abundants[1][i]/2, 0, wth, 0, 1000);
     //  println (x );
       float radious = map(abundants[1][i], 0, wth, 0, 1000);
       ellipse ( x ,radious/2, radious, radious);
       //float y = 2 * radious + map (abundants[i][0]/2, 0, wth, 0, 1000);
       float y = radious + map (abundants[0][i]/2, 0, wth, 0, 1000);
       //ellipse ( x ,y, abundants[i][0]/2, abundants[i][0]/2);
       radious = map(abundants[0][i], 0, wth, 0, 1000);
       ellipse ( x ,y, radious, radious);
       x +=  map (abundants[1][i]/2, 0, wth, 0, 1000);
       //println (x );
     }
  }
}