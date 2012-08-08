

/// Load file
boolean loadfile;
String currentFilename;

String selectFile() {

    String loadPath = selectInput();  // Opens file chooser

    loadfile = false;

    if (loadPath == null) {
        // If a file was not selected   

        return "-";
    } 
    else {
        // If a file was selected, print path to file
        if (loadPath.equals('\0')) {
            loadPath = "-";
        }
        return loadPath;
    }
}


