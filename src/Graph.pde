
import java.util.HashMap;

///    Graph propertities
int graphCount;

int nodeCount;
Node[] nodes = new Node[100];
HashMap nodeTable = new HashMap();

int edgeCount;
Edge[] edges = new Edge[500];


class Graph {
}

void clearContent() {

    nodeCount = 0;
    nodes = new Node[100];
    nodeTable = new HashMap();

    edgeCount = 0;
    edges = new Edge[500];
}

void placeNodesOnCircle() {

    placeNodesOnCircle(nodeCount, 0.0);
}

void placeNodesOnCircle(float offset) {

    placeNodesOnCircle(nodeCount, offset);
}

void placeNodesOnCircle(int nPoints, float offset) {

    float loc = offset;
    float delta = 360.0/nPoints;

    //    float radius = (width/2) - 60;

    for (int i = 0; i < nPoints; i+= 1) {

        //        println(loc + " : " + sin(loc)+ " " +cos(loc));

        if (nodes[i].fixed) {
            nodes[i].setPosition( circleRadius*cos(radians(loc))+(width/2), circleRadius*sin(radians(loc))+(height/2));
        }
        else {
        }
        loc += delta;
    }
}



void getMaxOrder() {
}

void getMinOrder() {
}

void placeHeavyNodesOnCircle(int weight, float offset) {

    float loc = offset;
    float delta = 2.0;

    //    float radius = (width/2) - 60;
    HashMap<String, Integer> vertexMap = new HashMap<String, Integer>();

    for (int i = 0; i < edgeCount; i++) {

        if (vertexMap.containsKey(edges[i].to.label)) {

            Integer value = vertexMap.get(edges[i].to.label);
            value += 1;
            vertexMap.put(edges[i].to.label, value);
        }
        else {
            //   println("putElement");
            vertexMap.put(edges[i].to.label, new Integer(0));
        }
    }

    for (String key : vertexMap.keySet()) {

        Integer value = vertexMap.get(key);
        //        println("Key = " + key + "Value = " + value);

        Node n = findNode(key);

        if (value.intValue() >= weight) {

            n.fixed = true;
        }
        else {

            n.fixed = false;
        }
    }
}

void placeRandomOnScreen() {

    for (int i = 0; i < nodeCount; i+= 1) {
        nodes[i].setPosition( random(20, width-20), random(20, height-20));
    }
}

void fixNodes() {

    for (int i = 0; i < nodeCount; i+= 1) {
        nodes[i].fixed = true;
    }
}

void toggleNodes() {

    for (int i = 0; i < nodeCount; i+= 1) {

        if (nodes[i].fixed) {
            nodes[i].fixed = false;
        }
        else {
            nodes[i].fixed = true;
        }
    }
}


void placeLine() {

    if (nodeCount > 0) {
        float xPos, yPos;
        float diff = (width-40)/nodeCount;

        xPos = 20;
        yPos = height/2;

        for (int i = 0; i < nodeCount; i+= 1) {

            nodes[i].setPosition(xPos, yPos);

            xPos += diff;
        }
    }
}

