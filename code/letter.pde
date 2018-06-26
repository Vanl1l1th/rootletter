class Letter{
 char type;
 int type2;
 PVector pos;
 PVector start;
 float a= width*0.07;
 float b= height*0.08;
 float y2=-b;
 int counter=20;
 int counter2;
 int counter3;
 float rot=180;
 char art;
 boolean starter=true;
 boolean done=false;
 boolean boo=true;
 ArrayList<Sroot> rootList;
Letter(PVector p, char type,char art){
  this.art=art;
 start= p.get(); this.type=type; pos=new PVector(0,-b);
 rootList= new ArrayList<Sroot>(); if(type=='C'){type2=1;} if(type=='O'){type2=3;} if(type=='R'||type=='T'){type2=1;}
}
void grow(){
  if(starter){addstart(pos.x,pos.y); starter=false;}
  if(rootList.get(0).counter2<-10){float b2=b; if(type=='R'){b2=b/2;}
   pushMatrix(); translate(start.x,start.y+b2); 
   
   if(type=='C'){pos.x=sin(radians(rot))*a; pos.y=cos(radians(rot))*b; rot+=1.6; if(counter3>8&&art=='a'){rot+=2;} }
   if(type=='O'){pos.x=sin(radians(rot))*a*1.2; pos.y=cos(radians(rot))*b; rot+=1.6; }
   
   else if(type=='L'){if(counter3>=7){pos.y=pos.y; pos.x=pos.x+b*0.016;}else{pos.y=pos.y+b*0.019; pos.x=0-a/2;}
   if(counter3==1){pos.y=pos.y-b*0.28;} if(counter3==7){pos.y=pos.y+b*0.016; pos.x=pos.x-b*0.035; } }
   
   else if(type=='T'){pos.y=pos.y+b*0.019; pos.x=pos.x+b*0.03;
     
   }
   
   else if(type=='R'){
    y2=y2+0.02*b;
   if(counter3<14){ pos.x=sin(radians(-rot))*b; pos.y=cos(radians(-rot))*a; }
   else if(boo){boo=false; pos.y=a*0.07; }
   else{ pos.y=pos.y+b*0.002; pos.x=((0.2*((pos.y-(a*0.17969452))*(pos.y-(a*0.17969452))*(pos.y-(a*0.17969452))))-(0.8*((pos.y-(a*0.112309076))*(pos.y-(a*0.112309076))))+(0.4*pos.y));}
   rot+=1.6;
   }
   
   if(counter3<11&&type!='R'){addroot(pos.x,pos.y);}
   else if(counter3<23&&type=='R'){addroot(pos.x,pos.y);}
   else if(type=='O'&&counter3<12){addroot(pos.x,pos.y);}
   else if(type=='O'&&art=='a'&&counter3<13){addroot(pos.x,pos.y);}
   else{done=true;}
  
   popMatrix();}
   rootgrow();
 }
 void addroot(float x, float y){
   counter++; counter2++; float multi=0.5; if(type=='L'){multi=0;}
   
   if(counter3==10&&type=='C'){rootList.add(new Sroot(x*1.5+start.x,y+start.y+b,calcangle(pos.x,pos.y)-radians(190),2,art)); counter3++;}//end c
   if(counter2==10&&type=='C'){rootList.add(new Sroot(-x+start.x,y+start.y+b,(calcangle(-pos.x,pos.y))*1.1,1,art)); counter3++;}// c right 1
   
   if(type=='L'&&counter>14){float a2=0;if (counter3<6){rootList.add(new Sroot(x+start.x,y+start.y+b,0,1,art));counter3++;}
                 else if(counter3<7){rootList.add(new Sroot(x+start.x,y+start.y+b,0.5,0,art)); counter3++;}
                 else if(counter3==10){if(art=='a'){a2=width*0.05;}rootList.add(new Sroot(x+start.x-a2,y+start.y+b,-1.25,2,art)); counter3++;}
                 else{if(art=='a'){a2=width*0.08;}rootList.add(new Sroot(x+start.x+a2,y+start.y+b,-PI*0.4,1,art)); counter3++;}
   counter=0;}
   if(type=='R'){if(counter3<14&&counter>12){rootList.add(new Sroot(x+start.x,y+start.y+(b/2),calcangle(pos.x,pos.y),1,art));
                                             rootList.add(new Sroot(start.x-a,y2+start.y+(b*0.6),0,1,art));counter3+=2; counter=0;}
                             else if(counter>10&&counter3>=14){float mult=0.008984726*a;if(counter3==22){type2=2; mult=0.004492363*a; a=a*0.7;}
                                                 rootList.add(new Sroot(x+a+start.x,(y*0.22461815*a)+start.y+(b*mult),calcangle(pos.x+a,(10*pos.y)+a)-PI/2,type2,art));counter3++; counter=0;}}
                                                
   if(type=='T'&&counter>14){float a2=0; float a3=PI*0.4; if(counter3==10){type2=2;} if(art=='a'){a2=width*0.018; a3=0;}
     rootList.add(new Sroot(start.x,pos.y+start.y+b/2,0,type2,art));counter3++;
                 if(counter3<6){rootList.add(new Sroot(start.x+x+a2,start.y-a*0.2,-a3,1,art));counter3++;
                                rootList.add(new Sroot(start.x-x-a2,start.y-a*0.2,a3,1,art));} counter=0;
   }
                                                 
   if(counter>15&&(type=='O'||type=='C')){ ;counter=0; int a2=11; if(art=='a'){a2=11;}
   if(x<0&&calcangle(pos.x,pos.y)>radians(-40)){rootList.add(new Sroot(x+start.x,y+start.y+b,calcangle(pos.x,pos.y)*multi,1,art)); counter3++;}// c left 1
   else if(x<0){rootList.add(new Sroot(x+start.x,y+start.y+b,calcangle(pos.x,pos.y),type2,art)); counter3++;}// c left 2
   else {rootList.add(new Sroot(x+start.x,y+start.y+b,PI+calcangle(pos.x,pos.y),type2,art)); counter3++;}// c left 3
   if((type=='O')&&counter3<a2){rootList.add(new Sroot(-x+start.x,y+start.y+b,calcangle(-pos.x,pos.y)*0.75,1,art)); counter3++;}
   //add new root with rotation and translate
}
 }
 void addstart(float x,float y){ float a2=0; float b2=0;
   if(type=='L'||type=='R'){a2=a*0.6;}if(art=='a'){b2=height*0.07;}
   rootList.add(new Sroot(start.x-a2,y+(start.y)+b2,0,0,art)); counter3++;
 }
 float calcangle(float x,float y){
   float angle;
 angle=atan(y/x);  return(angle);}
 
 void rootgrow(){
 for(Sroot s : rootList){
 s.drawroot();}}

boolean redone(){
 return(done); 
}
}