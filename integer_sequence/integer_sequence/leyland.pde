class Leyland extends Sequence{
  IntList enesimo, v;
  void Leyland()
  {  
    int n = 13;
    v=new IntList();
    enesimo= new IntList();
    for(int i=0;i<n;i++)
      for(int j=0;j<=n;j++)
        {
            int m = ( pow(i+2,j+2) + pow(j+2,i+2) ); 
            if(! v.hasValue(m) )
              v.append(m);
        }
     //println(v);
     v.sort();
     println(v);
     for(int i=0;i<n;i++)
        enesimo.append(v.get(i));
  }
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
  
  color hue; 
  int py;
  int px;
  int compute( int n )
  {
    return enesimo.get(n-1);
  }
  void posy(int p)
  {
      py = p-height/2;
  }
  
  void posx(int p)
  {
      px= p-width/2;
  }
  Leyland()
  {
     sethue(180); 
  }
  
  Leyland (int h)
  {
     sethue(h); 
  }
  
  void sethue(color h)
  {
     hue = h; 
  }
  
  
  
  void display(int n)
  {
    int lay[] =toArray(n);
    int layr[] = new int[n];
    for ( int i = 0 ; i < n ; i ++ )
      layr[n-1-i] = lay[i];
    
    for(int i=0;i<n;i++)
    {
      float a = map (layr[i],lay[0],layr[0],0,width+width/4);
      float b = map (lay[i],lay[0],layr[0],0,100);
      fill(hue,100,b);
     
      stroke(hue,100,b);
      float x = width/2+px/(a/b);
      float y = height/2+py/(a/b);

      ellipse(x,y,a,a);
  }
  
  
  }
}