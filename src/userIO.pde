//////////////////////////////
/// Global interaction object
//////////////////////////////
Node selection; 

//////////////////////////////
////Interaction
//////////////////////////////

//// Mouse interaction

void mousePressed() {
    // Ignore anything greater than this distance
    float closest = 20;


    for (int i = 0; i < nodeCount; i++) {
        Node n = nodes[i];
        float d = dist(mouseX, mouseY, n.x, n.y);
        if (d < closest) {
            selection = n;
            closest = d;
        }
    }
    if (selection != null) {
        if (mouseButton == LEFT) {
            selection.fixed = true;
        } 
        else if (mouseButton == RIGHT) {
            selection.fixed = false;
        }
    }
}


void mouseDragged() {
    if (selection != null) {
        selection.x = mouseX;
        selection.y = mouseY;
    }
}


void mouseReleased() {
    selection = null;
}


//// Keyboard interaction


void keyPressed() {
    render = false;

    if (key == CODED) {

        if (keyCode == UP) {
        }
        else if (keyCode == DOWN) {
            degOffset = 0.0;
            placeNodesOnCircle(degOffset);
        }
        else if (keyCode == LEFT) {
            degOffset += 10.0;
            degOffset %= 360.0;
            placeNodesOnCircle(degOffset);
        }
        else if (keyCode == RIGHT) {
            degOffset -= 10.0;
            degOffset %= 360.0;
            placeNodesOnCircle(degOffset);
        }
    }
    else {

        if (key == 'r') {
            for (int i = 0; i < nodeCount; i++) nodes[i].fixed = false;
        }

        if (key == 'a') {
            fixNodes();
        }

        if (key == 'l') {
            loadfile = true;
        }

        if (key == 'd') {
            clearContent();
        }

        if (key == 'c') {
            //            fixNodes();
            placeNodesOnCircle(degOffset);
        }

        if (key == 'p') {
            placeRandomOnScreen();
        }
        if (key == 's') {

            placeLine();
        }
        if (key == 'k') {
            selectAndLoadCollusion();
        }
        if (key == 'h') {

            placeHeavyNodesOnCircle(heavyOrderNumber, degOffset);
        }
        if (key == 't') {
            toggleNodes();
        }

        if (key == ',') {
            circleRadius -= 10.0;
            placeNodesOnCircle(degOffset);
        }
        if (key == '.') {
            circleRadius += 10.0;
            placeNodesOnCircle(degOffset);
        }
        if (key == '/') {
            circleRadius = height/2;
            placeNodesOnCircle(degOffset);
        }
        if (key == '0') {
            heavyOrderNumber = 1;
        }
        if (key == '-') {
            heavyOrderNumber -= 1;
            if (heavyOrderNumber < 0) {
                heavyOrderNumber = 0;
            }
            placeHeavyNodesOnCircle(heavyOrderNumber, degOffset);
            //            placeNodesOnCircle(degOffset);
        }
        if (key == '+' || key == '=' ) {
            heavyOrderNumber += 1; 
            placeHeavyNodesOnCircle(heavyOrderNumber, degOffset);
            //            placeNodesOnCircle(degOffset);
        }
    }
    render = true;
}

