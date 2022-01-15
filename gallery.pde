

PImage floor, tiger, pyramid, ceiling, sandPebbels, leftWall, rightWall, frontWall, backWall, fireWork, mountain, galaxy1, galaxy2, galaxy3, earth, whiteWall
  , blackAndWhite, backDrop, wallStone;
int[] coords = { 0, 0, 0 };
float face= 0;
boolean hit = false;

float rotateBY = 0;
void setup()
{
  size(800, 640, P3D);
  frustum(-1, 1, 1, -1, 2, 100);
  resetMatrix();
  textureMode(NORMAL);
  floor = loadImage("assets/Floor1.jpg");
  tiger = loadImage("assets/Tiger.jpg");
  pyramid = loadImage("assets/Pyramid.jpg");
  ceiling = loadImage("assets/Ceiling.jpg");
  sandPebbels = loadImage("assets/SandPebbels.jpg");
  leftWall = loadImage("assets/LeftWall.jpg");
  rightWall = loadImage("assets/RightWall.jpg");
  frontWall = loadImage("assets/FrontWall.jpg");
  backWall = loadImage("assets/BackWall.jpg");
  fireWork = loadImage("assets/FireWork.jpg");
  mountain = loadImage("assets/Mountain.jpg");
  galaxy1 = loadImage("assets/Galaxy1.jpg");
  galaxy2 = loadImage("assets/Galaxy2.jpg"); 
  galaxy3 = loadImage("assets/Galaxy3.jpg"); 
  earth = loadImage("assets/Earth.jpg");
  whiteWall = loadImage("assets/WhiteWall.jpg");
  blackAndWhite = loadImage("assets/BlackAndWhite.jpg");
  backDrop = loadImage("assets/BackDrop.jpg");
  wallStone = loadImage("assets/WallStone.jpg");
  textureWrap(REPEAT);
  colorMode(RGB, 1.0f);
}
float angle = 0;
boolean objectHit = false;
float faceAngle = 0;
boolean rotates = false;
boolean rotateA = false;
boolean rotateD = false;
void draw()
{
  background(0);
  translate(0, -2, -4);
  rotateY(-face * PI/2);
  //face 0, -0
  //face 1, -1.5707964
  //face 2, -3.1415927
  //face 3, -4.712389
  translate(-coords[0], 0, -coords[2]);
  ambientLight(1, 1, 1);
  directionalLight(0.8, 1, 0.8, 0, 1, 1);
  pointLight(0.5, 0.35, 0.1, 0, 1.5, -4); // Cube
  pointLight(0.5, 0.35, 0.1, 6, 2, -2); // Cube 2
  pointLight(0.5, 0.35, 0.1, -8, 1, -4); // Pyramid
  pointLight(0.5, 0.35, 0.1, 8, 1, 4); // Pyramid 2

  drawFloor(floor); // Floor
  pushMatrix(); // Ceiling
  translate(0, 20);
  drawFloor(ceiling);
  popMatrix();

  pushMatrix(); // Walls (left)
  translate(0, 0);
  drawLeftWalls(leftWall);
  pushMatrix();
  translate(40, 0);
  drawLeftWalls(rightWall); // Right
  popMatrix();
  pushMatrix();
  drawBackWalls(backWall); // Back
  popMatrix();
  pushMatrix();
  translate(0, 0, -40);
  drawBackWalls(frontWall); // Front
  popMatrix();
  popMatrix();

  pushMatrix(); // Cube
  translate(0, 1.5, -4);
  rotateY(angle);
  scale(1, -1);
  drawCube(tiger, fireWork, sandPebbels, mountain);
  popMatrix();

  pushMatrix(); // Cube 2
  translate(6, 2, -2);
  rotateZ(angle);
  rotateY(angle);
  drawCube(galaxy1, galaxy2, galaxy3, earth);
  popMatrix();
  if (face== 0)
  {
    if ((coords[0] == 0 && coords[2] == -4) || (coords[0] == 6 && coords[2] == -2) || (coords[0] == -8 && coords[2] == -4) || (coords[0] == 8 && coords[2] == 4))
    {
      println("HIT");
      objectHit = true;
    } else
      objectHit = false;
  } else if (face== 1)
  {
    if ((coords[0] == 0 && coords[2] == -4) || (coords[0] == 7 && coords[2] == -2) || (coords[0] == -8 && coords[2] == -4) || (coords[0] == 9 && coords[2] == 4))
    {
      println("HIT");
      objectHit = true;
    } else
      objectHit = false;
  } else if (face== 2)
  {
    if ((coords[0] == 0 && coords[2] == -4) || (coords[0] == 6 && coords[2] == -2) || (coords[0] == -8 && coords[2] == -4) || (coords[0] == 8 && coords[2] == 4))
    {
      println("HIT");
      objectHit = true;
    } else
      objectHit = false;
  } else if (face== 3)
  {
    if ((coords[0] == 0 && coords[2] == -4) || (coords[0] == 6 && coords[2] == -2) || (coords[0] == -7 && coords[2] == -4) || (coords[0] == 7 && coords[2] == 4))
    {
      println("HIT");
      objectHit = true;
    } else
      objectHit = false;
  }

  pushMatrix(); // Pyramid
  translate(-8, 1, -4);
  rotateY(angle);
  scale(1, -1);
  drawPyramid(pyramid, pyramid, pyramid, pyramid);
  popMatrix();

  pushMatrix(); // Pyramid 2
  translate(8, 1, 4);
  rotateY(angle);
  scale(1, -1);
  drawPyramid(whiteWall, blackAndWhite, backDrop, wallStone);
  popMatrix();

  angle += 0.01;
}

