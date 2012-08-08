
Node findNode(String label) {
    label = label.toLowerCase();
    Node n = (Node) nodeTable.get(label);
    if ( n == null) {
        n = addNode(label);
    }
    return n;
}

Node findNode(String label, String img) {
    label = label.toLowerCase();
    Node n = (Node) nodeTable.get(label);
    if ( n == null) {
        n = addNode(label);
        n.img = loadImage(img);
    }
    return n;
}

Node addNode(String label) {

    Node n = new Node(label);
    if (nodeCount == nodes.length) {
        nodes = (Node[]) expand(nodes);
    }

    nodeTable.put(label, n);
    nodes[nodeCount++] = n;
    return n;
}

class Node {
    float x, y;
    float dx, dy;
    boolean fixed;
    String label;
    int count;
    PImage img;


    Node() {
    }

    Node(String label) {
        this.label = label;
        this.fixed = true;
        x = random(width);
        y = random(height);
        img = null;
    }

    void increment() {
        count++;
    }

    void relax() {
        float ddx = 0;
        float ddy = 0;

        for (int j = 0; j < nodeCount; j++) {
            Node n = nodes[j];
            if (n != this) {
                float vx = x - n.x;
                float vy = y - n.y;
                float lensq = vx * vx + vy * vy;
                if (lensq == 0) {
                    ddx += random(1);
                    ddy += random(1);
                } 
                else if (lensq < 100*100) {
                    ddx += vx / lensq;
                    ddy += vy / lensq;
                }
            }
        }
        float dlen = mag(ddx, ddy) / 2;
        if (dlen > 0) {
            dx += ddx / dlen;
            dy += ddy / dlen;
        }
    }

    void setPosition(float posX, float posY) {

        x = posX;
        y = posY;
        fixed = true;
    }

    void update(int shake) {
        if (!fixed) {      
            x += constrain(dx, -1*shake, shake);
            y += constrain(dy, -1*shake, shake);

            x = constrain(x, 0, width);
            y = constrain(y, 0, height);
        }
        dx /= 2;    
        dy /= 2;
    }

    boolean isEqual(Node arg) {

        return label.equals(arg.label);
    }

    void draw() {
        fill(nodeColor);
        stroke(0);
        strokeWeight(0.5);


        float w = textWidth(label);

        //        ellipse(x, y, count, count);

        fill(255, 0, 0);
        ellipse(x, y, 25, 25);

        if (img == null) {
            if (fixed)
                fill(textDefaultColor);
            else
                fill(textFloatColor);
            textAlign(CENTER, CENTER);
 
            textFont(font);
            text(label, x, y);
        }
        else {
            image(img, x, y);
        }
    }
}

