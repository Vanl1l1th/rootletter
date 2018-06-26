class Sroot{
  float angle;
  float x;
  float y;
  int col;
  int gen;
  int counter;
  int counter2;
  int colore;
  int op=10;
  LSystem ls;
  Turtle tur;
  Rule[] ruleset=new Rule[1];
  boolean first=true;
  boolean render=true;
  boolean grow=true;
  boolean draw=true;
  char art;
  ArrayList<Vector> vectorList;
 
  Sroot(float x,float y, float a,int i,char art){
    colore=int(random(0,6));  
   angle=a; this.x=x; this.y=y; this.art=art;
   if(art=='l'){strokeWeight(0.4);
   if(i==1){ruleset[0]= new Rule('F',"FF+[--FF+F]-[++FF-F]");}
   if(i==0){ruleset[0]= new Rule('F',"F[-F-F][+F-F]F[+F+F][-F-F]");}//starter
   if(i==2){ruleset[0]= new Rule('F',"F++[-FF+F]--F[FF-F]");}
   if(i==3){ruleset[0]= new Rule('F',"F+[-F+F]F-[+F-F]");}
   ls= new LSystem("F",ruleset);
   if(i==0){tur= new Turtle("F",width*0.009,radians(25),1); gen=3; draw=false;}
   if(i==1){tur= new Turtle("F",width*0.004,radians(20),1); gen=3;}
   if(i==2||i==3){tur= new Turtle("F",width*0.01,radians(21),1); gen=3;}}
   
   if(art=='a'){strokeWeight(0.7);
    if(i==1){ruleset[0]= new Rule('F',"FF+[-FF+F]--[+FF-F]");}
   if(i==0){ruleset[0]= new Rule('F',"F[-F-F]-F[+F+F][-F-F]");}//starter
   if(i==2){ruleset[0]= new Rule('F',"F+[-F+F]--F[F-F]");}
   if(i==3){ruleset[0]= new Rule('F',"F+[-F+F]F--[+F-F]");}
   ls= new LSystem("F",ruleset);
   if(i==0){tur= new Turtle("F",width*0.01,radians(27),1); gen=3;}
   if(i==1){tur= new Turtle("F",width*0.006,radians(30),1); gen=3;}
   if(i==2||i==3){tur= new Turtle("F",width*0.01,radians(30),1); gen=3;}
   }
   vectorList= new ArrayList<Vector>();
  }
  void drawroot(){//println(counter2);
     if(counter<gen){render(); }
     if(counter>=gen&&render){
       pushMatrix(); translate(x,y); rotate(angle); vectorList=tur.render(); popMatrix(); render=false;}
     if(render==false&&grow){  grow();}
  }
  
  void render(){
   ls.generate();
   tur.setToDo(ls.getSentence());
   counter++;
  }
  
  void grow(){ if(colore>3){col=255;if(art=='l'){stroke(0,col,0);}else{stroke(col,0,0);}}else{stroke(0); }
   
   if(draw==false&&counter2>-80){stroke(0,col,0,op); op++;}
   if(draw==false&&counter2>-30){stroke(0,col,0,0);}
   if(first){vectorList.get(0).grow(vectorList.get(0).restart()); if(vectorList.get(0).done){first=false;}} 
   
   for(int i=0;i<vectorList.size();i++){
   PVector reend; reend=vectorList.get(i).reend();
   for(int j=0;j<vectorList.size();j++){
   vectorList.get(j).grow(reend);   }
   if(vectorList.get(i).done){vectorList.remove(i); counter2--;}
 }}

 //boolean redone(){
 //if(counter2<20&&counter>3){println("www"); return(true); }
 //else{return(false);}}
}