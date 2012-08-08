

class ClauseNode extends Node {

    String v1;
    String v2;
    String v3;

    ClauseNode() {
    }

    ClauseNode(String x1, String x2, String x3 ) {
        this.v1 = x1;
        this.v2 = x2;
        this.v3 = x3;
        this.label = x1+" "+x2+" "+x3;
        x = random(width);
        y = random(height);
    }

    void draw() {

        bubbleText textBox = new bubbleText(label, font, 13, color(127), color(0));
        textBox.render(int(x), int(y));
    }
}

