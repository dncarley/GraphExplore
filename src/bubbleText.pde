
class bubbleText
{
    String s;
    PFont font;
    int pt;
    color bColor;
    color  fColor;

    bubbleText(String s, PFont font, int pt, color bColor, color fColor) {

        this.s = s;
        this.font = font;
        this.pt = pt;
        this.bColor = bColor;
        this.fColor = fColor;
    }

    void render(int x, int y) {
        smooth();
        noStroke();
        rectMode(CORNER);
        ellipseMode(CENTER);

        textFont(font, pt);

        fill(bColor);
        ellipse(x, y+(pt>>1), pt, pt);
        rect(x, y, textWidth(s), pt);
        ellipse(x+textWidth(s), y+(pt>>1), pt, pt);

        fill(fColor);
        text(s, x, y+0.75*pt);
    }
}

