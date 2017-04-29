// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM
//https://github.com/CodingTrain/Rainbow-Code/tree/master/challenges/CC_01_StarField

String file = "776-852.csv"; // 20s
Table table;
star[] arStar1;
star[] arStar2;
star[] arStar3;
star[] arStar4;

// I create an array named "stars",
// it will be filled with 800 elements made with the Star() class.
//Star[] stars = new Star[800];

// I create a variable "speed", it'll be useful to control the speed of stars.
float speed_valence;
float speed_focus;
float speed_frustration;
float speed_excitement;
int beat;


void setup() {
  frameRate(76*4/20);
  //size(600, 600);
  //fullScreen();
  size(1920, 1080);
  pixelDensity(displayDensity());
  smooth();
  beat = 0;
  
  table = loadTable(file, "header");
  arStar1= new star[table.getRowCount()];
  arStar2= new star[table.getRowCount()];
  arStar3= new star[table.getRowCount()];
  arStar4= new star[table.getRowCount()];
    
    for (int i=0; i< arStar1.length; i++) {
            float speed1= table.getRow(i).getFloat("valence");             
            arStar1[i]= new star(speed1,color(91,154,0));
        }
  
    for (int i=0; i< arStar2.length; i++) {
            float speed2= table.getRow(i).getFloat("focus");             
            arStar2[i]= new star(speed2,color(0,137,235));
        }
        
    for (int i=0; i< arStar3.length; i++) {
            float speed3= table.getRow(i).getFloat("frustration");             
            arStar3[i]= new star(speed3,color(191,8,186));
        }
        
    for (int i=0; i< arStar4.length; i++) {
            float speed4= table.getRow(i).getFloat("excitement");             
            arStar4[i]= new star(speed4,color(255,85,0));
        }
}

void draw() {
 

 
  background(0);
  
  // I shift the entire composition,
  // moving its center from the top left corner to the center of the canvas.
  translate(width/2, height/2);
  // I draw each star, running the "update" method to update its position and
  // the "show" method to show it on the canvas.
  
  for (int i = 0; i < arStar1.length; i++) {
    speed_valence = map(arStar1[i].speed, 0, width, 0, 50);
    arStar1[i].update();
    arStar1[i].show();
  }
  
  for (int i = 0; i < arStar2.length; i++) {
     speed_focus = map(arStar2[i].speed, 0, width, 0, 50);
    arStar2[i].update();
    arStar2[i].show();
  }
  
  for (int i = 0; i < arStar3.length; i++) {
    speed_frustration = map(arStar3[i].speed, 0, width, 0, 50);
    arStar3[i].update();
    arStar3[i].show();
  }
  
  for (int i = 0; i < arStar4.length; i++) {
    speed_excitement = map(arStar4[i].speed, 0, width, 0, 50);
    arStar4[i].update();
    arStar4[i].show();
  }
  
   beat++;
  if ( beat == 76*4 ){
    exit();
  }
  saveFrame("data/screen-1080/####.jpg");
}


void mousePressed(){ exit();}