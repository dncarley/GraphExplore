
class ClauseEdge extends Edge
{
    ClauseNode from;
    ClauseNode to;

    ClauseEdge(ClauseNode from, ClauseNode to) {
        this.from  = from;
        this.to    = to;
        this.len   = 50;
        this.edgeWidth = .15;
    }

    void draw() {


        if ( selection != null && (selection.isEqual(from) || selection.isEqual(to))) {
            strokeWeight(edgeWidth*30);
            stroke(200, 200, 0);
        }
        else {
            strokeWeight(edgeWidth);
            stroke(edgeColor);
        }

        line(from.x, from.y, to.x, to.y);
    }
}

