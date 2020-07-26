var from = color(255, 255, 255);
var to = color(197, 201, 41);
int numFrames = 15; // The number of frames in the animation
int frame = 1;
void setup() {
    pwidth = pzlayout.substr(0, 2) * 1
    pdepth = pzlayout.substr(2, 2) * 1
    pz = pzlayout.substr(4, pwidth * pdepth)
    pzr = pz.split("")
    matrix = listToMatrix(pzr, pdepth);
    pzt = pzdata.split("")
    textmat = listToMatrix(pzt, pdepth);
    ddepth = dwidth / pwidth * pdepth
    tkline = 3;
    tnline = 1;
    size(dwidth, ddepth);
    background(#EBDAE9, 0)
    fill(0);
    PFont fontA = loadFont("courier Bold");
    textFont(fontA, dwidth / pwidth * .35);
    frameRate(15)
}
void draw() {
    background(#EBDAE9, 0)
    x = (dwidth - 4) / pwidth;
    y = (ddepth - 4) / pdepth;
    ttr = 0
    rectMode(CENTER);
    fill(lerpColor(from, to, frame / numFrames));
    frame = (frame + 1) % numFrames;
    noStroke();
    switch (pztype) {
        case "hitori":
            rect((cpos2 + .5) * x + 1, (cpos1 + .5) * y + 1, x, y);
            break;
        case "kakuro":
            if (cpos1 != pdepth && cpos2 != pwidth && matrix[cpos1][cpos2] == 1) {
                rect((cpos2 + .5) * x + 1, (cpos1 + .5) * y + 1, x, y);
            }
            break;
        case "sudoku":
            if (cpos1 < pdepth && cpos2 < pwidth && textmat[cpos1][cpos2] == " ") {
                rect((cpos2 + .5) * x + 1, (cpos1 + .5) * y + 1, x, y);
            } else {
                cpos1 = 100;
                cpos2 = 100;
            }
        case "killer":
            if (cpos1 < pdepth && cpos2 < pwidth) {
                rect((cpos2 + .5) * x + 1, (cpos1 + .5) * y + 1, x, y);
            } else {
                cpos1 = 100;
                cpos2 = 100;
            }
    }
}
void mousePressed() {
    //nothing here
}