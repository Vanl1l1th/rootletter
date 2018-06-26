class Turtle   {

  String todo;
  float len;
  float theta;
  int number;
  ArrayList<Vector> vectorList;

  Turtle(String s, float l, float t,int number) {
    todo = s;
    len = l; 
    theta = t;
    vectorList= new ArrayList<Vector>();
    this.number=number;
    
  } 

  ArrayList render() { float x; float y; float x2; float y2;
    //stroke(0,175); 
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F') {
        x=modelX(0,0,0); y=modelY(0,0,0);
        x2=modelX(0,len,0); y2=modelY(0,len,0);
        vectorList.add(new Vector(new PVector(x,y),new PVector(x2,y2),new PVector(x2,y2))); //start position
        //line(0,0,0,len); 
        translate(0,len);
      } 
      else if(c=='G'){
      translate(0,len);}
      else if (c == '+') {
        rotate(theta);
      } 
      else if (c == '-') {
        rotate(-theta);
      } 
      else if (c == '[') {
        pushMatrix();
      } 
      else if (c == ']') {
        popMatrix();
      }} return(vectorList);
  }

  void setLen(float l) {
    len = l; 
  } 

  void changeLen(float percent) {
    len *= percent; 
  }

  void setToDo(String s) {
    todo = s; 
  }

}