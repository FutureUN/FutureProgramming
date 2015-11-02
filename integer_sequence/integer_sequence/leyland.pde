class Leyland extends Sequence{
  IntList enesimo, v;

  int pow(int n, int p) //special pow 
   {
     if(p==0) return 1;
      
     else if ( p % 2 == 1 )
       return n * pow(n,p-1);
     int a = pow ( n , p/2);
     return a * a;
   }
  String author()
  {
    return "noname"; 
  }
  String description()
  {
    return "something";
  }
  
  int py;
  int px;
  int compute( int nu )
  {
    int n = nu;
    if ( n > 13)
      n = 13;
    v=new IntList();
    enesimo= new IntList();
    for(int i=0;i<n;i++)
      for(int j=0;j<=n - i;j++)
        {
            int m = ( pow(i+2,j+2) + pow(j+2,i+2) ); 
            if(! v.hasValue(m) )
              v.append(m);
        }
     println(v);
     v.sort();
   //  println(v);
     for(int i=0;i<nu;i++)
     {
       if ( i < v.size())
        enesimo.append(v.get(i));
       else
         enesimo.append(enesimo.get(i - 1));
   }
      return enesimo.get(nu-1);  
}
  void posy(int p)
  {
      py = p-height/2;
  }
  
  void posx(int p)
  {
      px= p-width/2;
  }
  
  void sethue(color h)
  {
     hue = h; 
  }
  
  
  
  void display(int n)
  {
    posy(mouseY);
    posx(mouseX);
    if ( n > 55 )
      n = 55;
    int lay[] = toArray(n);
    int layr[] = new int[n];
   // println( lay);
    for ( int i = 0 ; i < n ; i ++ )
      layr[n-1-i] = lay[i];
    
     
    for(int i=0;i<n;i++)
    {
      float a = map (layr[i],lay[0],layr[0],lay[0],width);
      float b = map (lay[i],lay[0],layr[0],0,100);
      fill(hue,100,b);

      //noStroke();
      stroke(hue,100,30);
      float x = width/2+px/(a/b);
      float y = height/2+py/(a/b);
      
      if(y>height)
       y=height;
       else if(y<0)
       y=0;
      if(x>width)
        x=width;
        else if(x<0)
        x=0;
      
      ellipse(x,y,a,a);
  }
  
  }
}