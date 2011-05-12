// $ANTLR 3.1.2 /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g 2009-07-09 16:56:15

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class dreqlLexer extends Lexer {
    public static final int TYPE=35;
    public static final int T__42=42;
    public static final int ARGS=29;
    public static final int VISIBLE=18;
    public static final int T__57=57;
    public static final int T__51=51;
    public static final int ZEROTOONE=23;
    public static final int COMMANDS=5;
    public static final int T__69=69;
    public static final int T__47=47;
    public static final int T__73=73;
    public static final int DREQL=4;
    public static final int T__50=50;
    public static final int ABSTRACT=33;
    public static final int T__65=65;
    public static final int T__72=72;
    public static final int RELTYPE=16;
    public static final int T__70=70;
    public static final int T__67=67;
    public static final int RENOM=32;
    public static final int T__74=74;
    public static final int VAL=37;
    public static final int T__52=52;
    public static final int T__46=46;
    public static final int EDITABLE=17;
    public static final int T__68=68;
    public static final int T__62=62;
    public static final int T__49=49;
    public static final int NTOM=26;
    public static final int T__61=61;
    public static final int ENUMOPT=28;
    public static final int T__59=59;
    public static final int ZEROTON=25;
    public static final int OPTIONAL=14;
    public static final int T__54=54;
    public static final int T__48=48;
    public static final int SETTYPE=31;
    public static final int ONETON=24;
    public static final int MASKED=19;
    public static final int EXTENDS=34;
    public static final int T__56=56;
    public static final int ENUM=27;
    public static final int ONE=22;
    public static final int T__58=58;
    public static final int T__64=64;
    public static final int T__44=44;
    public static final int RELATION=8;
    public static final int T__66=66;
    public static final int COMMENT=39;
    public static final int LINE_COMMENT=40;
    public static final int NS=38;
    public static final int FIELD=11;
    public static final int T__45=45;
    public static final int T__55=55;
    public static final int CLASS=7;
    public static final int TABLE=9;
    public static final int T__63=63;
    public static final int T__43=43;
    public static final int FIELDNAME=13;
    public static final int KEY=20;
    public static final int EOF=-1;
    public static final int T__53=53;
    public static final int DATATYPE=12;
    public static final int NUM=36;
    public static final int AUTOINC=21;
    public static final int SET=30;
    public static final int T__60=60;
    public static final int COMMAND=6;
    public static final int T__41=41;
    public static final int T__71=71;
    public static final int OPTION=15;
    public static final int FIELDS=10;

    // delegates
    // delegators

    public dreqlLexer() {;} 
    public dreqlLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public dreqlLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g"; }

    // $ANTLR start "T__41"
    public final void mT__41() throws RecognitionException {
        try {
            int _type = T__41;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:3:7: ( ';' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:3:9: ';'
            {
            match(';'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__41"

    // $ANTLR start "T__42"
    public final void mT__42() throws RecognitionException {
        try {
            int _type = T__42;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:4:7: ( 'class' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:4:9: 'class'
            {
            match("class"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__42"

    // $ANTLR start "T__43"
    public final void mT__43() throws RecognitionException {
        try {
            int _type = T__43;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:5:7: ( 'Class' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:5:9: 'Class'
            {
            match("Class"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__43"

    // $ANTLR start "T__44"
    public final void mT__44() throws RecognitionException {
        try {
            int _type = T__44;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:6:7: ( '(' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:6:9: '('
            {
            match('('); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__44"

    // $ANTLR start "T__45"
    public final void mT__45() throws RecognitionException {
        try {
            int _type = T__45;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:7:7: ( ')' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:7:9: ')'
            {
            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__45"

    // $ANTLR start "T__46"
    public final void mT__46() throws RecognitionException {
        try {
            int _type = T__46;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:8:7: ( 'abstract' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:8:9: 'abstract'
            {
            match("abstract"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__46"

    // $ANTLR start "T__47"
    public final void mT__47() throws RecognitionException {
        try {
            int _type = T__47;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:9:7: ( 'Abstract' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:9:9: 'Abstract'
            {
            match("Abstract"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__47"

    // $ANTLR start "T__48"
    public final void mT__48() throws RecognitionException {
        try {
            int _type = T__48;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:10:7: ( 'extends' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:10:9: 'extends'
            {
            match("extends"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__48"

    // $ANTLR start "T__49"
    public final void mT__49() throws RecognitionException {
        try {
            int _type = T__49;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:11:7: ( 'Extends' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:11:9: 'Extends'
            {
            match("Extends"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__49"

    // $ANTLR start "T__50"
    public final void mT__50() throws RecognitionException {
        try {
            int _type = T__50;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:12:7: ( 'relation' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:12:9: 'relation'
            {
            match("relation"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__50"

    // $ANTLR start "T__51"
    public final void mT__51() throws RecognitionException {
        try {
            int _type = T__51;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:13:7: ( 'Relation' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:13:9: 'Relation'
            {
            match("Relation"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__51"

    // $ANTLR start "T__52"
    public final void mT__52() throws RecognitionException {
        try {
            int _type = T__52;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:14:7: ( ',' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:14:9: ','
            {
            match(','); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__52"

    // $ANTLR start "T__53"
    public final void mT__53() throws RecognitionException {
        try {
            int _type = T__53;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:15:7: ( ':' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:15:9: ':'
            {
            match(':'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__53"

    // $ANTLR start "T__54"
    public final void mT__54() throws RecognitionException {
        try {
            int _type = T__54;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:16:7: ( 'renom' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:16:9: 'renom'
            {
            match("renom"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__54"

    // $ANTLR start "T__55"
    public final void mT__55() throws RecognitionException {
        try {
            int _type = T__55;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:17:7: ( 'Renom' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:17:9: 'Renom'
            {
            match("Renom"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__55"

    // $ANTLR start "T__56"
    public final void mT__56() throws RecognitionException {
        try {
            int _type = T__56;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:18:7: ( '=' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:18:9: '='
            {
            match('='); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__56"

    // $ANTLR start "T__57"
    public final void mT__57() throws RecognitionException {
        try {
            int _type = T__57;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:19:7: ( '[' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:19:9: '['
            {
            match('['); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__57"

    // $ANTLR start "T__58"
    public final void mT__58() throws RecognitionException {
        try {
            int _type = T__58;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:20:7: ( ']' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:20:9: ']'
            {
            match(']'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__58"

    // $ANTLR start "T__59"
    public final void mT__59() throws RecognitionException {
        try {
            int _type = T__59;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:21:7: ( 'enum' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:21:9: 'enum'
            {
            match("enum"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__59"

    // $ANTLR start "T__60"
    public final void mT__60() throws RecognitionException {
        try {
            int _type = T__60;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:22:7: ( 'Enum' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:22:9: 'Enum'
            {
            match("Enum"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__60"

    // $ANTLR start "T__61"
    public final void mT__61() throws RecognitionException {
        try {
            int _type = T__61;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:7: ( 'set' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:9: 'set'
            {
            match("set"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__61"

    // $ANTLR start "T__62"
    public final void mT__62() throws RecognitionException {
        try {
            int _type = T__62;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:24:7: ( 'Set' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:24:9: 'Set'
            {
            match("Set"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__62"

    // $ANTLR start "T__63"
    public final void mT__63() throws RecognitionException {
        try {
            int _type = T__63;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:25:7: ( 'editable' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:25:9: 'editable'
            {
            match("editable"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__63"

    // $ANTLR start "T__64"
    public final void mT__64() throws RecognitionException {
        try {
            int _type = T__64;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:26:7: ( 'visible' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:26:9: 'visible'
            {
            match("visible"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__64"

    // $ANTLR start "T__65"
    public final void mT__65() throws RecognitionException {
        try {
            int _type = T__65;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:7: ( 'optional' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:9: 'optional'
            {
            match("optional"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__65"

    // $ANTLR start "T__66"
    public final void mT__66() throws RecognitionException {
        try {
            int _type = T__66;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:28:7: ( 'masked' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:28:9: 'masked'
            {
            match("masked"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__66"

    // $ANTLR start "T__67"
    public final void mT__67() throws RecognitionException {
        try {
            int _type = T__67;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:29:7: ( 'key' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:29:9: 'key'
            {
            match("key"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__67"

    // $ANTLR start "T__68"
    public final void mT__68() throws RecognitionException {
        try {
            int _type = T__68;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:30:7: ( 'autoinc' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:30:9: 'autoinc'
            {
            match("autoinc"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__68"

    // $ANTLR start "T__69"
    public final void mT__69() throws RecognitionException {
        try {
            int _type = T__69;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:31:7: ( '1' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:31:9: '1'
            {
            match('1'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__69"

    // $ANTLR start "T__70"
    public final void mT__70() throws RecognitionException {
        try {
            int _type = T__70;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:32:7: ( '0..1' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:32:9: '0..1'
            {
            match("0..1"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__70"

    // $ANTLR start "T__71"
    public final void mT__71() throws RecognitionException {
        try {
            int _type = T__71;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:7: ( '1..*' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:9: '1..*'
            {
            match("1..*"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__71"

    // $ANTLR start "T__72"
    public final void mT__72() throws RecognitionException {
        try {
            int _type = T__72;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:34:7: ( '0..*' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:34:9: '0..*'
            {
            match("0..*"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__72"

    // $ANTLR start "T__73"
    public final void mT__73() throws RecognitionException {
        try {
            int _type = T__73;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:7: ( '*' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:9: '*'
            {
            match('*'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__73"

    // $ANTLR start "T__74"
    public final void mT__74() throws RecognitionException {
        try {
            int _type = T__74;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:36:7: ( '..' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:36:9: '..'
            {
            match(".."); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__74"

    // $ANTLR start "NUM"
    public final void mNUM() throws RecognitionException {
        try {
            int _type = NUM;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:131:5: ( ( '0' .. '9' )+ )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:131:7: ( '0' .. '9' )+
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:131:7: ( '0' .. '9' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>='0' && LA1_0<='9')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:131:8: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        throw eee;
                }
                cnt1++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "NUM"

    // $ANTLR start "TYPE"
    public final void mTYPE() throws RecognitionException {
        try {
            int _type = TYPE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:134:6: ( ( 'A' .. 'Z' | 'a' .. 'z' | '_' )+ )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:134:8: ( 'A' .. 'Z' | 'a' .. 'z' | '_' )+
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:134:8: ( 'A' .. 'Z' | 'a' .. 'z' | '_' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( ((LA2_0>='A' && LA2_0<='Z')||LA2_0=='_'||(LA2_0>='a' && LA2_0<='z')) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:
            	    {
            	    if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "TYPE"

    // $ANTLR start "VAL"
    public final void mVAL() throws RecognitionException {
        try {
            int _type = VAL;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:5: ( ( '\\'' ( options {greedy=false; } : . )* '\\'' ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:7: ( '\\'' ( options {greedy=false; } : . )* '\\'' )
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:7: ( '\\'' ( options {greedy=false; } : . )* '\\'' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:8: '\\'' ( options {greedy=false; } : . )* '\\''
            {
            match('\''); 
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:13: ( options {greedy=false; } : . )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0=='\'') ) {
                    alt3=2;
                }
                else if ( ((LA3_0>='\u0000' && LA3_0<='&')||(LA3_0>='(' && LA3_0<='\uFFFF')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:137:37: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

            match('\''); 

            }


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "VAL"

    // $ANTLR start "NS"
    public final void mNS() throws RecognitionException {
        try {
            int _type = NS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:148:4: ( ( ' ' | '\\t' | '\\n' | 'r' ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:148:6: ( ' ' | '\\t' | '\\n' | 'r' )
            {
            if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)==' '||input.LA(1)=='r' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

             skip(); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "NS"

    // $ANTLR start "COMMENT"
    public final void mCOMMENT() throws RecognitionException {
        try {
            int _type = COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:151:9: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:151:11: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:151:16: ( options {greedy=false; } : . )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0=='*') ) {
                    int LA4_1 = input.LA(2);

                    if ( (LA4_1=='/') ) {
                        alt4=2;
                    }
                    else if ( ((LA4_1>='\u0000' && LA4_1<='.')||(LA4_1>='0' && LA4_1<='\uFFFF')) ) {
                        alt4=1;
                    }


                }
                else if ( ((LA4_0>='\u0000' && LA4_0<=')')||(LA4_0>='+' && LA4_0<='\uFFFF')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:151:42: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

            match("*/"); 

             skip(); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMENT"

    // $ANTLR start "LINE_COMMENT"
    public final void mLINE_COMMENT() throws RecognitionException {
        try {
            int _type = LINE_COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:2: ( '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n' )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:5: '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n'
            {
            match("//"); 

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:10: (~ ( '\\n' | '\\r' ) )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( ((LA5_0>='\u0000' && LA5_0<='\t')||(LA5_0>='\u000B' && LA5_0<='\f')||(LA5_0>='\u000E' && LA5_0<='\uFFFF')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:10: ~ ( '\\n' | '\\r' )
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='\t')||(input.LA(1)>='\u000B' && input.LA(1)<='\f')||(input.LA(1)>='\u000E' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:24: ( '\\r' )?
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0=='\r') ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:155:24: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            match('\n'); 
             skip(); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "LINE_COMMENT"

    public void mTokens() throws RecognitionException {
        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:8: ( T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | T__54 | T__55 | T__56 | T__57 | T__58 | T__59 | T__60 | T__61 | T__62 | T__63 | T__64 | T__65 | T__66 | T__67 | T__68 | T__69 | T__70 | T__71 | T__72 | T__73 | T__74 | NUM | TYPE | VAL | NS | COMMENT | LINE_COMMENT )
        int alt7=40;
        alt7 = dfa7.predict(input);
        switch (alt7) {
            case 1 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:10: T__41
                {
                mT__41(); 

                }
                break;
            case 2 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:16: T__42
                {
                mT__42(); 

                }
                break;
            case 3 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:22: T__43
                {
                mT__43(); 

                }
                break;
            case 4 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:28: T__44
                {
                mT__44(); 

                }
                break;
            case 5 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:34: T__45
                {
                mT__45(); 

                }
                break;
            case 6 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:40: T__46
                {
                mT__46(); 

                }
                break;
            case 7 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:46: T__47
                {
                mT__47(); 

                }
                break;
            case 8 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:52: T__48
                {
                mT__48(); 

                }
                break;
            case 9 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:58: T__49
                {
                mT__49(); 

                }
                break;
            case 10 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:64: T__50
                {
                mT__50(); 

                }
                break;
            case 11 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:70: T__51
                {
                mT__51(); 

                }
                break;
            case 12 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:76: T__52
                {
                mT__52(); 

                }
                break;
            case 13 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:82: T__53
                {
                mT__53(); 

                }
                break;
            case 14 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:88: T__54
                {
                mT__54(); 

                }
                break;
            case 15 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:94: T__55
                {
                mT__55(); 

                }
                break;
            case 16 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:100: T__56
                {
                mT__56(); 

                }
                break;
            case 17 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:106: T__57
                {
                mT__57(); 

                }
                break;
            case 18 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:112: T__58
                {
                mT__58(); 

                }
                break;
            case 19 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:118: T__59
                {
                mT__59(); 

                }
                break;
            case 20 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:124: T__60
                {
                mT__60(); 

                }
                break;
            case 21 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:130: T__61
                {
                mT__61(); 

                }
                break;
            case 22 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:136: T__62
                {
                mT__62(); 

                }
                break;
            case 23 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:142: T__63
                {
                mT__63(); 

                }
                break;
            case 24 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:148: T__64
                {
                mT__64(); 

                }
                break;
            case 25 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:154: T__65
                {
                mT__65(); 

                }
                break;
            case 26 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:160: T__66
                {
                mT__66(); 

                }
                break;
            case 27 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:166: T__67
                {
                mT__67(); 

                }
                break;
            case 28 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:172: T__68
                {
                mT__68(); 

                }
                break;
            case 29 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:178: T__69
                {
                mT__69(); 

                }
                break;
            case 30 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:184: T__70
                {
                mT__70(); 

                }
                break;
            case 31 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:190: T__71
                {
                mT__71(); 

                }
                break;
            case 32 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:196: T__72
                {
                mT__72(); 

                }
                break;
            case 33 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:202: T__73
                {
                mT__73(); 

                }
                break;
            case 34 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:208: T__74
                {
                mT__74(); 

                }
                break;
            case 35 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:214: NUM
                {
                mNUM(); 

                }
                break;
            case 36 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:218: TYPE
                {
                mTYPE(); 

                }
                break;
            case 37 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:223: VAL
                {
                mVAL(); 

                }
                break;
            case 38 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:227: NS
                {
                mNS(); 

                }
                break;
            case 39 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:230: COMMENT
                {
                mCOMMENT(); 

                }
                break;
            case 40 :
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:1:238: LINE_COMMENT
                {
                mLINE_COMMENT(); 

                }
                break;

        }

    }


    protected DFA7 dfa7 = new DFA7(this);
    static final String DFA7_eotS =
        "\2\uffff\2\34\2\uffff\6\34\5\uffff\6\34\1\63\1\33\7\uffff\22\34"+
        "\5\uffff\16\34\1\132\1\133\3\34\1\137\1\uffff\6\34\1\150\2\34\1"+
        "\153\4\34\2\uffff\3\34\3\uffff\1\163\1\164\4\34\1\uffff\2\34\1\uffff"+
        "\1\34\1\174\1\34\1\176\3\34\2\uffff\7\34\1\uffff\1\34\1\uffff\2"+
        "\34\1\u008c\1\34\1\u008e\1\34\1\u0090\1\34\1\u0092\2\34\1\u0095"+
        "\1\34\1\uffff\1\u0097\1\uffff\1\u0098\1\uffff\1\u0099\1\uffff\1"+
        "\u009a\1\u009b\1\uffff\1\u009c\6\uffff";
    static final String DFA7_eofS =
        "\u009d\uffff";
    static final String DFA7_minS =
        "\1\11\1\uffff\2\154\2\uffff\2\142\1\144\1\156\2\145\5\uffff\2\145"+
        "\1\151\1\160\1\141\1\145\2\56\6\uffff\1\52\2\141\1\163\1\164\1\163"+
        "\1\164\1\165\1\151\1\164\1\165\2\154\2\164\1\163\1\164\1\163\1\171"+
        "\2\uffff\1\56\2\uffff\2\163\1\164\1\157\1\164\1\145\1\155\1\164"+
        "\1\145\1\155\1\141\1\157\1\141\1\157\2\101\2\151\1\153\1\101\1\52"+
        "\2\163\1\162\1\151\1\162\1\156\1\101\1\141\1\156\1\101\1\164\1\155"+
        "\1\164\1\155\2\uffff\1\142\1\157\1\145\3\uffff\2\101\1\141\1\156"+
        "\1\141\1\144\1\uffff\1\142\1\144\1\uffff\1\151\1\101\1\151\1\101"+
        "\1\154\1\156\1\144\2\uffff\3\143\1\163\1\154\1\163\1\157\1\uffff"+
        "\1\157\1\uffff\1\145\1\141\1\101\1\164\1\101\1\164\1\101\1\145\1"+
        "\101\2\156\1\101\1\154\1\uffff\1\101\1\uffff\1\101\1\uffff\1\101"+
        "\1\uffff\2\101\1\uffff\1\101\6\uffff";
    static final String DFA7_maxS =
        "\1\172\1\uffff\2\154\2\uffff\1\165\1\142\2\170\2\145\5\uffff\2\145"+
        "\1\151\1\160\1\141\1\145\1\71\1\56\6\uffff\1\57\2\141\1\163\1\164"+
        "\1\163\1\164\1\165\1\151\1\164\1\165\2\156\2\164\1\163\1\164\1\163"+
        "\1\171\2\uffff\1\56\2\uffff\2\163\1\164\1\157\1\164\1\145\1\155"+
        "\1\164\1\145\1\155\1\141\1\157\1\141\1\157\2\172\2\151\1\153\1\172"+
        "\1\61\2\163\1\162\1\151\1\162\1\156\1\172\1\141\1\156\1\172\1\164"+
        "\1\155\1\164\1\155\2\uffff\1\142\1\157\1\145\3\uffff\2\172\1\141"+
        "\1\156\1\141\1\144\1\uffff\1\142\1\144\1\uffff\1\151\1\172\1\151"+
        "\1\172\1\154\1\156\1\144\2\uffff\3\143\1\163\1\154\1\163\1\157\1"+
        "\uffff\1\157\1\uffff\1\145\1\141\1\172\1\164\1\172\1\164\1\172\1"+
        "\145\1\172\2\156\1\172\1\154\1\uffff\1\172\1\uffff\1\172\1\uffff"+
        "\1\172\1\uffff\2\172\1\uffff\1\172\6\uffff";
    static final String DFA7_acceptS =
        "\1\uffff\1\1\2\uffff\1\4\1\5\6\uffff\1\14\1\15\1\20\1\21\1\22\10"+
        "\uffff\1\41\1\42\1\43\1\44\1\45\1\46\23\uffff\1\37\1\35\1\uffff"+
        "\1\47\1\50\43\uffff\1\25\1\26\3\uffff\1\33\1\36\1\40\6\uffff\1\23"+
        "\2\uffff\1\24\7\uffff\1\2\1\3\7\uffff\1\16\1\uffff\1\17\15\uffff"+
        "\1\32\1\uffff\1\34\1\uffff\1\10\1\uffff\1\11\2\uffff\1\30\1\uffff"+
        "\1\6\1\7\1\27\1\12\1\13\1\31";
    static final String DFA7_specialS =
        "\u009d\uffff}>";
    static final String[] DFA7_transitionS = {
            "\2\36\25\uffff\1\36\6\uffff\1\35\1\4\1\5\1\31\1\uffff\1\14\1"+
            "\uffff\1\32\1\37\1\30\1\27\10\33\1\15\1\1\1\uffff\1\16\3\uffff"+
            "\1\7\1\34\1\3\1\34\1\11\14\34\1\13\1\22\7\34\1\17\1\uffff\1"+
            "\20\1\uffff\1\34\1\uffff\1\6\1\34\1\2\1\34\1\10\5\34\1\26\1"+
            "\34\1\25\1\34\1\24\2\34\1\12\1\21\2\34\1\23\4\34",
            "",
            "\1\40",
            "\1\41",
            "",
            "",
            "\1\42\22\uffff\1\43",
            "\1\44",
            "\1\47\11\uffff\1\46\11\uffff\1\45",
            "\1\51\11\uffff\1\50",
            "\1\52",
            "\1\53",
            "",
            "",
            "",
            "",
            "",
            "\1\54",
            "\1\55",
            "\1\56",
            "\1\57",
            "\1\60",
            "\1\61",
            "\1\62\1\uffff\12\33",
            "\1\64",
            "",
            "",
            "",
            "",
            "",
            "",
            "\1\65\4\uffff\1\66",
            "\1\67",
            "\1\70",
            "\1\71",
            "\1\72",
            "\1\73",
            "\1\74",
            "\1\75",
            "\1\76",
            "\1\77",
            "\1\100",
            "\1\101\1\uffff\1\102",
            "\1\103\1\uffff\1\104",
            "\1\105",
            "\1\106",
            "\1\107",
            "\1\110",
            "\1\111",
            "\1\112",
            "",
            "",
            "\1\113",
            "",
            "",
            "\1\114",
            "\1\115",
            "\1\116",
            "\1\117",
            "\1\120",
            "\1\121",
            "\1\122",
            "\1\123",
            "\1\124",
            "\1\125",
            "\1\126",
            "\1\127",
            "\1\130",
            "\1\131",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\134",
            "\1\135",
            "\1\136",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\141\6\uffff\1\140",
            "\1\142",
            "\1\143",
            "\1\144",
            "\1\145",
            "\1\146",
            "\1\147",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\151",
            "\1\152",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\154",
            "\1\155",
            "\1\156",
            "\1\157",
            "",
            "",
            "\1\160",
            "\1\161",
            "\1\162",
            "",
            "",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\165",
            "\1\166",
            "\1\167",
            "\1\170",
            "",
            "\1\171",
            "\1\172",
            "",
            "\1\173",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\175",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\177",
            "\1\u0080",
            "\1\u0081",
            "",
            "",
            "\1\u0082",
            "\1\u0083",
            "\1\u0084",
            "\1\u0085",
            "\1\u0086",
            "\1\u0087",
            "\1\u0088",
            "",
            "\1\u0089",
            "",
            "\1\u008a",
            "\1\u008b",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\u008d",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\u008f",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\u0091",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\u0093",
            "\1\u0094",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\1\u0096",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "",
            "\32\34\4\uffff\1\34\1\uffff\32\34",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA7_eot = DFA.unpackEncodedString(DFA7_eotS);
    static final short[] DFA7_eof = DFA.unpackEncodedString(DFA7_eofS);
    static final char[] DFA7_min = DFA.unpackEncodedStringToUnsignedChars(DFA7_minS);
    static final char[] DFA7_max = DFA.unpackEncodedStringToUnsignedChars(DFA7_maxS);
    static final short[] DFA7_accept = DFA.unpackEncodedString(DFA7_acceptS);
    static final short[] DFA7_special = DFA.unpackEncodedString(DFA7_specialS);
    static final short[][] DFA7_transition;

    static {
        int numStates = DFA7_transitionS.length;
        DFA7_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA7_transition[i] = DFA.unpackEncodedString(DFA7_transitionS[i]);
        }
    }

    class DFA7 extends DFA {

        public DFA7(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 7;
            this.eot = DFA7_eot;
            this.eof = DFA7_eof;
            this.min = DFA7_min;
            this.max = DFA7_max;
            this.accept = DFA7_accept;
            this.special = DFA7_special;
            this.transition = DFA7_transition;
        }
        public String getDescription() {
            return "1:1: Tokens : ( T__41 | T__42 | T__43 | T__44 | T__45 | T__46 | T__47 | T__48 | T__49 | T__50 | T__51 | T__52 | T__53 | T__54 | T__55 | T__56 | T__57 | T__58 | T__59 | T__60 | T__61 | T__62 | T__63 | T__64 | T__65 | T__66 | T__67 | T__68 | T__69 | T__70 | T__71 | T__72 | T__73 | T__74 | NUM | TYPE | VAL | NS | COMMENT | LINE_COMMENT );";
        }
    }
 

}