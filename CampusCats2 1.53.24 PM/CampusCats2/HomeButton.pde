class HomeButton{
  float x,y,Width, Height;
  String name;
  
  HomeButton(int x,  String name){
    this.x = x;
    this.y = 60;
    this.name = name;
    this. Width = width/10;
    this. Height = 26;
  }
  
 void display(){
   pushStyle();
    noFill();
    noStroke();
    //stroke(0);
    strokeWeight(0);
    rect(x,y,Width,Height);
    fill(255);
    textSize(15);
    text(name,x+2,y+17);
    noFill();
    pushStyle();
  }
  
 int clickit(int state){
   if(mouseX>x && mouseX< x+Width && mouseY>y && mouseY< y+Height){
     println(" I am on the board");
     pushStyle();
     noStroke();
     rect(x,y,Width,Height);
     popStyle();
     if( mousePressed){
       if(name == "About"){
        state = 1;
       }
       else if(name =="Report"){
         state =2;
       }
       else if(name == "Campus Cats Code"){
         state = 3; 
       }
     }
     }
     return state;
 }
 
}
