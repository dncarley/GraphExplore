import org.json.*;


void selectAndLoadCollusion() {

    currentFilename = selectFile();

    if (currentFilename.endsWith("json")) {
        clearContent();
        loadCollusion(currentFilename);
    }
}



void loadCollusion(String filename) {

    String[] lines;
    JSONObject readJSON = null;
    JSONObject readJSON_2 = null;

    lines = loadStrings(filename);

    try {
        readJSON = new JSONObject(lines[0]);
    } 
    catch(JSONException e) {
        println("JSON read exception");
    }

    Iterator it_1 = readJSON.keys();
    while (it_1.hasNext ()) {
        String key = (String) it_1.next();

        try {
            readJSON_2 = readJSON.getJSONObject(key);
        } 
        catch(JSONException e) {
            println("JSON read exception");
        }
        try {
            readJSON_2 = readJSON_2.getJSONObject("referrers");
        } 
        catch(JSONException e) {
            println("JSON read exception_2");
        }

        Iterator it_2 = readJSON_2.keys();
        while (it_2.hasNext ()) {
            String key_2 = (String) it_2.next();
            addEdge(key, key_2);
//            addEdge(key, "http://"+key+"/favicon.ico", key_2, "http://"+key_2+"/favicon.ico");

        }
    }
    
    graphCount++;
}

