class Vector{
PVector start;
PVector end;
PVector dir;
int c1;
boolean done=false;
Vector(PVector start,PVector end2,PVector end3){
this.start=start; end=end2;
dir=end3.sub(start);
dir.div(100);
 }

void grow(PVector lastend){
if(lastend.y==start.y&&lastend.y==start.y||c1!=0){ 
if(c1<101){ c1++;
point(start.x,start.y);
start.add(dir); 
} else{done=true;  c1=0;}}
}


PVector reend(){
if(done){ return(end);}
else{return(new PVector(0,0));}}

PVector restart(){
return(start);}}