

void loadDIMACS_CNF(String filename) {

    String[] lines;
    lines = loadStrings(filename);

    for (int i = 0; i < lines.length; i++) {
        String[] pieces = split(lines[i], " "); // Load data into array
        
        if (pieces[0].equals("e") ) {
            
            pieces[1] = pieces[1] + "_" + graphCount;
            pieces[2] = pieces[2] + "_" + graphCount;
            
            addEdge(pieces[1], pieces[2]);
            addEdge(pieces[2], pieces[1]);
        }
    }
    graphCount++;
}
