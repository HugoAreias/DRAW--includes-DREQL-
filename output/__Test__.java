import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;
import org.antlr.runtime.debug.DebugEventSocketProxy;


public class __Test__ {

    public static void main(String args[]) throws Exception {
        dreqlLexer lex = new dreqlLexer(new ANTLRFileStream("/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/XAGraClasses.txt"));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        dreqlParser parser = new dreqlParser(tokens);
        dreqlParser.dreql_return r = parser.dreql(); 
        CommonTreeNodeStream nodes = new CommonTreeNodeStream(r.getTree());
        
        dreqltree walker = new dreqltree(nodes);
        try {
            walker.dreql();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}