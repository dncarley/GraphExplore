

void addEdge(String fromLabel, String toLabel) {

    Node from = findNode(fromLabel);
    Node to   = findNode(toLabel);
    Edge e    = new Edge(from, to);

    if ( edgeCount == edges.length) {
        edges = (Edge[]) expand(edges);
    }
    edges[edgeCount++] = e;
}

void addEdge(String fromLabel, String fromImg, String toLabel, String toImg) {

    Node from = findNode(fromLabel, fromImg);
    Node to   = findNode(toLabel, toImg);
    
    Edge e    = new Edge(from, to);

    if ( edgeCount == edges.length) {
        edges = (Edge[]) expand(edges);
    }
    edges[edgeCount++] = e;
}


class Edge {
    Node from;
    Node to;
    float len;
    float edgeWidth;
    int count;

    Edge() {
    }

    Edge(Node from, Node to) {
        this.from  = from;
        this.to    = to;
        this.len   = 50;
        this.edgeWidth = 0.1;
    }

    void increment() {
        count++;
    }

    void relax() {
        float vx = to.x - from.x;
        float vy = to.y - from.y;
        float d = mag(vx, vy);
        if (d > 0) {
            float f = (len - d) / (d * 4);
            float dx = f * vx;
            float dy = f * vy;
            to.dx += dx;
            to.dy += dy;
            from.dx -= dx;
            from.dy -= dy;
        }
    }

    void draw() {

        if ( selection != null && (selection.isEqual(from) || selection.isEqual(to))) {
            strokeWeight(edgeWidth*30);
            stroke(200, 200, 0);
        }
        else if ( !from.fixed || !to.fixed) {
            strokeWeight(edgeWidth);
            stroke(0, 200, 200);
        }

        else {
            strokeWeight(edgeWidth);
            stroke(edgeColor);
        }

        line(from.x, from.y, to.x, to.y);
    }
}

