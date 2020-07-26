/* @pjs preload="puzzled.jpg"; */

	
function dashedLine(x1, y1, x2, y2, l, g) {
    var pc = dist(x1, y1, x2, y2) / 100;
    var pcCount = 1;
    var lPercent = gPercent = 0;
    var currentPos = 0;
    var xx1 = yy1 = xx2 = yy2 = 0;
 
    while (int(pcCount * pc) < l) {
        pcCount++
    }
    lPercent = pcCount;
    pcCount = 1;
    while (int(pcCount * pc) < g) {
        pcCount++
    }
    gPercent = pcCount;
 
    lPercent = lPercent / 100;
    gPercent = gPercent / 100;
    while (currentPos < 1) {
        xx1 = lerp(x1, x2, currentPos);
        yy1 = lerp(y1, y2, currentPos);
        xx2 = lerp(x1, x2, currentPos + lPercent);
        yy2 = lerp(y1, y2, currentPos + lPercent);
        if (x1 > x2) {
            if (xx2 < x2) {
                xx2 = x2;
            }
        }
        if (x1 < x2) {
            if (xx2 > x2) {
                xx2 = x2;
            }
        }
        if (y1 > y2) {
            if (yy2 < y2) {
                yy2 = y2;
            }
        }
        if (y1 < y2) {
            if (yy2 > y2) {
                yy2 = y2;
            }
        }
 
        line(xx1, yy1, xx2, yy2);
        currentPos = currentPos + lPercent + gPercent;
    }
}
 
function dashedRect(x, y, w, h, l, g) {
    dashedLine(x, y, x+w, y, l, g); //Top
    dashedLine(x, y+h, x+w, y+h, l, g); //Bottom
    dashedLine(x, y, x, y+h, l, g); //Left
    dashedLine(x+w, y, x+w, y+h, l, g); //Right
}