void drawFloor(PImage tex)
{
  beginShape(QUADS);
  texture(tex);
  vertex(-20, 0, 20, 0, 1);
  vertex(-20, 0, -20, 1, 1);
  vertex(20, 0, -20, 1, 0);
  vertex(20, 0, 20, 0, 0);
  endShape();
}

void drawLeftWalls(PImage tex)
{
  beginShape(QUADS);
  texture(tex);
  vertex(-20, 0, 20, 0, 1);
  vertex(-20, 0, -20, 0, 0);
  vertex(-20, 20, -20, 1, 0);
  vertex(-20, 20, 20, 1, 1);
  endShape();
}

void drawBackWalls(PImage tex)
{
  beginShape(QUADS);
  texture(tex);
  vertex(-20, 0, 20, 0, 1);
  vertex(20, 0, 20, 0, 0);
  vertex(20, 20, 20, 1, 0);
  vertex(-20, 20, 20, 1, 1);
  endShape();
}

void drawPyramid(PImage tex1, PImage tex2, PImage tex3, PImage tex4)
{
  rotateX(PI/2);
  rotateZ(-PI/6);

  beginShape();
  texture(tex1);
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 0, 1);
  vertex(0, 0, 1, 1, 1);
  endShape();

  beginShape();
  texture(tex2);
  vertex(1, -1, -1, 0, 1);
  vertex(1, 1, -1, 1, 1 );
  vertex(0, 0, 1, 1, 0);
  endShape();

  beginShape();
  texture(tex3);
  vertex( 1, 1, -1, 0, 0);
  vertex(-1, 1, -1, 0, 1);
  vertex(0, 0, 1, 1, 1);
  endShape();

  beginShape();
  texture(tex4);
  vertex(-1, 1, -1, 0, 0);
  vertex(-1, -1, -1, 0, 1);
  vertex(0, 0, 1, 1, 1);
  endShape();
}

void drawCube(PImage tex1, PImage tex2, PImage tex3, PImage tex4)
{
  beginShape(QUADS);
  texture(tex1);
  // front face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();

  beginShape();
  texture(tex2);
  // back face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);
  endShape();

  beginShape();
  texture(tex1);
  // bottom face
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();

  beginShape();
  texture(tex1);
  // top face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  endShape();

  beginShape();
  texture(tex3);
  // right face
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);
  endShape();

  beginShape();
  texture(tex4);
  // left face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  endShape();
}

void keyPressed() 
{
  switch(key)
  {
  case 'w':
    if ((face== 0 || face== 2) && !objectHit)
    {
      if ( coords[2] > -17 && coords[2] < 17)
      {
        coords[0] += (face% 2) * (face% 4 == 1 ? -1 : 1); 
        coords[2] += ((face+ 1) % 2) * (face% 4 == 0 ? -1 : 1);
      }
    } else if ((face== 1 || face== 3) && !objectHit)
    {
      if (coords[0] > -17 && coords[0] < 17)
      {
        coords[0] += (face% 2) * (face% 4 == 1 ? -1 : 1); 
        coords[2] += ((face+ 1) % 2) * (face% 4 == 0 ? -1 : 1);
      }
    }
    break;
  case 'a':
    face= (face+ 1) % 4;
    rotateA = true;
    break;
  case 's':
    if ((face== 1 || face== 3) && !objectHit)
    {
      if (coords[0] > -17 && coords[0] < 17)
      {
        coords[0] -= (face% 2) * (face% 4 == 1 ? -1 : 1); 
        coords[2] -= ((face+ 1) % 2) * (face% 4 == 0 ? -1 : 1);
      }
    } else if ((face== 0 || face== 2) && !objectHit)
    {
      if (coords[2] > -17 && coords[2] < 17)
      {
        coords[0] -= (face% 2) * (face% 4 == 1 ? -1 : 1); 
        coords[2] -= ((face+ 1) % 2) * (face% 4 == 0 ? -1 : 1);
      }
    }
    break;
  case 'd':
    face= (face+ 3) % 4;
    rotateD = true;
    break;
  }
}
