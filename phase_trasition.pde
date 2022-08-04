//center of cicrcle
int x=20;
int y=20;
//diameter
int diameter=20;
//number of circles
int quantity=30;
//probability of getting a circles
float p=0.5;

void setup(){
  size(800,800);
   noLoop();
}

//output a circle inside this box 
void makeBox(int x, int y, int diameter){
  line(x/2,y/2,quantity*diameter+x/2,y/2);
  line(x/2,y/2+quantity*diameter,quantity*diameter+x/2,y/2+quantity*diameter);
  //
  line(x/2,y/2,x/2,quantity*diameter+y/2);
  line(quantity*diameter+x/2,y/2,quantity*diameter+x/2,quantity*diameter+y/2);
}

//output circle coordinates
void makeCircle2(int _coordx[][],int _coordy[][],int diameter,float p,int x,int y){
  int i,j;  
  float _p;
  int k=0;
    for(i=0;i<quantity;i++){
    for(j=0;j<quantity;j++){
      //range 0 to 1
      _p=random(0,1);
      if(_p>p){
       _coordx[i][k]=j*diameter+x;
       _coordy[i][k]=i*diameter+y;
       k++;
      }else{
      _coordx[i][k]=0;
      _coordy[i][k]=0;
      k++;
      }
    }
    k=0;
    println("");
  }
}

//output horizontally connected circle
void makeXLine(int _coordx[][], int _coordy[][],int amount){
  int i,j;
  for(i=0;i<amount;i++){
    for(j=1;j<amount;j++){
      if(_coordx[i][j] - _coordx[i][j-1]==diameter){
        line(_coordx[i][j],_coordy[i][j],_coordx[i][j-1],_coordy[i][j-1]);     
    }
  }
 }
}

//output avertically connected circle
void makeYLine(int _coordx[][], int _coordy[][],int amount){
  int i,j;
  for(i=0;i<amount;i++){
    for(j=1;j<amount;j++){
      if(_coordy[j][i] - _coordy[j-1][i]==diameter){
        line(_coordx[j][i], _coordy[j][i], _coordx[j-1][i], _coordy[j-1][i]);     
    }
  }
 }
}

void draw(){
  int i,j;
  int k=0;
  float _p;
  int [][] coordx=new int [quantity][quantity];
  int [][] coordy=new int [quantity][quantity];
  background(100);
//make a box
  makeBox(x,y,diameter);
//output circle coordinates
  makeCircle2(coordx, coordy, diameter, p,x,y);

//output a circle
for(i=0;i<quantity;i++){
  for(j=0;j<quantity;j++){
    if(coordx[i][j]!=0 && coordy[i][j]!=0){
      ellipse(coordx[i][j],coordy[i][j],diameter,diameter);
    }
  }
}

//output a line
makeXLine(coordx, coordy,quantity);
makeYLine(coordx, coordy,quantity);

}

void mousePressed() {
   redraw();
    }
