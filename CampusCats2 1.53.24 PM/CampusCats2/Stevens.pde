
final int h1 = 480, w1 = 640;


class Stevens {
  final int stevenMargin = w1 / 21;
  final int stevenTx = (int)(w1 / 1.8), stevenTy = h1 / 8;
  final int stevenWi = (w1 - stevenMargin) / 2;  // Width of each image
  PImage[] img;
  String name;
  String[] description;
  int stevenY[] = new int[5];
  
  public Stevens(PImage[] ls, String name, String[] description) {
    img = ls;
    this.name = name;
    this.description = description;
  }
  
  public void load_y() {
    stevenY[0] = stevenMargin;
    for(int i = 1; i < stevenY.length; i++) {
      stevenY[i] = (int) (stevenY[i - 1] + img[i - 1].height / (w1 / stevenWi));
    }
  }
  
  public void display() {
    for(int i = 0; i < stevenImgs.length; i++) {
      // w --> 300 
      image(img[i], stevenMargin, stevenY[i], stevenWi, img[i].height / (w1 / stevenWi));
    }
    // Name
    fill(229, 204, 255);
    int rectX = w1 / 2 + stevenMargin;
    int rectY = stevenMargin / 4;
    rect(rectX, rectY, w1 - rectX, h1 - rectY - stevenMargin);
    fill(0);
    textSize(w1 / 12);
    text(name, stevenTx, stevenTy);
    // Information
    int x = w1 / 2 + stevenMargin, y = w1 / 6;
    for(int i = 0; i < description.length; i++) {
      if(i % 2 == 0) {
        textSize(w1 / 32);
        text(description[i], x, y);
      }
      else {
        textSize(w1 / 42);
        text(description[i], x + description[i-1].length() * (w1 / 50), y);
        y += stevenMargin;
      }
    }
  }
  
  public void scroll(MouseEvent e) {
    double scroll = e.getCount();
    //if ((scroll > 0 && y[y.length - 1] > h - (imgs[imgs.length - 1].height / (w / wi)) - margin) || (scroll < 0 && y[0] < margin)) {
    if((scroll < 0 && stevenY[0] < stevenMargin) || (scroll > 0 && stevenY[stevenY.length - 1] > h1 - stevenImgs[stevenImgs.length - 1].height / (w1 / stevenWi) - stevenMargin)) {
      for(int i = 0; i < stevenY.length; i++) {
        stevenY[i] -= 2 * scroll;
      }
    }
  }
    
}

//void setup() {
//  size(640, 480);
//  background(150);
//  stevenImgs[0] = loadImage("steven(0).jpg");
//  for(int i = 1; i < stevenImgs.length; i++) {
//    stevenImgs[i] = loadImage("steven(" + i + ").jpg");
//  }
//  steven.load_y();
//}

//Stevens steven = new Stevens(stevenImgs, "Steven0", stevenText);

//void draw() {
//  background(150);
//  steven.display();
//}
