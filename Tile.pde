class Tile {
  float x, y, w, h;
  int deep;
  float border;
  color colorFill = white;
  color colorStroke = white;
  boolean directionHorizontal;
  float easing;
  float targetW;
  float drawW;
  float targetH;
  float drawH;
  boolean readyToShow = true;
  boolean endDrawing = false;

  Tile childrenA;
  Tile childrenB;

  Tile(float x, float y, float w, float h, int deep) {

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.deep = deep;
    this.border = random(2, 20);

    this.easing = random(.01, 1);
    targetW = w;
    targetH = h;

    drawW = 0;
    drawH = 0;
  }

  Tile[] divide() {

    Tile[] t = new Tile[2];

    if (deep < 30) { 
      if ( this.w > this.border*2 && this.h > this.border*2) { 
        int nextDeep = deep;
        nextDeep++;
        directionHorizontal = random(1) >= .5;
        if (directionHorizontal) {
          float ranW = random(this.border, this.w - this.border);

          childrenA = new Tile(this.x, this.y, ranW, this.h, nextDeep);
          childrenB = new Tile(this.x + ranW, this.y, this.w - ranW, this.h, nextDeep);
        } else {
          float ranH = random(this.border, this.h - this.border);
          childrenA = new Tile(this.x, this.y, this.w, ranH, nextDeep);
          childrenB = new Tile(this.x, this.y + ranH, this.w, this.h - ranH, nextDeep);
        }
      }
    }
    t[0]=  childrenA;
    t[1]=  childrenB;
    return t;
  }

  void draw() {
    noFill();
    strokeWeight(1);

    stroke(colorStroke);
    if ( directionHorizontal) {
      if ( w - drawW > 1) {
        float dw = targetW - drawW;
        drawW += dw * easing;

        rect(x, y, drawW, h);
      } else {
        endDrawing = true;
        rect(x, y, w, h);
      }
    } else {
      if ( h - drawH > 1) {
        float dh = targetH - drawH;
        drawH += dh * easing;

        rect(x, y, w, drawH);
      } else {
        endDrawing = true;
        rect(x, y, w, h);
      }
    }
  }

  boolean hasChildren() {
    if (childrenA == null) {
      return false;
    } else {
      return true;
    }
  }
}
