/* @pjs transparent="true"; */
var from = color(255, 255, 255);
var to = color(197, 201, 41);
//Kakuro
pwidth = pzlayout.substr(0, 2) * 1
pdepth = pzlayout.substr(2, 2) * 1
pz = pzlayout.substr(4, pwidth * pdepth)
pzr = pz.split("")
matrix = listToMatrix(pzr, pdepth);
ddepth = dwidth / pwidth * pdepth
tkline = 3;
tnline = 1;
int numFrames = 15; // The number of frames in the animation
int frame = 1;
void setup() {
    size(dwidth, ddepth);
    background(#EBDAE9, 0)
    fill(0);
    PFont fontA = loadFont("courier Bold");
    textFont(fontA, dwidth / pwidth * .35);
    frameRate(30)
}
void draw() {
    if (!mTrail) {
        background(#EBDAE9, 0)
    }
    rectMode(CENTER);
    fill(238, 155, 0, 100);
    noStroke();
    ellipse(mpos2, mpos1, 50, 50)
}

void mousePressed() {
    //nothing here
}

