boolean save = true;

int RESIZE = 2;

ArrayList<Tile> tiles;
ArrayList<Tile> tilesToDraw;


TextBox textBox;

float textBoxW ;
float textBoxH ;
float textBoxX ;
float textBoxY ;


float gridAx ;
float gridAy;
float gridAw;
float gridAh ;


float gridBx;
float gridBy;
float gridBw ;
float gridBh;


float gridCx;
float gridCy ;
float gridCw ;
float gridCh ;


float gridDx;
float gridDy;
float gridDw;
float gridDh;




void settings() {
  int w = 3840 / RESIZE;
  int h = 2160 / RESIZE;
  size(w, h);
}

void setup() {
  surface.setLocation(0, 0);

  tiles  = new ArrayList<Tile>();

  textBoxW = width * .4;
  textBoxH = height *.35;
  textBoxX = width/2 - textBoxW/2;
  textBoxY = height/2 -textBoxH/2;

  initTextBox(textBoxX, textBoxY, textBoxW, textBoxH);

  gridAx = 10;
  gridAy = 10;
  gridAw = width - gridAx*2;
  gridAh = textBoxY - gridAy;

  initGrid(gridAx, gridAy, gridAw, gridAh);

  gridBx = gridAx;
  gridBy = textBoxY;
  gridBw = textBoxX - gridBx;
  gridBh = textBoxH;

  initGrid(gridBx, gridBy, gridBw, gridBh);

  gridCx = textBoxW + textBoxX;
  gridCy = textBoxY;
  gridCw = width - gridAx - gridCx;
  gridCh = textBoxH;

  initGrid(gridCx, gridCy, gridCw, gridCh);

  gridDx = gridAx;
  gridDy = textBoxY + textBoxH;
  gridDw = width - gridAx*2;
  gridDh = height - gridAy - gridDy;

  initGrid(gridDx, gridDy, gridDw, gridDh);


  strokeWeight(1);
  //rectMode(CORNERS);
    background(blue);

    if (save) saveFrame("render/end-######.png");

}

int count = 1;

void draw() {
  background(blue);

  //for ( Tile t : tiles) {
  //  t.draw();
  //}

  for (int i = 0; i< count; i++) {
    Tile t = tiles.get(i);
    t.draw();
    if (t.endDrawing == true && t.readyToShow == true) {
      // t.readyToShow = false;
      if (count < tiles.size()) {
        count++;
      } 
    }
  }

  textBox.draw();
  if (save) saveFrame("render/end-######.png");
}


void initTextBox(float x, float y, float w, float h) {

  textBox= new TextBox(x, y, w, h);
}

void initGrid(float x, float y, float w, float h) {

  tiles.add(new Tile(x, y, w, h, 0));

  for ( int i = 0; i < tiles.size(); i++) {

    Tile t = tiles.get(i);

    if (t.hasChildren() == false) {
      Tile[] c = t.divide();
      if ( c[0] != null) {
        tiles.add(new Tile(c[0].x, c[0].y, c[0].w, c[0].h, c[0].deep));
        tiles.add(new Tile(c[1].x, c[1].y, c[1].w, c[1].h, c[1].deep));
      }
    }
  }
}

void mousePressed() {
  count = 1;
  textBoxW = width * .4;
  textBoxH = height *.35;

  textBoxX = random(10, width - 20 - textBoxW) ;
  textBoxY = random(10, height - 20 - textBoxH) ;
  initTextBox(textBoxX, textBoxY, textBoxW, textBoxH);

  tiles  = new ArrayList<Tile>();
  gridAx = 10;
  gridAy = 10;
  gridAw = width - gridAx*2;
  gridAh = textBoxY - gridAy;

  initGrid(gridAx, gridAy, gridAw, gridAh);

  gridBx = gridAx;
  gridBy = textBoxY;
  gridBw = textBoxX - gridBx;
  gridBh = textBoxH;

  initGrid(gridBx, gridBy, gridBw, gridBh);

  gridCx = textBoxW + textBoxX;
  gridCy = textBoxY;
  gridCw = width - gridAx - gridCx;
  gridCh = textBoxH;

  initGrid(gridCx, gridCy, gridCw, gridCh);

  gridDx = gridAx;
  gridDy = textBoxY + textBoxH;
  gridDw = width - gridAx*2;
  gridDh = height - gridAy - gridDy;

  initGrid(gridDx, gridDy, gridDw, gridDh);
}

void keyPressed() {
  if (key == 'e') {
    exit();
  }
}
