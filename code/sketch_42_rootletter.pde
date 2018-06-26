import java.util.*;
Random generator;
ParticleSystem ps;
ParticleSystem ps2;
PImage coolroot;
PImage texture;
//PImage toro;
PImage ground;
int amount=1;
ArrayList<Letter> cool;
ArrayList<Letter> root;
ArrayList<Letter> toro;
ArrayList<Letter> loco;
boolean restart=false;
PVector pground;
void setup() {
  background(255);
  fullScreen(P3D,1);
  setupScreen();
  //setupOpenCV();
  coolroot= loadImage("./coolroot.png");
  texture= loadImage("./texture2.png");
  //toro= loadImage("./toroloco4.png");
  ground= loadImage("./texture.png");
  imageMode(CENTER); smooth();
  generator= new Random();

  
  ps= new ParticleSystem(0, new PVector(width*0.7, height*0.9));
  ps2= new ParticleSystem(0,new PVector(width*0.3,height*0.9));
  
  cool= new ArrayList<Letter>();
  root= new ArrayList<Letter>();
  toro= new ArrayList<Letter>();
  loco= new ArrayList<Letter>();
  restart();
  }
  
void draw(){ //println(a/0.07*0.08);
  //faceLocation();
  //println(ActiveFace.width);
  //if(b){image(coolroot,width/2,height/4); b=false;}
 
  for(Letter l : cool){
  l.grow();}
  if(cool.get(1).redone()){
  for(Letter l : root)
  l.grow();}
  if(root.get(0).redone()){
  for(Letter l: toro)
  {l.grow();}}
  if(toro.get(2).redone()){
  for(Letter l: loco){
  l.grow();}}
  //if(frameCount%2==0){
  //saveFrame("line-######.tiff");}
  //if(frameCount==00){
  //exit();}
}
 
 void restart(){
   for(int i=0;i<4;i++){
    String word = "COOL";
    PVector p=new PVector(width*0.12+(i*width*0.25),height*0.06); //width/6 heigt*0.06
  cool.add(new Letter(p,word.charAt(i),'l'));}
  
  for(int i=0;i<4;i++){
    String word = "ROOT";
    PVector p=new PVector(width*0.12+(i*width*0.25),height*0.3); //width/6 heigt*0.06
  root.add(new Letter(p,word.charAt(i),'l'));}
  
   for(int i=0;i<4;i++){
    String word = "TORO";
    PVector p=new PVector(width*0.12+(i*width*0.25),height*0.56); //width/6 heigt*0.06
  toro.add(new Letter(p,word.charAt(i),'a'));}
  
  for(int i=0;i<4;i++){
    String word = "LOCO";
    PVector p=new PVector(width*0.12+(i*width*0.25),height*0.8); //width/6 heigt*0.06
  loco.add(new Letter(p,word.charAt(i),'a'));}
  
  pground= new PVector(width/2,height*1.5);
 }
 
 