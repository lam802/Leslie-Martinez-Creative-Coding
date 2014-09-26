
PFont thefont;
lukeMarkov mc;

float x, y;

void setup()
{
  size(800, 600);
  frameRate(9);
  thefont = loadFont("BaronNeueBold-48.vlw");
  textFont(thefont);
  textSize(32);
  textLeading(80);
  textAlign(LEFT);
  x = 20;
  y = 30;

  String chapters[] = loadStrings("Populvoh_cooked.txt");
  mc = new lukeMarkov(chapters);

  background(0);
}


void draw()
{
  // background(15);
  fill(random(100, 255), random(59, 255), random(20, 255));
  mc.tick();
  println(mc.current);
  float tw = textWidth(mc.current+" ");
  if (x+tw>width)
  {
    x = 20;
    y+=36;
  }
  text(mc.current, x, y);
  x+=tw;
  if(y>height)
  {
     x = 20;
     y = 30;
     background(0); 
  }
}

