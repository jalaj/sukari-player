var from = color(255, 255, 255);
var to = color(197, 201, 41);
PFont fontA = loadFont("Calibri");
void setup() {
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
    gridtxt = "           21 11 11  11 11 111  111   11   111 11  111 111   11   11    111  11    111  11    11  11";
    gridtxt = "                                                                                                    ";
	if(typeof(localStorage.getItem(curpzl))!="string") {
    mtxt = listToMatrix(gridtxt.split(""), pdepth);
	htxt = listToMatrix(gridtxt.split(""), pdepth+1);
	vtxt = listToMatrix(gridtxt.split(""), pdepth+1);
	} else {
		if (pztype!="loop") {
			mtxt = JSON.parse(localStorage.getItem(curpzl));
		} else {
		
			htxt = JSON.parse(localStorage.getItem(curpzl)).htxt;
			vtxt = JSON.parse(localStorage.getItem(curpzl)).vtxt;
		}
	}
    PFont fontA = loadFont("courier Bold");
    size(dwidth, ddepth);
    background(#EBDAE9, 0)
    fill(0);
    
	
    frameRate(15)
}
void draw() {
    background(#EBDAE9, 0)
    x = (dwidth - 4) / pwidth;
    y = (ddepth - 4) / pdepth;
    ttr = 0
    switch (pztype) {
        case "sudoku":
			textFont(fontA, dwidth / pwidth * .65);
            skgrid();
            break;
        case "killer":
			textFont(fontA, dwidth / pwidth * .65);
            skgrid();
            break;
        case "kakuro":
			textFont(fontA, dwidth / pwidth * .65);
            skgrid();
            break;
        case "hitori":
			textFont(fontA, dwidth / pwidth * .5);
            hitgrid();
            break;
        case "loop":
			textFont(fontA, dwidth / pwidth * .25);
            loopgrid();
    }
}
void skgrid() {
	for (cctr1 = 0; cctr1 < pdepth; cctr1++) {
		for (cctr2 = 0; cctr2 < pwidth; cctr2++) {
			if (mtxt[cctr1][cctr2].length > 1) {
				fill(#FF0000)
				textFont(fontA, dwidth / pwidth * .3);
				if (pztype=="sudoku") {
					textAlign(LEFT, TOP);
					text(mtxt[cctr1][cctr2].trim(), cctr2 * x + x * .1, cctr1 * x + x * .1);
				} else {
					textAlign(RIGHT, BOTTOM);
					text(mtxt[cctr1][cctr2].trim(), cctr2 * x + x * .95, cctr1 * x + x * .95);
				}
			} else {
				textAlign(CENTER, CENTER);
				fill(#225500)
		textFont(fontA, dwidth/pwidth*.65);
		text(mtxt[cctr1][cctr2].trim(),cctr2*x+x/2,cctr1*x+x/2);
		}
   }
   //console.log("jalaj");
   //console.log(mtxt);
}

 }
 
 void hitgrid() {
     for (cctr1 = 0; cctr1 < pdepth; cctr1++) {
		for (cctr2 = 0; cctr2 < pwidth; cctr2++) {
			textAlign(CENTER, CENTER);
			rectMode(CENTER);
			fill(0, 200);
			switch (mtxt[cctr1][cctr2]) {
				case "2": {
					strokeWeight(3);
					noFill();
					ellipse(cctr2 * x + x / 2, cctr1 * x + x / 2, x * .6, x * .6);
					break;
				}
				case "1": {
					//noStroke();
					rect((cctr2 + .5) * x + 1, (cctr1 + .5) * y + 1, x, y);
					fill(#ffffff, 200);
					text(matrix[cctr1][cctr2], cctr2 * x + x / 2, cctr1 * x + x / 2);
					break;
				}
			}
		}
	}
}

void mousePressed() {
    //nothing here
}

void loopgrid() {
	fill(#ff0000);
	x = (dwidth - 30) / pwidth;
	y = (ddepth - 30) / pdepth;
    for (cctr1 = 0; cctr1 <= pdepth; cctr1++) {
        for (cctr2 = 0; cctr2 <= pwidth; cctr2++) {

			strokeWeight(4);
			if(cctr2!=pwidth && htxt[cctr1][cctr2]==2) line(cctr2*x+16,cctr1*x+16,(cctr2+1)*x+16,0+cctr1*x+16);
			if(cctr1!=pdepth && vtxt[cctr1][cctr2]==2) line(cctr2*x+16,cctr1*x+16,(cctr2+0)*x+16,0+(cctr1+1)*x+16);
			textAlign(CENTER,CENTER);
			if(cctr2!=pwidth && htxt[cctr1][cctr2]==1) text("x",cctr2*x+x*.7,cctr1*x+x*.2);
			if(cctr1!=pdepth && vtxt[cctr1][cctr2]==1) text("x",cctr2*x+x*.2,cctr1*x+x*.7);
			
       }
    }

}