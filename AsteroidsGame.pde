SpaceShip Turd;
Stars[] Poo = new Stars[500];
Astroid [] Chicken = new Astroid [10];
public void setup() 
{
  size (800, 800);
  Turd = new SpaceShip();
  for (int i = 0; i < Poo.length; i++) {Poo [i] = new Stars();}
  for (int i = 0; i < Chicken.length; i++) {Chicken [i] = new Astroid();}
}
public void draw() 
{
  size(800,800);
  background (0);
  Turd.show();
  Turd.move();
  
  if (Turd.braking) 
    {
    Turd.setDirectionX(Turd.getDirectionX()*.8);
    Turd.setDirectionY(Turd.getDirectionY()*.8);
    }
  if (Turd.faster) {Turd.accelerate(0.1);}
  else if (Turd.slower) {Turd.accelerate(-0.1);}
  else {Turd.accelerate(0);}
  
  if (Turd.rTurn) {Turd.rotate(10);}
  else if (Turd.lTurn) {Turd.rotate(-10);}
  else {Turd.rotate (0);}
  if (Turd.hyper) 
  {
    Turd.setDirectionX(0);
    Turd.setDirectionY(0);
    Turd.setX((int)Math.random()*800);
    Turd.setY((int)Math.random()*800);
  }
  for (int i = 0; i < Poo.length; i++) {Poo[i].show();}
  for (int i = 0; i < Chicken.length; i++) {Chicken[i].show();}
}
public void keyPressed () 
{
  if (key == 'w'){Turd.faster = true;}
  if (key == 'd'){Turd.rTurn = true;}
  if (key == 's'){Turd.slower = true;}
  if (key == 'a'){Turd.lTurn = true;}
  if (key == 'q'){Turd.hyper = true;}
  if (key == ' ')
    {
    Turd.braking = true;
    }
}
public void keyReleased ()
{
   if (key == 'w'){Turd.faster = false;}
  if (key == 'd'){Turd.rTurn = false;}
  if (key == 's'){Turd.slower = false;}
  if (key == 'a'){Turd.lTurn = false;}
  if (key == 'q'){Turd.hyper = false;}
  if (key == ' ')
   {
     Turd.braking = false;
   }
}

public class Stars 
{
  private int x, y, color1, color2, color3;
  
  public Stars ()
  {
    x = (int)(Math.random()*800);
    y = (int)(Math.random()*800);
    color1 = 255;
  }
  public void show()
  {
    stroke(color1);
    strokeWeight (2);
    point (x,y);
  }
}
public class Astroid extends Floater
{
  private int size;
  public Astroid ()
  {
    size = (int)(Math.random()*20) + 10;
    myColor = 255;
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    corners  = 4;
    myPointDirection = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    
    int[] xS = {-2,2,2,-2 };   
    for(int i = 0; i < xS.length; i++){
    xS[i]+= myDirectionX;
    }
    xCorners = xS;
    int[] yS = {2,-2,-2,2};
    for(int i = 0; i < yS.length; i++){
    yCorners = yS; }
  }
    public void setX (int x) {myCenterX = x;}
    public int getX() {return (int) myCenterX;} 
    public void setY (int y) {myCenterY = y;}
    public int getY () {return(int) myCenterY;}
    public void setDirectionX (double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY (double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection (int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
}
public class SpaceShip extends Floater 
{   
  private boolean faster, slower, rTurn, lTurn, hyper, braking;
  public SpaceShip (){
    myColor = 255;
    corners = 7;
    myCenterX = 200;
    myCenterY = 200;
    myPointDirection = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    
    faster = false;
    slower = false;
    rTurn = false;
    lTurn = false;
    hyper = false;
    
    int[] xS = { -10, -10, 9, 9, 17, 9, 9};   
    for(int i = 0; i < xS.length; i++){
    xS[i]+= myDirectionX;
    }
    xCorners = xS;
    int[] yS = {4, -4, -4, -6, -0, 6, 4};
    for(int i = 0; i < yS.length; i++){
    yCorners = yS;
  }          
  }
    public void setX (int x) {myCenterX = x;}
    public int getX() {return (int) myCenterX;} 
    public void setY (int y) {myCenterY = y;}
    public int getY () {return(int) myCenterY;}
    public void setDirectionX (double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY (double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection (int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
}