void setup() {
	console.log('jalaj');
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
    fill(0);
    switch (pztype) {
        case "hitori":
            BKG = 255;
            PSF = 0.45;
            break;
        case "sudoku":
            BKG = 200;
            PSF = 0.60;
            break;
        case "killer":
            BKG = 200;
            PSF = 0.275;
            break;
        case "kakuro":
            BKG = #EBDAE9;
            PSF = 0.39;
            break;
        case "loop":
            BKG = 250;
            PSF = 0.35;
            fill(0, 0);
            break;
    }
    noLoop();
	if (pztype=="SPL") { background(0,0); PSF=1;}
	else {
    background(BKG, 0);
	}
    PFont fontA = loadFont("courier Bold");
    textFont(fontA, dwidth / pwidth * PSF);
}
void draw() {
    switch (pztype) {
        case "hitori":
            hitdraw();
            break;
        case "sudoku":
            suddraw();
            break;
        case "killer":
            kildraw();
            break;
        case "kakuro":
            kkrdraw();
            break;
        case "loop":
            loopdraw();
            break;
		case "SPL":
			break;
    }
}
void hitdraw() {
    x = (dwidth - 3) / pwidth;
    y = (ddepth - 3) / pdepth;
    ctr1 = 0
    for (ctr1 = 0; ctr1 <= pdepth; ctr1++) {
        for (ctr2 = 0; ctr2 <= pwidth; ctr2++) {
            strokeWeight(3);
            line(ctr2 * x + 1, ctr1 * x, ctr2 * x + 1, (ctr1 + 1) * x);
            textAlign(CENTER, CENTER);
            line(ctr2 * x, ctr1 * x + 1, (ctr2 + 1) * x, ctr1 * x + 1);
            if (ctr2 != pdepth && ctr1 != pwidth) {
                text(matrix[ctr1][ctr2], ctr2 * x + x / 2, ctr1 * x + x / 2);
                console.log(ctr1 + " " + ctr2 + " " + matrix[ctr1][ctr2]);
            }
        }
    }
}
void suddraw() {
	clj=#5ca7ff
	console.log('again')
    x = (dwidth - 3) / pwidth;
    y = (ddepth - 3) / pdepth;
    ctr1 = 0
    for (ctr1 = 0; ctr1 <= pdepth; ctr1++) {
        for (ctr2 = 0; ctr2 <= pwidth; ctr2++) {
			if (typeof(cset)=="undefined") {
				cset = [clj, #ffffff, clj, #ffffff, clj, #ffffff, clj, #ffffff, clj]
			}
            rectMode(CENTER);
            fill(255)
            noStroke();
            if (ctr1 != pdepth && ctr2 != pwidth && matrix[ctr1][ctr2] < 10) {
                fill(cset[matrix[ctr1][ctr2] - 1], 100);
                rect((ctr2 + .5) * x + 1, (ctr1 + .5) * y + 1, x, y);
            }
            stroke(0);
            strokeWeight(1);
            if (ctr2 == 0 || ctr2 == pwidth || ctr1 == pdepth) {
                strokeWeight(3);
            } else {
                if (matrix[ctr1][ctr2] != matrix[ctr1][ctr2 - 1]) {
                    strokeWeight(3);
                }
            }
            line(ctr2 * x + 1, ctr1 * x, ctr2 * x + 1, (ctr1 + 1) * x);
            strokeWeight(1);
            if (ctr1 == 0 || ctr1 == pdepth || ctr2 == pwidth) {
                strokeWeight(3);
            } else {
                if (matrix[ctr1][ctr2] != matrix[ctr1 - 1][ctr2]) {
                    strokeWeight(3);
                }
            }
            textAlign(CENTER, CENTER);
            fill(0);
            line(ctr2 * x, ctr1 * x + 1, (ctr2 + 1) * x, ctr1 * x + 1);
            if (ctr2 != pdepth && ctr1 != pwidth) {
                text(textmat[ctr1][ctr2], ctr2 * x + x / 2, ctr1 * x + x / 2);
            }
        }
    }
}
void kildraw() {
PFont fontA = loadFont("courier Bold");
console.log("killer");
console.log(pzdata.length);
textmat = listToMatrix(pzdata.match(/.{1,2}/g), pdepth);
console.log(textmat);
console.log(matrix);
    x = (dwidth - 3) / pwidth;
    y = (ddepth - 3) / pdepth;
    ctr1 = 0
	if (pwidth==6) {
	rmax=2;cmax=3;
	}  else {
	rmax=3;cmax=3;
	}
    for (ctr1 = 0; ctr1 <= pdepth; ctr1++) {
        for (ctr2 = 0; ctr2 <= pwidth; ctr2++) {
			if (typeof(cset)=="undefined") {
				cset = [#ffffff, #B94F99, #ffffff, #B94F99, #ffffff, #B94F99, #ffffff, #B94F99, #ffffff]
			}
            rectMode(CENTER);
            fill(255)
            noStroke();
			sep=4;
            if (ctr1 != pdepth && ctr2 != pwidth) {
			//console.log(rgnbase);
			//console.log(matrix);
			//console.log(matrix[ctr1][ctr2]+"");
			//console.log(rgnbase.findIndex(gn => gn === matrix[ctr1][ctr2]+""));
                fill(cset[rgnbase.findIndex(gn => gn === matrix[ctr1][ctr2])], 100);
                rect((ctr2 + .5) * x + 1, (ctr1 + .5) * y + 1, x, y);
            }
            stroke(0);
            strokeWeight(1);
            if (ctr2 % cmax == 0) {
                strokeWeight(3);
            } 
            line(ctr2 * x + 1, ctr1 * x, ctr2 * x + 1, (ctr1 + 1) * x);
            strokeWeight(1);
            if (ctr1 % rmax == 0) {
                strokeWeight(3);
            }
            
            fill(0);
            line(ctr2 * x, ctr1 * x + 1, (ctr2 + 1) * x, ctr1 * x + 1);
			strokeWeight(1);
			hpr=0;hpo=0;vpr=0;vpo=0;
			//console.log(matrix[ctr1][ctr2])
			if (ctr1>0 && ctr2<pwidth && ctr1<pdepth && matrix[ctr1][ctr2] == matrix[ctr1-1][ctr2]) hpr=sep*2;
			if (ctr1>=0 && ctr2<pwidth && ctr1<pdepth-1 && matrix[ctr1][ctr2] == matrix[ctr1+1][ctr2]) hpo=sep*2;
			if (ctr2>0 && ctr2<pwidth && ctr1<pdepth && matrix[ctr1][ctr2] == matrix[ctr1][ctr2-1]) vpr=sep*2;
			if (ctr2<pwidth-1 && ctr1<pdepth && matrix[ctr1][ctr2] == matrix[ctr1][ctr2+1]) vpo=sep*2;
			//			&& matrix[ctr1][ctr2] == matrix[ctr1][ctr2]  ) { hpr=sep*2 } //
			if (vpr==0) dashedLine(ctr2 * x + 1+sep, ctr1 * x+sep-hpr, ctr2 * x + 1+sep, (ctr1 + 1) * x-sep+hpo, 5, 3);
			if (vpo==0) dashedLine((ctr2+1) * x + 1-sep, ctr1 * x+sep-hpr, (ctr2+1) * x + 1-sep, (ctr1 + 1) * x-sep+hpo, 5, 3);
			if (hpr==0) dashedLine(ctr2 * x+sep-vpr, ctr1 * x + 1+sep, (ctr2 + 1) * x-sep+vpo, ctr1 * x + 1+sep, 5, 3);
			if (hpo==0) dashedLine(ctr2 * x+sep-vpr, (ctr1+1) * x + 1-sep, (ctr2 + 1) * x-sep+vpo, (ctr1+1) * x + 1-sep, 5, 3);
            if (ctr2 != pdepth && ctr1 != pwidth) {
                if(hpr+vpr+hpo+vpo == 0) {
					textAlign(CENTER, CENTER);
					textFont(fontA, dwidth / pwidth * PSF*2);
					text(textmat[ctr1][ctr2].replace(/^0/,""), ctr2 * x+x*.5 , ctr1 * x+x*.5);
				} else {
					textAlign(TOP, LEFT);
					textFont(fontA, dwidth / pwidth * PSF);
					text(textmat[ctr1][ctr2].replace(/^0/,""), ctr2 * x+x*.15 , ctr1 * x+x*.35);
				}
            }
        }
    }
}
void kkrdraw() {
	clj=#5ca7ff
    //ellipse(mouseX, mouseY, 20, 20)
    x = (dwidth - 4) / pwidth;
    y = (ddepth - 4) / pdepth;
    ctr1 = 0
    ttr = 0
    for (ctr1 = 0; ctr1 <= pdepth; ctr1++) {
        for (ctr2 = 0; ctr2 <= pwidth; ctr2++) {
            rectMode(CENTER);
            fill(255, 255, 255);
            noStroke();
            if (ctr1 != pdepth && ctr2 != pwidth && matrix[ctr1][ctr2] == 1) {
                //   rect((ctr2 + .5) * x + 1, (ctr1 + .5) * y + 1, x, y);
            } else {
                fill(clj, 60);
                rect((ctr2 + .5) * x + 1, (ctr1 + .5) * y + 1, x, y);
            }
            stroke(0);
            strokeWeight(2);
            if (ctr2 == 0 || ctr2 == pwidth || ctr1 == pdepth) {
                strokeWeight(4);
            }
            line(ctr2 * x + 2, ctr1 * x, ctr2 * x + 2, (ctr1 + 1) * x);
            strokeWeight(2);
            if (ctr1 == 0 || ctr1 == pdepth || ctr2 == pwidth) {
                strokeWeight(4);
            }
            line(ctr2 * x, ctr1 * x + 2, (ctr2 + 1) * x, ctr1 * x + 2);
            if (ctr1 < pdepth - 1 && ctr2 < pwidth && matrix[ctr1][ctr2] == 0 && matrix[ctr1 + 1][ctr2] == 1) {
                strokeWeight(1);
                line(ctr2 * x + 2, ctr1 * x, ctr2 * x + x, (ctr1 + 1) * x);
                textAlign(LEFT, BOTTOM);
                fill(0);
                text(pzdata.substr(ttr, 2) * 1, ctr2 * x + x * 0.15, ctr1 * x + x);
                ttr = ttr + 2;
            }
            if (ctr2 < pwidth - 1 && ctr1 < pdepth && matrix[ctr1][ctr2] == 0 && matrix[ctr1][ctr2 + 1] == 1) {
                strokeWeight(1);
                line(ctr2 * x + 2, ctr1 * x, ctr2 * x + x, (ctr1 + 1) * x);
                textAlign(RIGHT, TOP);
                fill(0);
                text(pzdata.substr(ttr, 2) * 1, ctr2 * x + x, ctr1 * x + x * .1);
                ttr = ttr + 2;
            }
        }
    }
}
void loopdraw() {
    x = (dwidth - 30) / pwidth;
    y = (ddepth - 30) / pdepth;
    ctr1 = 0
    for (ctr1 = 0; ctr1 <= pdepth; ctr1++) {
        for (ctr2 = 0; ctr2 <= pwidth; ctr2++) {
            strokeWeight(4);
            line(ctr2 * x + 16, ctr1 * x + 16, ctr2 * x + 16, 0 + ctr1 * x + 16);
            textAlign(CENTER, CENTER);
            fill(0);
            if (ctr2 != pdepth && ctr1 != pwidth) {
                text(matrix[ctr1][ctr2], ctr2 * x + x / 2 + 16, ctr1 * x + x / 2 + 16);
                console.log(ctr1 + " " + ctr2 + " " + matrix[ctr1][ctr2]);
            }
        }
    }
}
void mousePressed() {
    if (pztype == "loop") {
        hpos1 = (mouseY - posY * scl) / scl / (ddepth - 30) * pdepth;
        hpos2 = (mouseX - posX * scl) / scl / (dwidth - 30) * pwidth;
        ahpos1 = hpos1 % 1;
        ahpos2 = hpos2 % 1;
        a1 = tarea(0, 0, 1, 0, ahpos2, ahpos1);
        a2 = tarea(0, 0, 0, 1, ahpos2, ahpos1);
        a3 = tarea(0, 1, 1, 1, ahpos2, ahpos1);
        a4 = tarea(1, 0, 1, 1, ahpos2, ahpos1);
        switch (Math.min(a1, a2, a3, a4)) {
            case a1:
                htxt[parseInt(hpos1)][parseInt(hpos2)] = toggle(htxt[parseInt(hpos1)][parseInt(hpos2)]);
                break;
            case a2:
                vtxt[parseInt(hpos1)][parseInt(hpos2)] = toggle(vtxt[parseInt(hpos1)][parseInt(hpos2)]);
                break;
            case a3:
                htxt[parseInt(hpos1 + .5)][parseInt(hpos2)] = toggle(htxt[parseInt(hpos1 + .5)][parseInt(hpos2)]);
                break;
            case a4:
                vtxt[parseInt(hpos1 + .5)][parseInt(hpos2)] = toggle(vtxt[parseInt(hpos1 + .5)][parseInt(hpos2)]);
        }
		saveloop();
        console.log(parseInt(hpos2) + ";" + parseInt(hpos1) + ";" + htxt.length + ";" + Math.min(a1, a2, a3, a4) + ";" + a1 + ";" + a2 + ";" + a3 + ";" + a4);
    } else {
        var elmnt = document.getElementById("main");
        cpos1 = round((mouseY - elmnt.scrollTop - posY * scl) / scl / (ddepth - 4) * pdepth - 0.5)
        cpos2 = round((mouseX - elmnt.scrollLeft - posX * scl) / scl / (dwidth - 4) * pwidth - 0.5)
        console.log(cpos1 + ";" + cpos2)
    }
}