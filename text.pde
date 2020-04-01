class TextBox {
  float x, y, w, h;
  color colorFill;

  boolean directionHorizontal;
  float easing;
  float targetW;
  float drawW;
  float targetH;
  float drawH;
  String theText = "Herno \n\nMilano Fashion Week \nMilan (Italy) - 2020 \n\nart direction and production: Anomalia Studio \ntechnical partner: Stagelight \n\nwww.ultraviolet.to";
  int fontSize = 25;

  PFont font;


  TextBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colorFill = white;

    directionHorizontal = random(1) >= .5;

    this.easing = random(.009, .1);
    targetW = w;
    targetH = h;

    font = createFont("fonts/Stolzl_Display.otf", fontSize);
    textFont(font);
    textLeading(fontSize*1.5);  // Set leading to 10


    drawW = 0;
    drawH = 0;
  }
  void draw() {
    noStroke();
    fill(colorFill);
    if ( directionHorizontal) {
      if ( w - drawW > 1) {
        float dw = targetW - drawW;
        drawW += dw * easing;

        rect(x, y, drawW, h);
        
        displayText(theText, x, y, drawW , h);
      } else {
        rect(x, y, w, h);

         displayText(theText, x, y, w, h);
      }
    } else {
      if ( h - drawH > 1) {
        float dh = targetH - drawH;
        drawH += dh * easing;

        rect(x, y, w, drawH);

        displayText(theText, x, y, w, drawH);
      } else {
        rect(x, y, w, h);
       displayText(theText, x, y, w, h);
      }
    }
  }

  void displayText(String _theText, float _x, float _y, float _w, float _h) {
    fill(blue);
    text(_theText, _x + fontSize, _y + fontSize, _w -fontSize*2, _h -fontSize);
  }
}
