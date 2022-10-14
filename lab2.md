```Java
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;

class Handler implements URLHandler {
    // The one bit of state on the server: a numbear that will be manipulated by
    // various requests.
    ArrayList<String> stringStore = new ArrayList<>();

    public String handleRequest(URI url) {
        if (url.getPath().equals("/")) {

            return String.format(
                
            "Strings inside: " + stringStore.toString()
            
            );

        } else {
            System.out.println("Path: " + url.getPath());
            if (url.getPath().contains("/add")) {
                String[] parameters = url.getQuery().split("="); // parse to take arguments after the Query symbol "?" /add?s=apple

                if (parameters[0].equals("s")) {
                    stringStore.add(parameters[1]);
                    return String.format("String added: " + "\"" + parameters[1] + "\""); // String added: "string"
                }
            }

            if (url.getPath().contains("/search")) {
                String[] parameters = url.getQuery().split("="); // parse to take arguments after the Query symbol "?" /add?s=apple
                ArrayList<String> queried = new ArrayList<>();
                
                for (String s : stringStore) { // iterate parameters given queries
                    if (s.contains(parameters[1])) { // check for given query
                        queried.add(s); // add matching query
                    }
                }
                return String.format("Queried words: " + queried.toString()); // display AL w/ all words that contain it.
            }
            return "404 Not Found!";
        }
    }
}

class SearchEngine {
    public static void main(String[] args) throws IOException {
        if(args.length == 0){
            System.out.println("Missing port number! Try any number between 1024 to 49151");
            return;
        }

        int port = Integer.parseInt(args[0]);

        Server.start(port, new Handler());
    }
}
```