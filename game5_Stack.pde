int num=80;
float [] x= new float[num];
float[] y= new float[num];
float [] xspeed = new float[num];
float [] yspeed = new float[num];
float [] breadth = new float[num];
float high = 20;
int k=1;
int a=0;
int [] c1= new int[num];
int [] c2= new int[num];
int [] c3= new int[num];
int flag1=1 , flag2 = 1;
int score1 = 0;
int score2 = 0;


void setup() {
  size(600,600,P3D);
  for(int i=0;i<num;i++) {
    y[i]=height - high*(i)-100;
    xspeed[i] = flag1*5;
    yspeed[i] = 0;
    if(flag1>0) x[i] = 0;
    else x[i] = width;
    flag1 =- flag1;
    c1[i]=(int)random(0,255);
    c2[i]=(int)random(0,255);
    c3[i]=(int)random(0,255);
    breadth[i] = 100;
  }
  xspeed[0]=0;
  x[0]=width/2;
  flag1=0;
}

void draw() {
  background(0);
  //translate(width/2, height/2, 0); 
  //rotateX(0.3);
  //box(100, 100, 25);
  //box(x++,80,100);
  if(flag1!=0) {
    for(int i=0;i<=k;i++){
      fill(c1[i],c2[i],c3[i]);
      rect(x[i]+=xspeed[i],y[i]+=yspeed[i],breadth[i],high);
      
    }
    textSize(30);
    text("Score : "+score1, 50,50);
    text(" High Score : "+score2,width-300,50);
  }
  else {
    stroke(255);
    textSize(50);
    fill(0,255,0);
    text("ADM \n Games",width/2-100,200);
    fill(255,0,0);
    rect(width/2 - 200,height/2 + 100, 400, 100);
    textSize(30);
    stroke(0,255,0);
    fill(255,255,0);
    text("START",width/2-50,height/2+150);
  }
}

void mousePressed() {
  if(mouseY<100){ 
    flag1=0; 
    score1=0;
  }
  
  if(flag1!=0 && flag2!=0) {
    if(x[k] < x[k-1]-breadth[k] || x[k] > x[k-1]+breadth[k]) {
      flag2=0;
      yspeed[k] = 10;
      score1=0;
    }
    else {
      float difference;
      if(x[k]>x[k-1] && x[k]+breadth[k] < x[k-1]+breadth[k-1]) {
        breadth[k+1] = breadth[k];
        
      }
      else if(x[k]>x[k-1] && x[k]+breadth[k] > x[k-1]+breadth[k-1]) {
        difference = abs(breadth[k-1]-(x[k]-x[k-1]));
        breadth[k]=difference;
        breadth[k+1]=difference;
      }
      else{
       difference = breadth[k]-abs(x[k-1]-x[k]);
       x[k] = x[k-1];
       breadth[k]=difference;
       breadth[k+1]=difference;
      }
      score1++;
      xspeed[k]=0;
      k++;
      if(score1>score2) score2=score1;
      
    }
    
  }
  if(mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2 + 200 && flag1==0) {
      flag1=1;
  }
  if(flag2==0) {
    if(flag1!=0) flag2=1;
    for(int i=0;i<num;i++) {
        y[i]=height - high*(i)-100;
        xspeed[i] = flag1*5;
        yspeed[i] = 0;
        if(flag1>0) x[i] = 0;
        else x[i] = width;
        flag1 =- flag1;
        c1[i]=(int)random(0,255);
        c2[i]=(int)random(0,255);
        c3[i]=(int)random(0,255);
        breadth[i] = 100;
      }
      xspeed[0]=0;
      x[0]=width/2;
      k=1;
  }
  
  
  
}