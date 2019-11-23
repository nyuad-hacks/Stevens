PImage bg;
Button c1, c2;
HomeButton about;
HomeButton report;
HomeButton CampusCatCode; 
int state = 0;
PImage thanks;
PImage back;
PImage cam;
PImage logo;
String[] stevenText = {"Joined:", "September, 2017", "Petting score:", "348", "Last fed:", "14:24 22/11/2018", "Species:", "Cat"};
PImage[] stevenImgs = new PImage[5];
Stevens steven = new Stevens(stevenImgs, "Steven", stevenText);

void setup(){
  size(640,480);
  background(40);
  bg = loadImage("BGimage.jpg");
  c1 = new Button("Steven", 10*(width/100), 2*height/5, 1, width, height); //Initial X and Y objects
  c2 = new Button("Skeven", 61*(width/100), 2*height/5, 2, width, height);
  about = new HomeButton(1, "About");
  report = new HomeButton(66, "Report");
  CampusCatCode = new HomeButton(130,"Cat ID");
  //Aayusha Part
  thanks=loadImage("thanksimage.jpg");
  back=loadImage("backbutton.png");
  cam=loadImage("cameraicon.png");
  logo=loadImage("logo.png");
  stevenImgs[0] = loadImage("steven(0).jpg");
  for(int i = 1; i < stevenImgs.length; i++) {
    stevenImgs[i] = loadImage("steven(" + i + ").jpg");
  }
  steven.load_y();
}

//State = 0 -> main menu -? ALl back buttons go back to menu
//State = 1 => about
//State = 2 -> report 
//State = 3 -> campucats code
//state = 4 Steven1
//State = 5 Steven 2
void draw(){
  if(state == 0){
    main_menu();
  }
  else if(state == 1){
    image(bg,0,0,width,height);
    runAbout();
  }
  else if(state ==2){
    image(bg,0,0,width,height);
    runReport();
  }
  else if(state ==3){
    image(bg,0,0,width,height);
    runCatsCode();
  }
  else if(state == 4) {
    image(bg,0,0,width,height);
    steven.display();
  }
  else if(state==6){
    runThanks();}
}


void runAbout(){
  background(255,255,0);
}

void runCatsCode(){
  background(0);
}
void main_menu(){
  image(bg,0,0,width,height);
  strokeWeight(1);
  fill(209,168,236);
  rect(0,40,width,height/10);
  textSize(30);
  fill(255);
  text("Re-PAWS-itory",width/1.6,75);
  
  fill(209,168,236);
  image(logo,width/1.8,48,height/12,height/12);
  c1.display();
  state = c1.clickit(state);
  c2.display();
  state = c2.clickit(state);
  about.display();
  state = about.clickit(state);
  report.display();
  state = report.clickit(state);
  CampusCatCode.display();
  state = CampusCatCode.clickit(state); 
}


//Aayusha part
void clickSubmit() { // This run inside of runReport
  
  //display thanks image
  if(mouseX>((width/2)-width/12) && mouseX< ((width/2)-width/12 +width/6) && mouseY>(height*(.93)) && mouseY<(height*(.93)+width*(.03))){
    pushStyle();
    stroke(204, 255, 204);
    strokeWeight(5);
    noFill();
    rect((width/2)-width/12, height-30, width/6, 20);
    
    popStyle();
    if(mousePressed){
      state = 6;
    }
  }
}

void runReport(){
  image(bg,0,0,width,height);
  //background(0);
  textSize(32);

  fill(209,168,236);
  rect(0, 30, width, 40);
  fill(0);
  text("Report an issue", width/3, 60);

  fill(255);
  rect(10, 100, 200, 30);
  textSize(20);
  fill(130);
  text("Enter cat name", 20, 120);

  fill(255);
  rect(10, 140, width/1.5, height/2.5);
  textSize(20);
  fill(130);
  text("Description", 20, 160);

  fill(255);
  rect(10, 160+(height/2.5), width/8, width/8);
  textSize(20);
  fill(130);
  image(cam,10, 160+(height/2.5), width/8, width/8);
  //text("Image", 20, 200+(h/2.5));

  fill(255);
  rect((width/2)-width/12, height-30, width/6, 20);
  textSize(15);
  fill(0);
  text("Submit", (width/2)-width/20, height-15);

  //if ((mouseX>width/2) && (mouseX<((width/2)+(width/6))) && (mouseY>height-30) && (mouseY<height-10)) {
  //  //print("ifjsdiofjidosf");
  //  //stroke(204, 255, 204);
  //  //strokeWeight(5);
  //  //noFill();
  //  //rect((w/2)-w/12, h-30, w/6, 20);
  //}
  
  strokeWeight(1);
  stroke(0);
  clickBack();
  clickSubmit();
}
void clickBack(){
 image(back,0,0,width/6,height/6);
 if(mouseX>0 && mouseX<width/6 && mouseY>0 && mouseY<height/6){
    //pushStyle();
    //stroke(204, 255, 204);
    //strokeWeight(5);
    //noFill();
    //rect(width*(.00125),width*(.00125), width/6, height/6); // Hover effect for back button of thanks
    //popStyle();
   if (mousePressed){
  state=0; // goes to main menu 
   }
 }
}

void runThanks(){
  background(0);
  pushStyle();
  image(thanks,0,0,width,height);
  popStyle();
  stroke(255);
  textSize(20);
  fill(255);
  text("Thank you for helping out!",10,height/2);
  //fill(255);
  //rect(width*(.00125),width*(.00125), width/6, height/6); // Button for go back to main menu from menu thanks
  
  clickBack();
}

void mouseWheel(MouseEvent e) {
  if(state == 4) {
    steven.scroll(e);
  }
}
