class Button{
  String name;
  float x, y, Width, Height, w, h;
  PImage cat1; 
  PImage cat2;
  int cat;
  
  
  
  
  Button(String n, float X, float Y, int typeofcat, float W, float H){
    Width = W;
    Height = H;
    cat = typeofcat;
    name = n;
    x = X; //Initial Position again 
    y = Y; // Initial Position Y
    w = (2*width)/3; // The whole width of the button
    h = height/4; // The whole height of the button
   // println("WH",w,h);
    if(cat == 1){
    cat1 = loadImage("cat1.jpg");
    }
    if(cat ==2){
      cat2 = loadImage("cat2.jpeg"); 
    }
  }
  
  void display(){
    pushStyle();
    fill(200,20,20); 
    popStyle();
    strokeWeight(20);
    stroke(209,168,236);
    rect(x, y, w/2.2,w/2.2); // The size of the rectangular part
    
    
   
    if (cat == 1){
    //println("Hello");
    image(cat1,x,y,w/2.2,w/2.2); // Image
    rect(x,y+(w/2.2),w/2.2,h/8.8);
    
    pushStyle();
    stroke(255);
    textSize(15);
    fill(255);
    text("Steven",x+(w/5.5),y+10+(w/2.2));
    popStyle();
    //println(x,y,w,h);
    }
    if (cat == 2){
    image(cat2,x,y,w/2.2,w/2.2); // Image
    rect(x,y+(w/2.2),w/2.2,h/8.8);
    pushStyle();
    stroke(255);
    textSize(15);
    fill(255);
    text("Stevanie",x+(w/5.5),y+10+(w/2.2));
    stroke(255);
    popStyle();
    }

  }
  
   int clickit(int state){
       println(x,y);
     if (mouseX>x&& mouseX< x+w/2.2 && mouseY>y && mouseY< y+w/2.2){
       println("Hello I am on the button");
       pushStyle();
       fill(255,255,255,75);
       strokeWeight(1);
       stroke(131,252,11);
       rect(x, y, w/2.2,w/2.2);
       if (mousePressed && cat == 1){
       state = 4;
     }
     else if(mousePressed && cat == 2){
       state = 5; 
     }
     
     }
     return state;
   }
}
