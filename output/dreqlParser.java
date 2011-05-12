// $ANTLR 3.1.2 /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g 2009-07-09 16:56:14



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class dreqlParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "DREQL", "COMMANDS", "COMMAND", "CLASS", "RELATION", "TABLE", "FIELDS", "FIELD", "DATATYPE", "FIELDNAME", "OPTIONAL", "OPTION", "RELTYPE", "EDITABLE", "VISIBLE", "MASKED", "KEY", "AUTOINC", "ONE", "ZEROTOONE", "ONETON", "ZEROTON", "NTOM", "ENUM", "ENUMOPT", "ARGS", "SET", "SETTYPE", "RENOM", "ABSTRACT", "EXTENDS", "TYPE", "NUM", "VAL", "NS", "COMMENT", "LINE_COMMENT", "';'", "'class'", "'Class'", "'('", "')'", "'abstract'", "'Abstract'", "'extends'", "'Extends'", "'relation'", "'Relation'", "','", "':'", "'renom'", "'Renom'", "'='", "'['", "']'", "'enum'", "'Enum'", "'set'", "'Set'", "'editable'", "'visible'", "'optional'", "'masked'", "'key'", "'autoinc'", "'1'", "'0..1'", "'1..*'", "'0..*'", "'*'", "'..'"
    };
    public static final int TYPE=35;
    public static final int T__42=42;
    public static final int ARGS=29;
    public static final int VISIBLE=18;
    public static final int T__57=57;
    public static final int T__51=51;
    public static final int ZEROTOONE=23;
    public static final int COMMANDS=5;
    public static final int T__47=47;
    public static final int T__69=69;
    public static final int T__73=73;
    public static final int T__50=50;
    public static final int DREQL=4;
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
    public static final int T__66=66;
    public static final int RELATION=8;
    public static final int COMMENT=39;
    public static final int LINE_COMMENT=40;
    public static final int NS=38;
    public static final int FIELD=11;
    public static final int T__55=55;
    public static final int T__45=45;
    public static final int CLASS=7;
    public static final int T__63=63;
    public static final int TABLE=9;
    public static final int T__43=43;
    public static final int KEY=20;
    public static final int FIELDNAME=13;
    public static final int EOF=-1;
    public static final int T__53=53;
    public static final int NUM=36;
    public static final int DATATYPE=12;
    public static final int AUTOINC=21;
    public static final int SET=30;
    public static final int T__60=60;
    public static final int T__41=41;
    public static final int COMMAND=6;
    public static final int OPTION=15;
    public static final int T__71=71;
    public static final int FIELDS=10;

    // delegates
    // delegators


        public dreqlParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public dreqlParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        
    protected TreeAdaptor adaptor = new CommonTreeAdaptor();

    public void setTreeAdaptor(TreeAdaptor adaptor) {
        this.adaptor = adaptor;
    }
    public TreeAdaptor getTreeAdaptor() {
        return adaptor;
    }

    public String[] getTokenNames() { return dreqlParser.tokenNames; }
    public String getGrammarFileName() { return "/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g"; }




    public static class dreql_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "dreql"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:19:1: dreql : commands -> ^( DREQL commands ) ;
    public final dreqlParser.dreql_return dreql() throws RecognitionException {
        dreqlParser.dreql_return retval = new dreqlParser.dreql_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        dreqlParser.commands_return commands1 = null;


        RewriteRuleSubtreeStream stream_commands=new RewriteRuleSubtreeStream(adaptor,"rule commands");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:19:7: ( commands -> ^( DREQL commands ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:19:9: commands
            {
            pushFollow(FOLLOW_commands_in_dreql147);
            commands1=commands();

            state._fsp--;

            stream_commands.add(commands1.getTree());


            // AST REWRITE
            // elements: commands
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 20:3: -> ^( DREQL commands )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:20:6: ^( DREQL commands )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(DREQL, "DREQL"), root_1);

                adaptor.addChild(root_1, stream_commands.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "dreql"

    public static class commands_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "commands"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:1: commands : ( command ';' )+ -> ^( COMMANDS ( command )+ ) ;
    public final dreqlParser.commands_return commands() throws RecognitionException {
        dreqlParser.commands_return retval = new dreqlParser.commands_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token char_literal3=null;
        dreqlParser.command_return command2 = null;


        Object char_literal3_tree=null;
        RewriteRuleTokenStream stream_41=new RewriteRuleTokenStream(adaptor,"token 41");
        RewriteRuleSubtreeStream stream_command=new RewriteRuleSubtreeStream(adaptor,"rule command");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:10: ( ( command ';' )+ -> ^( COMMANDS ( command )+ ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:12: ( command ';' )+
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:12: ( command ';' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>=42 && LA1_0<=43)||(LA1_0>=46 && LA1_0<=47)||(LA1_0>=50 && LA1_0<=51)||(LA1_0>=54 && LA1_0<=55)) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:23:13: command ';'
            	    {
            	    pushFollow(FOLLOW_command_in_commands168);
            	    command2=command();

            	    state._fsp--;

            	    stream_command.add(command2.getTree());
            	    char_literal3=(Token)match(input,41,FOLLOW_41_in_commands170);  
            	    stream_41.add(char_literal3);


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



            // AST REWRITE
            // elements: command
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 24:3: -> ^( COMMANDS ( command )+ )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:24:6: ^( COMMANDS ( command )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(COMMANDS, "COMMANDS"), root_1);

                if ( !(stream_command.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_command.hasNext() ) {
                    adaptor.addChild(root_1, stream_command.nextTree());

                }
                stream_command.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "commands"

    public static class command_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "command"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:1: command : (a= dclass | b= relation | c= renom ) -> {a!=null}? ^( COMMAND dclass ) -> {b!=null}? ^( COMMAND relation ) -> ^( COMMAND renom ) ;
    public final dreqlParser.command_return command() throws RecognitionException {
        dreqlParser.command_return retval = new dreqlParser.command_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        dreqlParser.dclass_return a = null;

        dreqlParser.relation_return b = null;

        dreqlParser.renom_return c = null;


        RewriteRuleSubtreeStream stream_dclass=new RewriteRuleSubtreeStream(adaptor,"rule dclass");
        RewriteRuleSubtreeStream stream_renom=new RewriteRuleSubtreeStream(adaptor,"rule renom");
        RewriteRuleSubtreeStream stream_relation=new RewriteRuleSubtreeStream(adaptor,"rule relation");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:9: ( (a= dclass | b= relation | c= renom ) -> {a!=null}? ^( COMMAND dclass ) -> {b!=null}? ^( COMMAND relation ) -> ^( COMMAND renom ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:11: (a= dclass | b= relation | c= renom )
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:11: (a= dclass | b= relation | c= renom )
            int alt2=3;
            switch ( input.LA(1) ) {
            case 42:
            case 43:
            case 46:
            case 47:
                {
                alt2=1;
                }
                break;
            case 50:
            case 51:
                {
                alt2=2;
                }
                break;
            case 54:
            case 55:
                {
                alt2=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }

            switch (alt2) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:12: a= dclass
                    {
                    pushFollow(FOLLOW_dclass_in_command196);
                    a=dclass();

                    state._fsp--;

                    stream_dclass.add(a.getTree());

                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:23: b= relation
                    {
                    pushFollow(FOLLOW_relation_in_command202);
                    b=relation();

                    state._fsp--;

                    stream_relation.add(b.getTree());

                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:27:36: c= renom
                    {
                    pushFollow(FOLLOW_renom_in_command208);
                    c=renom();

                    state._fsp--;

                    stream_renom.add(c.getTree());

                    }
                    break;

            }



            // AST REWRITE
            // elements: relation, renom, dclass
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 28:3: -> {a!=null}? ^( COMMAND dclass )
            if (a!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:28:17: ^( COMMAND dclass )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(COMMAND, "COMMAND"), root_1);

                adaptor.addChild(root_1, stream_dclass.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 29:3: -> {b!=null}? ^( COMMAND relation )
            if (b!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:29:17: ^( COMMAND relation )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(COMMAND, "COMMAND"), root_1);

                adaptor.addChild(root_1, stream_relation.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 30:3: -> ^( COMMAND renom )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:30:6: ^( COMMAND renom )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(COMMAND, "COMMAND"), root_1);

                adaptor.addChild(root_1, stream_renom.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "command"

    public static class dclass_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "dclass"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:1: dclass : ( ( 'class' | 'Class' ) table '(' fields ')' -> ^( CLASS table fields ) | ( 'abstract' | 'Abstract' ) table '(' fields ')' -> ^( ABSTRACT table fields ) | ( 'class' | 'Class' ) table ( 'extends' | 'Extends' ) table '(' fields ')' -> ^( EXTENDS table table fields ) );
    public final dreqlParser.dclass_return dclass() throws RecognitionException {
        dreqlParser.dclass_return retval = new dreqlParser.dclass_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token string_literal4=null;
        Token string_literal5=null;
        Token char_literal7=null;
        Token char_literal9=null;
        Token string_literal10=null;
        Token string_literal11=null;
        Token char_literal13=null;
        Token char_literal15=null;
        Token string_literal16=null;
        Token string_literal17=null;
        Token string_literal19=null;
        Token string_literal20=null;
        Token char_literal22=null;
        Token char_literal24=null;
        dreqlParser.table_return table6 = null;

        dreqlParser.fields_return fields8 = null;

        dreqlParser.table_return table12 = null;

        dreqlParser.fields_return fields14 = null;

        dreqlParser.table_return table18 = null;

        dreqlParser.table_return table21 = null;

        dreqlParser.fields_return fields23 = null;


        Object string_literal4_tree=null;
        Object string_literal5_tree=null;
        Object char_literal7_tree=null;
        Object char_literal9_tree=null;
        Object string_literal10_tree=null;
        Object string_literal11_tree=null;
        Object char_literal13_tree=null;
        Object char_literal15_tree=null;
        Object string_literal16_tree=null;
        Object string_literal17_tree=null;
        Object string_literal19_tree=null;
        Object string_literal20_tree=null;
        Object char_literal22_tree=null;
        Object char_literal24_tree=null;
        RewriteRuleTokenStream stream_43=new RewriteRuleTokenStream(adaptor,"token 43");
        RewriteRuleTokenStream stream_48=new RewriteRuleTokenStream(adaptor,"token 48");
        RewriteRuleTokenStream stream_46=new RewriteRuleTokenStream(adaptor,"token 46");
        RewriteRuleTokenStream stream_44=new RewriteRuleTokenStream(adaptor,"token 44");
        RewriteRuleTokenStream stream_42=new RewriteRuleTokenStream(adaptor,"token 42");
        RewriteRuleTokenStream stream_47=new RewriteRuleTokenStream(adaptor,"token 47");
        RewriteRuleTokenStream stream_49=new RewriteRuleTokenStream(adaptor,"token 49");
        RewriteRuleTokenStream stream_45=new RewriteRuleTokenStream(adaptor,"token 45");
        RewriteRuleSubtreeStream stream_table=new RewriteRuleSubtreeStream(adaptor,"rule table");
        RewriteRuleSubtreeStream stream_fields=new RewriteRuleSubtreeStream(adaptor,"rule fields");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:8: ( ( 'class' | 'Class' ) table '(' fields ')' -> ^( CLASS table fields ) | ( 'abstract' | 'Abstract' ) table '(' fields ')' -> ^( ABSTRACT table fields ) | ( 'class' | 'Class' ) table ( 'extends' | 'Extends' ) table '(' fields ')' -> ^( EXTENDS table table fields ) )
            int alt7=3;
            switch ( input.LA(1) ) {
            case 42:
                {
                int LA7_1 = input.LA(2);

                if ( (LA7_1==TYPE) ) {
                    int LA7_4 = input.LA(3);

                    if ( ((LA7_4>=48 && LA7_4<=49)) ) {
                        alt7=3;
                    }
                    else if ( (LA7_4==44) ) {
                        alt7=1;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 7, 4, input);

                        throw nvae;
                    }
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 7, 1, input);

                    throw nvae;
                }
                }
                break;
            case 43:
                {
                int LA7_2 = input.LA(2);

                if ( (LA7_2==TYPE) ) {
                    int LA7_4 = input.LA(3);

                    if ( ((LA7_4>=48 && LA7_4<=49)) ) {
                        alt7=3;
                    }
                    else if ( (LA7_4==44) ) {
                        alt7=1;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 7, 4, input);

                        throw nvae;
                    }
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 7, 2, input);

                    throw nvae;
                }
                }
                break;
            case 46:
            case 47:
                {
                alt7=2;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 7, 0, input);

                throw nvae;
            }

            switch (alt7) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:10: ( 'class' | 'Class' ) table '(' fields ')'
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:10: ( 'class' | 'Class' )
                    int alt3=2;
                    int LA3_0 = input.LA(1);

                    if ( (LA3_0==42) ) {
                        alt3=1;
                    }
                    else if ( (LA3_0==43) ) {
                        alt3=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 3, 0, input);

                        throw nvae;
                    }
                    switch (alt3) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:11: 'class'
                            {
                            string_literal4=(Token)match(input,42,FOLLOW_42_in_dclass254);  
                            stream_42.add(string_literal4);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:33:21: 'Class'
                            {
                            string_literal5=(Token)match(input,43,FOLLOW_43_in_dclass258);  
                            stream_43.add(string_literal5);


                            }
                            break;

                    }

                    pushFollow(FOLLOW_table_in_dclass261);
                    table6=table();

                    state._fsp--;

                    stream_table.add(table6.getTree());
                    char_literal7=(Token)match(input,44,FOLLOW_44_in_dclass263);  
                    stream_44.add(char_literal7);

                    pushFollow(FOLLOW_fields_in_dclass265);
                    fields8=fields();

                    state._fsp--;

                    stream_fields.add(fields8.getTree());
                    char_literal9=(Token)match(input,45,FOLLOW_45_in_dclass267);  
                    stream_45.add(char_literal9);



                    // AST REWRITE
                    // elements: fields, table
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 34:3: -> ^( CLASS table fields )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:34:6: ^( CLASS table fields )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(CLASS, "CLASS"), root_1);

                        adaptor.addChild(root_1, stream_table.nextTree());
                        adaptor.addChild(root_1, stream_fields.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:5: ( 'abstract' | 'Abstract' ) table '(' fields ')'
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:5: ( 'abstract' | 'Abstract' )
                    int alt4=2;
                    int LA4_0 = input.LA(1);

                    if ( (LA4_0==46) ) {
                        alt4=1;
                    }
                    else if ( (LA4_0==47) ) {
                        alt4=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 4, 0, input);

                        throw nvae;
                    }
                    switch (alt4) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:6: 'abstract'
                            {
                            string_literal10=(Token)match(input,46,FOLLOW_46_in_dclass286);  
                            stream_46.add(string_literal10);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:35:19: 'Abstract'
                            {
                            string_literal11=(Token)match(input,47,FOLLOW_47_in_dclass290);  
                            stream_47.add(string_literal11);


                            }
                            break;

                    }

                    pushFollow(FOLLOW_table_in_dclass293);
                    table12=table();

                    state._fsp--;

                    stream_table.add(table12.getTree());
                    char_literal13=(Token)match(input,44,FOLLOW_44_in_dclass295);  
                    stream_44.add(char_literal13);

                    pushFollow(FOLLOW_fields_in_dclass297);
                    fields14=fields();

                    state._fsp--;

                    stream_fields.add(fields14.getTree());
                    char_literal15=(Token)match(input,45,FOLLOW_45_in_dclass299);  
                    stream_45.add(char_literal15);



                    // AST REWRITE
                    // elements: fields, table
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 36:3: -> ^( ABSTRACT table fields )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:36:6: ^( ABSTRACT table fields )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(ABSTRACT, "ABSTRACT"), root_1);

                        adaptor.addChild(root_1, stream_table.nextTree());
                        adaptor.addChild(root_1, stream_fields.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:5: ( 'class' | 'Class' ) table ( 'extends' | 'Extends' ) table '(' fields ')'
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:5: ( 'class' | 'Class' )
                    int alt5=2;
                    int LA5_0 = input.LA(1);

                    if ( (LA5_0==42) ) {
                        alt5=1;
                    }
                    else if ( (LA5_0==43) ) {
                        alt5=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 5, 0, input);

                        throw nvae;
                    }
                    switch (alt5) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:6: 'class'
                            {
                            string_literal16=(Token)match(input,42,FOLLOW_42_in_dclass318);  
                            stream_42.add(string_literal16);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:16: 'Class'
                            {
                            string_literal17=(Token)match(input,43,FOLLOW_43_in_dclass322);  
                            stream_43.add(string_literal17);


                            }
                            break;

                    }

                    pushFollow(FOLLOW_table_in_dclass325);
                    table18=table();

                    state._fsp--;

                    stream_table.add(table18.getTree());
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:31: ( 'extends' | 'Extends' )
                    int alt6=2;
                    int LA6_0 = input.LA(1);

                    if ( (LA6_0==48) ) {
                        alt6=1;
                    }
                    else if ( (LA6_0==49) ) {
                        alt6=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 6, 0, input);

                        throw nvae;
                    }
                    switch (alt6) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:32: 'extends'
                            {
                            string_literal19=(Token)match(input,48,FOLLOW_48_in_dclass328);  
                            stream_48.add(string_literal19);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:37:44: 'Extends'
                            {
                            string_literal20=(Token)match(input,49,FOLLOW_49_in_dclass332);  
                            stream_49.add(string_literal20);


                            }
                            break;

                    }

                    pushFollow(FOLLOW_table_in_dclass335);
                    table21=table();

                    state._fsp--;

                    stream_table.add(table21.getTree());
                    char_literal22=(Token)match(input,44,FOLLOW_44_in_dclass337);  
                    stream_44.add(char_literal22);

                    pushFollow(FOLLOW_fields_in_dclass339);
                    fields23=fields();

                    state._fsp--;

                    stream_fields.add(fields23.getTree());
                    char_literal24=(Token)match(input,45,FOLLOW_45_in_dclass341);  
                    stream_45.add(char_literal24);



                    // AST REWRITE
                    // elements: table, table, fields
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 38:3: -> ^( EXTENDS table table fields )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:38:6: ^( EXTENDS table table fields )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(EXTENDS, "EXTENDS"), root_1);

                        adaptor.addChild(root_1, stream_table.nextTree());
                        adaptor.addChild(root_1, stream_table.nextTree());
                        adaptor.addChild(root_1, stream_fields.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "dclass"

    public static class relation_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "relation"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:1: relation : ( 'relation' | 'Relation' ) '(' table ',' table ':' reltype ',' reltype ')' -> ^( RELATION table table reltype reltype ) ;
    public final dreqlParser.relation_return relation() throws RecognitionException {
        dreqlParser.relation_return retval = new dreqlParser.relation_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token string_literal25=null;
        Token string_literal26=null;
        Token char_literal27=null;
        Token char_literal29=null;
        Token char_literal31=null;
        Token char_literal33=null;
        Token char_literal35=null;
        dreqlParser.table_return table28 = null;

        dreqlParser.table_return table30 = null;

        dreqlParser.reltype_return reltype32 = null;

        dreqlParser.reltype_return reltype34 = null;


        Object string_literal25_tree=null;
        Object string_literal26_tree=null;
        Object char_literal27_tree=null;
        Object char_literal29_tree=null;
        Object char_literal31_tree=null;
        Object char_literal33_tree=null;
        Object char_literal35_tree=null;
        RewriteRuleTokenStream stream_52=new RewriteRuleTokenStream(adaptor,"token 52");
        RewriteRuleTokenStream stream_50=new RewriteRuleTokenStream(adaptor,"token 50");
        RewriteRuleTokenStream stream_44=new RewriteRuleTokenStream(adaptor,"token 44");
        RewriteRuleTokenStream stream_53=new RewriteRuleTokenStream(adaptor,"token 53");
        RewriteRuleTokenStream stream_51=new RewriteRuleTokenStream(adaptor,"token 51");
        RewriteRuleTokenStream stream_45=new RewriteRuleTokenStream(adaptor,"token 45");
        RewriteRuleSubtreeStream stream_table=new RewriteRuleSubtreeStream(adaptor,"rule table");
        RewriteRuleSubtreeStream stream_reltype=new RewriteRuleSubtreeStream(adaptor,"rule reltype");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:10: ( ( 'relation' | 'Relation' ) '(' table ',' table ':' reltype ',' reltype ')' -> ^( RELATION table table reltype reltype ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:12: ( 'relation' | 'Relation' ) '(' table ',' table ':' reltype ',' reltype ')'
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:12: ( 'relation' | 'Relation' )
            int alt8=2;
            int LA8_0 = input.LA(1);

            if ( (LA8_0==50) ) {
                alt8=1;
            }
            else if ( (LA8_0==51) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:13: 'relation'
                    {
                    string_literal25=(Token)match(input,50,FOLLOW_50_in_relation366);  
                    stream_50.add(string_literal25);


                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:41:26: 'Relation'
                    {
                    string_literal26=(Token)match(input,51,FOLLOW_51_in_relation370);  
                    stream_51.add(string_literal26);


                    }
                    break;

            }

            char_literal27=(Token)match(input,44,FOLLOW_44_in_relation373);  
            stream_44.add(char_literal27);

            pushFollow(FOLLOW_table_in_relation375);
            table28=table();

            state._fsp--;

            stream_table.add(table28.getTree());
            char_literal29=(Token)match(input,52,FOLLOW_52_in_relation377);  
            stream_52.add(char_literal29);

            pushFollow(FOLLOW_table_in_relation379);
            table30=table();

            state._fsp--;

            stream_table.add(table30.getTree());
            char_literal31=(Token)match(input,53,FOLLOW_53_in_relation381);  
            stream_53.add(char_literal31);

            pushFollow(FOLLOW_reltype_in_relation383);
            reltype32=reltype();

            state._fsp--;

            stream_reltype.add(reltype32.getTree());
            char_literal33=(Token)match(input,52,FOLLOW_52_in_relation385);  
            stream_52.add(char_literal33);

            pushFollow(FOLLOW_reltype_in_relation387);
            reltype34=reltype();

            state._fsp--;

            stream_reltype.add(reltype34.getTree());
            char_literal35=(Token)match(input,45,FOLLOW_45_in_relation389);  
            stream_45.add(char_literal35);



            // AST REWRITE
            // elements: reltype, table, table, reltype
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 42:3: -> ^( RELATION table table reltype reltype )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:42:6: ^( RELATION table table reltype reltype )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELATION, "RELATION"), root_1);

                adaptor.addChild(root_1, stream_table.nextTree());
                adaptor.addChild(root_1, stream_table.nextTree());
                adaptor.addChild(root_1, stream_reltype.nextTree());
                adaptor.addChild(root_1, stream_reltype.nextTree());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "relation"

    public static class renom_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "renom"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:1: renom : ( 'renom' | 'Renom' ) TYPE '=' TYPE -> ^( RENOM TYPE TYPE ) ;
    public final dreqlParser.renom_return renom() throws RecognitionException {
        dreqlParser.renom_return retval = new dreqlParser.renom_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token string_literal36=null;
        Token string_literal37=null;
        Token TYPE38=null;
        Token char_literal39=null;
        Token TYPE40=null;

        Object string_literal36_tree=null;
        Object string_literal37_tree=null;
        Object TYPE38_tree=null;
        Object char_literal39_tree=null;
        Object TYPE40_tree=null;
        RewriteRuleTokenStream stream_54=new RewriteRuleTokenStream(adaptor,"token 54");
        RewriteRuleTokenStream stream_TYPE=new RewriteRuleTokenStream(adaptor,"token TYPE");
        RewriteRuleTokenStream stream_56=new RewriteRuleTokenStream(adaptor,"token 56");
        RewriteRuleTokenStream stream_55=new RewriteRuleTokenStream(adaptor,"token 55");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:7: ( ( 'renom' | 'Renom' ) TYPE '=' TYPE -> ^( RENOM TYPE TYPE ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:9: ( 'renom' | 'Renom' ) TYPE '=' TYPE
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:9: ( 'renom' | 'Renom' )
            int alt9=2;
            int LA9_0 = input.LA(1);

            if ( (LA9_0==54) ) {
                alt9=1;
            }
            else if ( (LA9_0==55) ) {
                alt9=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:10: 'renom'
                    {
                    string_literal36=(Token)match(input,54,FOLLOW_54_in_renom416);  
                    stream_54.add(string_literal36);


                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:45:20: 'Renom'
                    {
                    string_literal37=(Token)match(input,55,FOLLOW_55_in_renom420);  
                    stream_55.add(string_literal37);


                    }
                    break;

            }

            TYPE38=(Token)match(input,TYPE,FOLLOW_TYPE_in_renom423);  
            stream_TYPE.add(TYPE38);

            char_literal39=(Token)match(input,56,FOLLOW_56_in_renom425);  
            stream_56.add(char_literal39);

            TYPE40=(Token)match(input,TYPE,FOLLOW_TYPE_in_renom427);  
            stream_TYPE.add(TYPE40);



            // AST REWRITE
            // elements: TYPE, TYPE
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 46:3: -> ^( RENOM TYPE TYPE )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:46:6: ^( RENOM TYPE TYPE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RENOM, "RENOM"), root_1);

                adaptor.addChild(root_1, stream_TYPE.nextNode());
                adaptor.addChild(root_1, stream_TYPE.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "renom"

    public static class table_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "table"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:49:1: table : TYPE -> ^( TABLE TYPE ) ;
    public final dreqlParser.table_return table() throws RecognitionException {
        dreqlParser.table_return retval = new dreqlParser.table_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token TYPE41=null;

        Object TYPE41_tree=null;
        RewriteRuleTokenStream stream_TYPE=new RewriteRuleTokenStream(adaptor,"token TYPE");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:49:7: ( TYPE -> ^( TABLE TYPE ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:49:9: TYPE
            {
            TYPE41=(Token)match(input,TYPE,FOLLOW_TYPE_in_table449);  
            stream_TYPE.add(TYPE41);



            // AST REWRITE
            // elements: TYPE
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 50:3: -> ^( TABLE TYPE )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:50:6: ^( TABLE TYPE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(TABLE, "TABLE"), root_1);

                adaptor.addChild(root_1, stream_TYPE.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "table"

    public static class fields_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "fields"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:53:1: fields : field ( ',' field )* -> ^( FIELDS ( field )+ ) ;
    public final dreqlParser.fields_return fields() throws RecognitionException {
        dreqlParser.fields_return retval = new dreqlParser.fields_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token char_literal43=null;
        dreqlParser.field_return field42 = null;

        dreqlParser.field_return field44 = null;


        Object char_literal43_tree=null;
        RewriteRuleTokenStream stream_52=new RewriteRuleTokenStream(adaptor,"token 52");
        RewriteRuleSubtreeStream stream_field=new RewriteRuleSubtreeStream(adaptor,"rule field");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:53:8: ( field ( ',' field )* -> ^( FIELDS ( field )+ ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:53:10: field ( ',' field )*
            {
            pushFollow(FOLLOW_field_in_fields469);
            field42=field();

            state._fsp--;

            stream_field.add(field42.getTree());
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:53:16: ( ',' field )*
            loop10:
            do {
                int alt10=2;
                int LA10_0 = input.LA(1);

                if ( (LA10_0==52) ) {
                    alt10=1;
                }


                switch (alt10) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:53:17: ',' field
            	    {
            	    char_literal43=(Token)match(input,52,FOLLOW_52_in_fields472);  
            	    stream_52.add(char_literal43);

            	    pushFollow(FOLLOW_field_in_fields474);
            	    field44=field();

            	    state._fsp--;

            	    stream_field.add(field44.getTree());

            	    }
            	    break;

            	default :
            	    break loop10;
                }
            } while (true);



            // AST REWRITE
            // elements: field
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 54:3: -> ^( FIELDS ( field )+ )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:54:6: ^( FIELDS ( field )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELDS, "FIELDS"), root_1);

                if ( !(stream_field.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_field.hasNext() ) {
                    adaptor.addChild(root_1, stream_field.nextTree());

                }
                stream_field.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "fields"

    public static class field_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "field"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:64:1: field : ( fieldname ':' datatype '[' optional ']' -> ^( FIELD fieldname datatype optional ) | fieldname ':' '[' optional ']' -> ^( FIELD fieldname optional ) | fieldname ':' datatype -> ^( FIELD fieldname datatype ) | fieldname -> ^( FIELD fieldname ) );
    public final dreqlParser.field_return field() throws RecognitionException {
        dreqlParser.field_return retval = new dreqlParser.field_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token char_literal46=null;
        Token char_literal48=null;
        Token char_literal50=null;
        Token char_literal52=null;
        Token char_literal53=null;
        Token char_literal55=null;
        Token char_literal57=null;
        dreqlParser.fieldname_return fieldname45 = null;

        dreqlParser.datatype_return datatype47 = null;

        dreqlParser.optional_return optional49 = null;

        dreqlParser.fieldname_return fieldname51 = null;

        dreqlParser.optional_return optional54 = null;

        dreqlParser.fieldname_return fieldname56 = null;

        dreqlParser.datatype_return datatype58 = null;

        dreqlParser.fieldname_return fieldname59 = null;


        Object char_literal46_tree=null;
        Object char_literal48_tree=null;
        Object char_literal50_tree=null;
        Object char_literal52_tree=null;
        Object char_literal53_tree=null;
        Object char_literal55_tree=null;
        Object char_literal57_tree=null;
        RewriteRuleTokenStream stream_57=new RewriteRuleTokenStream(adaptor,"token 57");
        RewriteRuleTokenStream stream_58=new RewriteRuleTokenStream(adaptor,"token 58");
        RewriteRuleTokenStream stream_53=new RewriteRuleTokenStream(adaptor,"token 53");
        RewriteRuleSubtreeStream stream_fieldname=new RewriteRuleSubtreeStream(adaptor,"rule fieldname");
        RewriteRuleSubtreeStream stream_optional=new RewriteRuleSubtreeStream(adaptor,"rule optional");
        RewriteRuleSubtreeStream stream_datatype=new RewriteRuleSubtreeStream(adaptor,"rule datatype");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:64:7: ( fieldname ':' datatype '[' optional ']' -> ^( FIELD fieldname datatype optional ) | fieldname ':' '[' optional ']' -> ^( FIELD fieldname optional ) | fieldname ':' datatype -> ^( FIELD fieldname datatype ) | fieldname -> ^( FIELD fieldname ) )
            int alt11=4;
            alt11 = dfa11.predict(input);
            switch (alt11) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:64:9: fieldname ':' datatype '[' optional ']'
                    {
                    pushFollow(FOLLOW_fieldname_in_field498);
                    fieldname45=fieldname();

                    state._fsp--;

                    stream_fieldname.add(fieldname45.getTree());
                    char_literal46=(Token)match(input,53,FOLLOW_53_in_field500);  
                    stream_53.add(char_literal46);

                    pushFollow(FOLLOW_datatype_in_field502);
                    datatype47=datatype();

                    state._fsp--;

                    stream_datatype.add(datatype47.getTree());
                    char_literal48=(Token)match(input,57,FOLLOW_57_in_field504);  
                    stream_57.add(char_literal48);

                    pushFollow(FOLLOW_optional_in_field506);
                    optional49=optional();

                    state._fsp--;

                    stream_optional.add(optional49.getTree());
                    char_literal50=(Token)match(input,58,FOLLOW_58_in_field508);  
                    stream_58.add(char_literal50);



                    // AST REWRITE
                    // elements: datatype, fieldname, optional
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 65:3: -> ^( FIELD fieldname datatype optional )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:65:6: ^( FIELD fieldname datatype optional )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELD, "FIELD"), root_1);

                        adaptor.addChild(root_1, stream_fieldname.nextTree());
                        adaptor.addChild(root_1, stream_datatype.nextTree());
                        adaptor.addChild(root_1, stream_optional.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:66:5: fieldname ':' '[' optional ']'
                    {
                    pushFollow(FOLLOW_fieldname_in_field528);
                    fieldname51=fieldname();

                    state._fsp--;

                    stream_fieldname.add(fieldname51.getTree());
                    char_literal52=(Token)match(input,53,FOLLOW_53_in_field530);  
                    stream_53.add(char_literal52);

                    char_literal53=(Token)match(input,57,FOLLOW_57_in_field533);  
                    stream_57.add(char_literal53);

                    pushFollow(FOLLOW_optional_in_field535);
                    optional54=optional();

                    state._fsp--;

                    stream_optional.add(optional54.getTree());
                    char_literal55=(Token)match(input,58,FOLLOW_58_in_field537);  
                    stream_58.add(char_literal55);



                    // AST REWRITE
                    // elements: optional, fieldname
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 67:3: -> ^( FIELD fieldname optional )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:67:6: ^( FIELD fieldname optional )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELD, "FIELD"), root_1);

                        adaptor.addChild(root_1, stream_fieldname.nextTree());
                        adaptor.addChild(root_1, stream_optional.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:68:5: fieldname ':' datatype
                    {
                    pushFollow(FOLLOW_fieldname_in_field555);
                    fieldname56=fieldname();

                    state._fsp--;

                    stream_fieldname.add(fieldname56.getTree());
                    char_literal57=(Token)match(input,53,FOLLOW_53_in_field557);  
                    stream_53.add(char_literal57);

                    pushFollow(FOLLOW_datatype_in_field559);
                    datatype58=datatype();

                    state._fsp--;

                    stream_datatype.add(datatype58.getTree());


                    // AST REWRITE
                    // elements: datatype, fieldname
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 69:3: -> ^( FIELD fieldname datatype )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:69:6: ^( FIELD fieldname datatype )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELD, "FIELD"), root_1);

                        adaptor.addChild(root_1, stream_fieldname.nextTree());
                        adaptor.addChild(root_1, stream_datatype.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 4 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:70:5: fieldname
                    {
                    pushFollow(FOLLOW_fieldname_in_field577);
                    fieldname59=fieldname();

                    state._fsp--;

                    stream_fieldname.add(fieldname59.getTree());


                    // AST REWRITE
                    // elements: fieldname
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 71:3: -> ^( FIELD fieldname )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:71:6: ^( FIELD fieldname )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELD, "FIELD"), root_1);

                        adaptor.addChild(root_1, stream_fieldname.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "field"

    public static class fieldname_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "fieldname"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:74:1: fieldname : TYPE -> ^( FIELDNAME TYPE ) ;
    public final dreqlParser.fieldname_return fieldname() throws RecognitionException {
        dreqlParser.fieldname_return retval = new dreqlParser.fieldname_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token TYPE60=null;

        Object TYPE60_tree=null;
        RewriteRuleTokenStream stream_TYPE=new RewriteRuleTokenStream(adaptor,"token TYPE");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:74:11: ( TYPE -> ^( FIELDNAME TYPE ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:74:13: TYPE
            {
            TYPE60=(Token)match(input,TYPE,FOLLOW_TYPE_in_fieldname597);  
            stream_TYPE.add(TYPE60);



            // AST REWRITE
            // elements: TYPE
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 75:3: -> ^( FIELDNAME TYPE )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:75:6: ^( FIELDNAME TYPE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(FIELDNAME, "FIELDNAME"), root_1);

                adaptor.addChild(root_1, stream_TYPE.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "fieldname"

    public static class optional_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "optional"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:79:1: optional : option ( ',' option )* -> ^( OPTIONAL ( option )+ ) ;
    public final dreqlParser.optional_return optional() throws RecognitionException {
        dreqlParser.optional_return retval = new dreqlParser.optional_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token char_literal62=null;
        dreqlParser.option_return option61 = null;

        dreqlParser.option_return option63 = null;


        Object char_literal62_tree=null;
        RewriteRuleTokenStream stream_52=new RewriteRuleTokenStream(adaptor,"token 52");
        RewriteRuleSubtreeStream stream_option=new RewriteRuleSubtreeStream(adaptor,"rule option");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:79:10: ( option ( ',' option )* -> ^( OPTIONAL ( option )+ ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:79:12: option ( ',' option )*
            {
            pushFollow(FOLLOW_option_in_optional618);
            option61=option();

            state._fsp--;

            stream_option.add(option61.getTree());
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:79:19: ( ',' option )*
            loop12:
            do {
                int alt12=2;
                int LA12_0 = input.LA(1);

                if ( (LA12_0==52) ) {
                    alt12=1;
                }


                switch (alt12) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:79:20: ',' option
            	    {
            	    char_literal62=(Token)match(input,52,FOLLOW_52_in_optional621);  
            	    stream_52.add(char_literal62);

            	    pushFollow(FOLLOW_option_in_optional623);
            	    option63=option();

            	    state._fsp--;

            	    stream_option.add(option63.getTree());

            	    }
            	    break;

            	default :
            	    break loop12;
                }
            } while (true);



            // AST REWRITE
            // elements: option
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 80:3: -> ^( OPTIONAL ( option )+ )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:80:6: ^( OPTIONAL ( option )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTIONAL, "OPTIONAL"), root_1);

                if ( !(stream_option.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_option.hasNext() ) {
                    adaptor.addChild(root_1, stream_option.nextTree());

                }
                stream_option.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "optional"

    public static class datatype_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "datatype"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:82:1: datatype : ( TYPE '(' NUM ')' -> ^( DATATYPE TYPE NUM ) | TYPE -> ^( DATATYPE TYPE ) | ( 'enum' | 'Enum' ) '(' enumopt ')' -> ^( DATATYPE ENUM enumopt ) | set -> ^( DATATYPE set ) );
    public final dreqlParser.datatype_return datatype() throws RecognitionException {
        dreqlParser.datatype_return retval = new dreqlParser.datatype_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token TYPE64=null;
        Token char_literal65=null;
        Token NUM66=null;
        Token char_literal67=null;
        Token TYPE68=null;
        Token string_literal69=null;
        Token string_literal70=null;
        Token char_literal71=null;
        Token char_literal73=null;
        dreqlParser.enumopt_return enumopt72 = null;

        dreqlParser.set_return set74 = null;


        Object TYPE64_tree=null;
        Object char_literal65_tree=null;
        Object NUM66_tree=null;
        Object char_literal67_tree=null;
        Object TYPE68_tree=null;
        Object string_literal69_tree=null;
        Object string_literal70_tree=null;
        Object char_literal71_tree=null;
        Object char_literal73_tree=null;
        RewriteRuleTokenStream stream_TYPE=new RewriteRuleTokenStream(adaptor,"token TYPE");
        RewriteRuleTokenStream stream_59=new RewriteRuleTokenStream(adaptor,"token 59");
        RewriteRuleTokenStream stream_44=new RewriteRuleTokenStream(adaptor,"token 44");
        RewriteRuleTokenStream stream_60=new RewriteRuleTokenStream(adaptor,"token 60");
        RewriteRuleTokenStream stream_NUM=new RewriteRuleTokenStream(adaptor,"token NUM");
        RewriteRuleTokenStream stream_45=new RewriteRuleTokenStream(adaptor,"token 45");
        RewriteRuleSubtreeStream stream_enumopt=new RewriteRuleSubtreeStream(adaptor,"rule enumopt");
        RewriteRuleSubtreeStream stream_set=new RewriteRuleSubtreeStream(adaptor,"rule set");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:82:10: ( TYPE '(' NUM ')' -> ^( DATATYPE TYPE NUM ) | TYPE -> ^( DATATYPE TYPE ) | ( 'enum' | 'Enum' ) '(' enumopt ')' -> ^( DATATYPE ENUM enumopt ) | set -> ^( DATATYPE set ) )
            int alt14=4;
            switch ( input.LA(1) ) {
            case TYPE:
                {
                int LA14_1 = input.LA(2);

                if ( (LA14_1==44) ) {
                    alt14=1;
                }
                else if ( (LA14_1==45||LA14_1==52||LA14_1==57) ) {
                    alt14=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 14, 1, input);

                    throw nvae;
                }
                }
                break;
            case 59:
            case 60:
                {
                alt14=3;
                }
                break;
            case 61:
            case 62:
                {
                alt14=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 14, 0, input);

                throw nvae;
            }

            switch (alt14) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:82:12: TYPE '(' NUM ')'
                    {
                    TYPE64=(Token)match(input,TYPE,FOLLOW_TYPE_in_datatype645);  
                    stream_TYPE.add(TYPE64);

                    char_literal65=(Token)match(input,44,FOLLOW_44_in_datatype647);  
                    stream_44.add(char_literal65);

                    NUM66=(Token)match(input,NUM,FOLLOW_NUM_in_datatype649);  
                    stream_NUM.add(NUM66);

                    char_literal67=(Token)match(input,45,FOLLOW_45_in_datatype651);  
                    stream_45.add(char_literal67);



                    // AST REWRITE
                    // elements: TYPE, NUM
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 83:3: -> ^( DATATYPE TYPE NUM )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:83:6: ^( DATATYPE TYPE NUM )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(DATATYPE, "DATATYPE"), root_1);

                        adaptor.addChild(root_1, stream_TYPE.nextNode());
                        adaptor.addChild(root_1, stream_NUM.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:84:5: TYPE
                    {
                    TYPE68=(Token)match(input,TYPE,FOLLOW_TYPE_in_datatype669);  
                    stream_TYPE.add(TYPE68);



                    // AST REWRITE
                    // elements: TYPE
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 85:3: -> ^( DATATYPE TYPE )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:85:6: ^( DATATYPE TYPE )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(DATATYPE, "DATATYPE"), root_1);

                        adaptor.addChild(root_1, stream_TYPE.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:86:5: ( 'enum' | 'Enum' ) '(' enumopt ')'
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:86:5: ( 'enum' | 'Enum' )
                    int alt13=2;
                    int LA13_0 = input.LA(1);

                    if ( (LA13_0==59) ) {
                        alt13=1;
                    }
                    else if ( (LA13_0==60) ) {
                        alt13=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 13, 0, input);

                        throw nvae;
                    }
                    switch (alt13) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:86:6: 'enum'
                            {
                            string_literal69=(Token)match(input,59,FOLLOW_59_in_datatype686);  
                            stream_59.add(string_literal69);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:86:15: 'Enum'
                            {
                            string_literal70=(Token)match(input,60,FOLLOW_60_in_datatype690);  
                            stream_60.add(string_literal70);


                            }
                            break;

                    }

                    char_literal71=(Token)match(input,44,FOLLOW_44_in_datatype693);  
                    stream_44.add(char_literal71);

                    pushFollow(FOLLOW_enumopt_in_datatype695);
                    enumopt72=enumopt();

                    state._fsp--;

                    stream_enumopt.add(enumopt72.getTree());
                    char_literal73=(Token)match(input,45,FOLLOW_45_in_datatype697);  
                    stream_45.add(char_literal73);



                    // AST REWRITE
                    // elements: enumopt
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 87:3: -> ^( DATATYPE ENUM enumopt )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:87:6: ^( DATATYPE ENUM enumopt )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(DATATYPE, "DATATYPE"), root_1);

                        adaptor.addChild(root_1, (Object)adaptor.create(ENUM, "ENUM"));
                        adaptor.addChild(root_1, stream_enumopt.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 4 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:88:5: set
                    {
                    pushFollow(FOLLOW_set_in_datatype715);
                    set74=set();

                    state._fsp--;

                    stream_set.add(set74.getTree());


                    // AST REWRITE
                    // elements: set
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 89:3: -> ^( DATATYPE set )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:89:6: ^( DATATYPE set )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(DATATYPE, "DATATYPE"), root_1);

                        adaptor.addChild(root_1, stream_set.nextTree());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "datatype"

    public static class set_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "set"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:1: set : ( ( 'set' | 'Set' ) TYPE '(' NUM ')' -> ^( SETTYPE TYPE NUM ) | ( 'set' | 'Set' ) TYPE -> ^( SETTYPE TYPE ) | ( 'set' | 'Set' ) -> ^( SETTYPE SET ) );
    public final dreqlParser.set_return set() throws RecognitionException {
        dreqlParser.set_return retval = new dreqlParser.set_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token string_literal75=null;
        Token string_literal76=null;
        Token TYPE77=null;
        Token char_literal78=null;
        Token NUM79=null;
        Token char_literal80=null;
        Token string_literal81=null;
        Token string_literal82=null;
        Token TYPE83=null;
        Token string_literal84=null;
        Token string_literal85=null;

        Object string_literal75_tree=null;
        Object string_literal76_tree=null;
        Object TYPE77_tree=null;
        Object char_literal78_tree=null;
        Object NUM79_tree=null;
        Object char_literal80_tree=null;
        Object string_literal81_tree=null;
        Object string_literal82_tree=null;
        Object TYPE83_tree=null;
        Object string_literal84_tree=null;
        Object string_literal85_tree=null;
        RewriteRuleTokenStream stream_TYPE=new RewriteRuleTokenStream(adaptor,"token TYPE");
        RewriteRuleTokenStream stream_61=new RewriteRuleTokenStream(adaptor,"token 61");
        RewriteRuleTokenStream stream_44=new RewriteRuleTokenStream(adaptor,"token 44");
        RewriteRuleTokenStream stream_62=new RewriteRuleTokenStream(adaptor,"token 62");
        RewriteRuleTokenStream stream_NUM=new RewriteRuleTokenStream(adaptor,"token NUM");
        RewriteRuleTokenStream stream_45=new RewriteRuleTokenStream(adaptor,"token 45");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:5: ( ( 'set' | 'Set' ) TYPE '(' NUM ')' -> ^( SETTYPE TYPE NUM ) | ( 'set' | 'Set' ) TYPE -> ^( SETTYPE TYPE ) | ( 'set' | 'Set' ) -> ^( SETTYPE SET ) )
            int alt18=3;
            int LA18_0 = input.LA(1);

            if ( (LA18_0==61) ) {
                int LA18_1 = input.LA(2);

                if ( (LA18_1==TYPE) ) {
                    int LA18_3 = input.LA(3);

                    if ( (LA18_3==44) ) {
                        alt18=1;
                    }
                    else if ( (LA18_3==45||LA18_3==52||LA18_3==57) ) {
                        alt18=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 18, 3, input);

                        throw nvae;
                    }
                }
                else if ( (LA18_1==45||LA18_1==52||LA18_1==57) ) {
                    alt18=3;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 18, 1, input);

                    throw nvae;
                }
            }
            else if ( (LA18_0==62) ) {
                int LA18_2 = input.LA(2);

                if ( (LA18_2==TYPE) ) {
                    int LA18_3 = input.LA(3);

                    if ( (LA18_3==44) ) {
                        alt18=1;
                    }
                    else if ( (LA18_3==45||LA18_3==52||LA18_3==57) ) {
                        alt18=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 18, 3, input);

                        throw nvae;
                    }
                }
                else if ( (LA18_2==45||LA18_2==52||LA18_2==57) ) {
                    alt18=3;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 18, 2, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 18, 0, input);

                throw nvae;
            }
            switch (alt18) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:7: ( 'set' | 'Set' ) TYPE '(' NUM ')'
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:7: ( 'set' | 'Set' )
                    int alt15=2;
                    int LA15_0 = input.LA(1);

                    if ( (LA15_0==61) ) {
                        alt15=1;
                    }
                    else if ( (LA15_0==62) ) {
                        alt15=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 15, 0, input);

                        throw nvae;
                    }
                    switch (alt15) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:8: 'set'
                            {
                            string_literal75=(Token)match(input,61,FOLLOW_61_in_set738);  
                            stream_61.add(string_literal75);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:96:16: 'Set'
                            {
                            string_literal76=(Token)match(input,62,FOLLOW_62_in_set742);  
                            stream_62.add(string_literal76);


                            }
                            break;

                    }

                    TYPE77=(Token)match(input,TYPE,FOLLOW_TYPE_in_set745);  
                    stream_TYPE.add(TYPE77);

                    char_literal78=(Token)match(input,44,FOLLOW_44_in_set747);  
                    stream_44.add(char_literal78);

                    NUM79=(Token)match(input,NUM,FOLLOW_NUM_in_set749);  
                    stream_NUM.add(NUM79);

                    char_literal80=(Token)match(input,45,FOLLOW_45_in_set751);  
                    stream_45.add(char_literal80);



                    // AST REWRITE
                    // elements: TYPE, NUM
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 97:3: -> ^( SETTYPE TYPE NUM )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:97:6: ^( SETTYPE TYPE NUM )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(SETTYPE, "SETTYPE"), root_1);

                        adaptor.addChild(root_1, stream_TYPE.nextNode());
                        adaptor.addChild(root_1, stream_NUM.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:98:5: ( 'set' | 'Set' ) TYPE
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:98:5: ( 'set' | 'Set' )
                    int alt16=2;
                    int LA16_0 = input.LA(1);

                    if ( (LA16_0==61) ) {
                        alt16=1;
                    }
                    else if ( (LA16_0==62) ) {
                        alt16=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 16, 0, input);

                        throw nvae;
                    }
                    switch (alt16) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:98:6: 'set'
                            {
                            string_literal81=(Token)match(input,61,FOLLOW_61_in_set770);  
                            stream_61.add(string_literal81);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:98:14: 'Set'
                            {
                            string_literal82=(Token)match(input,62,FOLLOW_62_in_set774);  
                            stream_62.add(string_literal82);


                            }
                            break;

                    }

                    TYPE83=(Token)match(input,TYPE,FOLLOW_TYPE_in_set777);  
                    stream_TYPE.add(TYPE83);



                    // AST REWRITE
                    // elements: TYPE
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 99:3: -> ^( SETTYPE TYPE )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:99:6: ^( SETTYPE TYPE )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(SETTYPE, "SETTYPE"), root_1);

                        adaptor.addChild(root_1, stream_TYPE.nextNode());

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:100:5: ( 'set' | 'Set' )
                    {
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:100:5: ( 'set' | 'Set' )
                    int alt17=2;
                    int LA17_0 = input.LA(1);

                    if ( (LA17_0==61) ) {
                        alt17=1;
                    }
                    else if ( (LA17_0==62) ) {
                        alt17=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 17, 0, input);

                        throw nvae;
                    }
                    switch (alt17) {
                        case 1 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:100:6: 'set'
                            {
                            string_literal84=(Token)match(input,61,FOLLOW_61_in_set794);  
                            stream_61.add(string_literal84);


                            }
                            break;
                        case 2 :
                            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:100:14: 'Set'
                            {
                            string_literal85=(Token)match(input,62,FOLLOW_62_in_set798);  
                            stream_62.add(string_literal85);


                            }
                            break;

                    }



                    // AST REWRITE
                    // elements: 
                    // token labels: 
                    // rule labels: retval
                    // token list labels: 
                    // rule list labels: 
                    // wildcard labels: 
                    retval.tree = root_0;
                    RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                    root_0 = (Object)adaptor.nil();
                    // 101:3: -> ^( SETTYPE SET )
                    {
                        // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:101:6: ^( SETTYPE SET )
                        {
                        Object root_1 = (Object)adaptor.nil();
                        root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(SETTYPE, "SETTYPE"), root_1);

                        adaptor.addChild(root_1, (Object)adaptor.create(SET, "SET"));

                        adaptor.addChild(root_0, root_1);
                        }

                    }

                    retval.tree = root_0;
                    }
                    break;

            }
            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "set"

    public static class enumopt_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "enumopt"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:104:1: enumopt : args ( ',' args )* -> ^( ENUMOPT ( args )+ ) ;
    public final dreqlParser.enumopt_return enumopt() throws RecognitionException {
        dreqlParser.enumopt_return retval = new dreqlParser.enumopt_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token char_literal87=null;
        dreqlParser.args_return args86 = null;

        dreqlParser.args_return args88 = null;


        Object char_literal87_tree=null;
        RewriteRuleTokenStream stream_52=new RewriteRuleTokenStream(adaptor,"token 52");
        RewriteRuleSubtreeStream stream_args=new RewriteRuleSubtreeStream(adaptor,"rule args");
        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:104:9: ( args ( ',' args )* -> ^( ENUMOPT ( args )+ ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:104:11: args ( ',' args )*
            {
            pushFollow(FOLLOW_args_in_enumopt819);
            args86=args();

            state._fsp--;

            stream_args.add(args86.getTree());
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:104:16: ( ',' args )*
            loop19:
            do {
                int alt19=2;
                int LA19_0 = input.LA(1);

                if ( (LA19_0==52) ) {
                    alt19=1;
                }


                switch (alt19) {
            	case 1 :
            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:104:17: ',' args
            	    {
            	    char_literal87=(Token)match(input,52,FOLLOW_52_in_enumopt822);  
            	    stream_52.add(char_literal87);

            	    pushFollow(FOLLOW_args_in_enumopt824);
            	    args88=args();

            	    state._fsp--;

            	    stream_args.add(args88.getTree());

            	    }
            	    break;

            	default :
            	    break loop19;
                }
            } while (true);



            // AST REWRITE
            // elements: args
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 105:3: -> ^( ENUMOPT ( args )+ )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:105:6: ^( ENUMOPT ( args )+ )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(ENUMOPT, "ENUMOPT"), root_1);

                if ( !(stream_args.hasNext()) ) {
                    throw new RewriteEarlyExitException();
                }
                while ( stream_args.hasNext() ) {
                    adaptor.addChild(root_1, stream_args.nextTree());

                }
                stream_args.reset();

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "enumopt"

    public static class args_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "args"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:108:1: args : VAL -> ^( ARGS VAL ) ;
    public final dreqlParser.args_return args() throws RecognitionException {
        dreqlParser.args_return retval = new dreqlParser.args_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token VAL89=null;

        Object VAL89_tree=null;
        RewriteRuleTokenStream stream_VAL=new RewriteRuleTokenStream(adaptor,"token VAL");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:108:6: ( VAL -> ^( ARGS VAL ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:108:8: VAL
            {
            VAL89=(Token)match(input,VAL,FOLLOW_VAL_in_args847);  
            stream_VAL.add(VAL89);



            // AST REWRITE
            // elements: VAL
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 109:3: -> ^( ARGS VAL )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:109:6: ^( ARGS VAL )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(ARGS, "ARGS"), root_1);

                adaptor.addChild(root_1, stream_VAL.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "args"

    public static class option_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "option"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:1: option : (a= 'editable' | b= 'visible' | c= 'optional' | d= 'masked' | e= 'key' | 'autoinc' ) -> {a!=null}? ^( OPTION EDITABLE ) -> {b!=null}? ^( OPTION VISIBLE ) -> {c!=null}? ^( OPTION OPTIONAL ) -> {d!=null}? ^( OPTION MASKED ) -> {e!=null}? ^( OPTION KEY ) -> ^( OPTION AUTOINC ) ;
    public final dreqlParser.option_return option() throws RecognitionException {
        dreqlParser.option_return retval = new dreqlParser.option_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token a=null;
        Token b=null;
        Token c=null;
        Token d=null;
        Token e=null;
        Token string_literal90=null;

        Object a_tree=null;
        Object b_tree=null;
        Object c_tree=null;
        Object d_tree=null;
        Object e_tree=null;
        Object string_literal90_tree=null;
        RewriteRuleTokenStream stream_65=new RewriteRuleTokenStream(adaptor,"token 65");
        RewriteRuleTokenStream stream_63=new RewriteRuleTokenStream(adaptor,"token 63");
        RewriteRuleTokenStream stream_68=new RewriteRuleTokenStream(adaptor,"token 68");
        RewriteRuleTokenStream stream_64=new RewriteRuleTokenStream(adaptor,"token 64");
        RewriteRuleTokenStream stream_66=new RewriteRuleTokenStream(adaptor,"token 66");
        RewriteRuleTokenStream stream_67=new RewriteRuleTokenStream(adaptor,"token 67");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:8: ( (a= 'editable' | b= 'visible' | c= 'optional' | d= 'masked' | e= 'key' | 'autoinc' ) -> {a!=null}? ^( OPTION EDITABLE ) -> {b!=null}? ^( OPTION VISIBLE ) -> {c!=null}? ^( OPTION OPTIONAL ) -> {d!=null}? ^( OPTION MASKED ) -> {e!=null}? ^( OPTION KEY ) -> ^( OPTION AUTOINC ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:10: (a= 'editable' | b= 'visible' | c= 'optional' | d= 'masked' | e= 'key' | 'autoinc' )
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:10: (a= 'editable' | b= 'visible' | c= 'optional' | d= 'masked' | e= 'key' | 'autoinc' )
            int alt20=6;
            switch ( input.LA(1) ) {
            case 63:
                {
                alt20=1;
                }
                break;
            case 64:
                {
                alt20=2;
                }
                break;
            case 65:
                {
                alt20=3;
                }
                break;
            case 66:
                {
                alt20=4;
                }
                break;
            case 67:
                {
                alt20=5;
                }
                break;
            case 68:
                {
                alt20=6;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 20, 0, input);

                throw nvae;
            }

            switch (alt20) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:11: a= 'editable'
                    {
                    a=(Token)match(input,63,FOLLOW_63_in_option870);  
                    stream_63.add(a);


                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:26: b= 'visible'
                    {
                    b=(Token)match(input,64,FOLLOW_64_in_option876);  
                    stream_64.add(b);


                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:40: c= 'optional'
                    {
                    c=(Token)match(input,65,FOLLOW_65_in_option882);  
                    stream_65.add(c);


                    }
                    break;
                case 4 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:55: d= 'masked'
                    {
                    d=(Token)match(input,66,FOLLOW_66_in_option888);  
                    stream_66.add(d);


                    }
                    break;
                case 5 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:68: e= 'key'
                    {
                    e=(Token)match(input,67,FOLLOW_67_in_option894);  
                    stream_67.add(e);


                    }
                    break;
                case 6 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:112:78: 'autoinc'
                    {
                    string_literal90=(Token)match(input,68,FOLLOW_68_in_option898);  
                    stream_68.add(string_literal90);


                    }
                    break;

            }



            // AST REWRITE
            // elements: 
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 113:3: -> {a!=null}? ^( OPTION EDITABLE )
            if (a!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:113:17: ^( OPTION EDITABLE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(EDITABLE, "EDITABLE"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 114:3: -> {b!=null}? ^( OPTION VISIBLE )
            if (b!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:114:17: ^( OPTION VISIBLE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(VISIBLE, "VISIBLE"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 115:3: -> {c!=null}? ^( OPTION OPTIONAL )
            if (c!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:115:17: ^( OPTION OPTIONAL )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(OPTIONAL, "OPTIONAL"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 116:3: -> {d!=null}? ^( OPTION MASKED )
            if (d!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:116:17: ^( OPTION MASKED )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(MASKED, "MASKED"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 117:3: -> {e!=null}? ^( OPTION KEY )
            if (e!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:117:17: ^( OPTION KEY )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(KEY, "KEY"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 118:3: -> ^( OPTION AUTOINC )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:118:6: ^( OPTION AUTOINC )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(OPTION, "OPTION"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(AUTOINC, "AUTOINC"));

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "option"

    public static class reltype_return extends ParserRuleReturnScope {
        Object tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "reltype"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:1: reltype : (a= '1' | b= '0..1' | c= '1..*' | d= '0..*' | e= '*' | f= NUM | NUM '..' NUM ) -> {a!=null}? ^( RELTYPE ONE ) -> {b!=null}? ^( RELTYPE ZEROTOONE ) -> {c!=null}? ^( RELTYPE ONETON ) -> {d!=null}? ^( RELTYPE ZEROTON ) -> {e!=null}? ^( RELTYPE NTOM ) -> {f!=null}? ^( RELTYPE NUM ) -> ^( RELTYPE NUM NUM ) ;
    public final dreqlParser.reltype_return reltype() throws RecognitionException {
        dreqlParser.reltype_return retval = new dreqlParser.reltype_return();
        retval.start = input.LT(1);

        Object root_0 = null;

        Token a=null;
        Token b=null;
        Token c=null;
        Token d=null;
        Token e=null;
        Token f=null;
        Token NUM91=null;
        Token string_literal92=null;
        Token NUM93=null;

        Object a_tree=null;
        Object b_tree=null;
        Object c_tree=null;
        Object d_tree=null;
        Object e_tree=null;
        Object f_tree=null;
        Object NUM91_tree=null;
        Object string_literal92_tree=null;
        Object NUM93_tree=null;
        RewriteRuleTokenStream stream_71=new RewriteRuleTokenStream(adaptor,"token 71");
        RewriteRuleTokenStream stream_74=new RewriteRuleTokenStream(adaptor,"token 74");
        RewriteRuleTokenStream stream_72=new RewriteRuleTokenStream(adaptor,"token 72");
        RewriteRuleTokenStream stream_70=new RewriteRuleTokenStream(adaptor,"token 70");
        RewriteRuleTokenStream stream_69=new RewriteRuleTokenStream(adaptor,"token 69");
        RewriteRuleTokenStream stream_73=new RewriteRuleTokenStream(adaptor,"token 73");
        RewriteRuleTokenStream stream_NUM=new RewriteRuleTokenStream(adaptor,"token NUM");

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:9: ( (a= '1' | b= '0..1' | c= '1..*' | d= '0..*' | e= '*' | f= NUM | NUM '..' NUM ) -> {a!=null}? ^( RELTYPE ONE ) -> {b!=null}? ^( RELTYPE ZEROTOONE ) -> {c!=null}? ^( RELTYPE ONETON ) -> {d!=null}? ^( RELTYPE ZEROTON ) -> {e!=null}? ^( RELTYPE NTOM ) -> {f!=null}? ^( RELTYPE NUM ) -> ^( RELTYPE NUM NUM ) )
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:11: (a= '1' | b= '0..1' | c= '1..*' | d= '0..*' | e= '*' | f= NUM | NUM '..' NUM )
            {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:11: (a= '1' | b= '0..1' | c= '1..*' | d= '0..*' | e= '*' | f= NUM | NUM '..' NUM )
            int alt21=7;
            switch ( input.LA(1) ) {
            case 69:
                {
                alt21=1;
                }
                break;
            case 70:
                {
                alt21=2;
                }
                break;
            case 71:
                {
                alt21=3;
                }
                break;
            case 72:
                {
                alt21=4;
                }
                break;
            case 73:
                {
                alt21=5;
                }
                break;
            case NUM:
                {
                int LA21_6 = input.LA(2);

                if ( (LA21_6==74) ) {
                    alt21=7;
                }
                else if ( (LA21_6==45||LA21_6==52) ) {
                    alt21=6;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 21, 6, input);

                    throw nvae;
                }
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 21, 0, input);

                throw nvae;
            }

            switch (alt21) {
                case 1 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:12: a= '1'
                    {
                    a=(Token)match(input,69,FOLLOW_69_in_reltype982);  
                    stream_69.add(a);


                    }
                    break;
                case 2 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:20: b= '0..1'
                    {
                    b=(Token)match(input,70,FOLLOW_70_in_reltype988);  
                    stream_70.add(b);


                    }
                    break;
                case 3 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:31: c= '1..*'
                    {
                    c=(Token)match(input,71,FOLLOW_71_in_reltype994);  
                    stream_71.add(c);


                    }
                    break;
                case 4 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:42: d= '0..*'
                    {
                    d=(Token)match(input,72,FOLLOW_72_in_reltype1000);  
                    stream_72.add(d);


                    }
                    break;
                case 5 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:53: e= '*'
                    {
                    e=(Token)match(input,73,FOLLOW_73_in_reltype1006);  
                    stream_73.add(e);


                    }
                    break;
                case 6 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:61: f= NUM
                    {
                    f=(Token)match(input,NUM,FOLLOW_NUM_in_reltype1012);  
                    stream_NUM.add(f);


                    }
                    break;
                case 7 :
                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:121:69: NUM '..' NUM
                    {
                    NUM91=(Token)match(input,NUM,FOLLOW_NUM_in_reltype1016);  
                    stream_NUM.add(NUM91);

                    string_literal92=(Token)match(input,74,FOLLOW_74_in_reltype1018);  
                    stream_74.add(string_literal92);

                    NUM93=(Token)match(input,NUM,FOLLOW_NUM_in_reltype1020);  
                    stream_NUM.add(NUM93);


                    }
                    break;

            }



            // AST REWRITE
            // elements: NUM, NUM, NUM
            // token labels: 
            // rule labels: retval
            // token list labels: 
            // rule list labels: 
            // wildcard labels: 
            retval.tree = root_0;
            RewriteRuleSubtreeStream stream_retval=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

            root_0 = (Object)adaptor.nil();
            // 122:3: -> {a!=null}? ^( RELTYPE ONE )
            if (a!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:122:17: ^( RELTYPE ONE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(ONE, "ONE"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 123:3: -> {b!=null}? ^( RELTYPE ZEROTOONE )
            if (b!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:123:17: ^( RELTYPE ZEROTOONE )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(ZEROTOONE, "ZEROTOONE"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 124:3: -> {c!=null}? ^( RELTYPE ONETON )
            if (c!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:124:17: ^( RELTYPE ONETON )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(ONETON, "ONETON"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 125:3: -> {d!=null}? ^( RELTYPE ZEROTON )
            if (d!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:125:17: ^( RELTYPE ZEROTON )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(ZEROTON, "ZEROTON"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 126:3: -> {e!=null}? ^( RELTYPE NTOM )
            if (e!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:126:17: ^( RELTYPE NTOM )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, (Object)adaptor.create(NTOM, "NTOM"));

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 127:3: -> {f!=null}? ^( RELTYPE NUM )
            if (f!=null) {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:127:17: ^( RELTYPE NUM )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, stream_NUM.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }
            else // 128:3: -> ^( RELTYPE NUM NUM )
            {
                // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreql.g:128:6: ^( RELTYPE NUM NUM )
                {
                Object root_1 = (Object)adaptor.nil();
                root_1 = (Object)adaptor.becomeRoot((Object)adaptor.create(RELTYPE, "RELTYPE"), root_1);

                adaptor.addChild(root_1, stream_NUM.nextNode());
                adaptor.addChild(root_1, stream_NUM.nextNode());

                adaptor.addChild(root_0, root_1);
                }

            }

            retval.tree = root_0;
            }

            retval.stop = input.LT(-1);

            retval.tree = (Object)adaptor.rulePostProcessing(root_0);
            adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
    	retval.tree = (Object)adaptor.errorNode(input, retval.start, input.LT(-1), re);

        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "reltype"

    // Delegated rules


    protected DFA11 dfa11 = new DFA11(this);
    static final String DFA11_eotS =
        "\30\uffff";
    static final String DFA11_eofS =
        "\30\uffff";
    static final String DFA11_minS =
        "\1\43\1\55\1\43\2\uffff\3\54\2\43\1\44\2\uffff\1\45\1\54\2\55\1"+
        "\44\1\55\1\45\4\55";
    static final String DFA11_maxS =
        "\1\43\1\65\1\76\2\uffff\1\71\2\54\2\71\1\44\2\uffff\1\45\1\71\1"+
        "\55\1\64\1\44\1\71\1\45\1\71\1\55\1\64\1\71";
    static final String DFA11_acceptS =
        "\3\uffff\1\4\1\2\6\uffff\1\1\1\3\13\uffff";
    static final String DFA11_specialS =
        "\30\uffff}>";
    static final String[] DFA11_transitionS = {
            "\1\1",
            "\1\3\6\uffff\1\3\1\2",
            "\1\5\25\uffff\1\4\1\uffff\1\6\1\7\1\10\1\11",
            "",
            "",
            "\1\12\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\15",
            "\1\15",
            "\1\16\11\uffff\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\16\11\uffff\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\17",
            "",
            "",
            "\1\20",
            "\1\21\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\22",
            "\1\24\6\uffff\1\23",
            "\1\25",
            "\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\26",
            "\1\14\6\uffff\1\14\4\uffff\1\13",
            "\1\27",
            "\1\24\6\uffff\1\23",
            "\1\14\6\uffff\1\14\4\uffff\1\13"
    };

    static final short[] DFA11_eot = DFA.unpackEncodedString(DFA11_eotS);
    static final short[] DFA11_eof = DFA.unpackEncodedString(DFA11_eofS);
    static final char[] DFA11_min = DFA.unpackEncodedStringToUnsignedChars(DFA11_minS);
    static final char[] DFA11_max = DFA.unpackEncodedStringToUnsignedChars(DFA11_maxS);
    static final short[] DFA11_accept = DFA.unpackEncodedString(DFA11_acceptS);
    static final short[] DFA11_special = DFA.unpackEncodedString(DFA11_specialS);
    static final short[][] DFA11_transition;

    static {
        int numStates = DFA11_transitionS.length;
        DFA11_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA11_transition[i] = DFA.unpackEncodedString(DFA11_transitionS[i]);
        }
    }

    class DFA11 extends DFA {

        public DFA11(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 11;
            this.eot = DFA11_eot;
            this.eof = DFA11_eof;
            this.min = DFA11_min;
            this.max = DFA11_max;
            this.accept = DFA11_accept;
            this.special = DFA11_special;
            this.transition = DFA11_transition;
        }
        public String getDescription() {
            return "64:1: field : ( fieldname ':' datatype '[' optional ']' -> ^( FIELD fieldname datatype optional ) | fieldname ':' '[' optional ']' -> ^( FIELD fieldname optional ) | fieldname ':' datatype -> ^( FIELD fieldname datatype ) | fieldname -> ^( FIELD fieldname ) );";
        }
    }
 

    public static final BitSet FOLLOW_commands_in_dreql147 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_command_in_commands168 = new BitSet(new long[]{0x0000020000000000L});
    public static final BitSet FOLLOW_41_in_commands170 = new BitSet(new long[]{0x00CCCC0000000002L});
    public static final BitSet FOLLOW_dclass_in_command196 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_relation_in_command202 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_renom_in_command208 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_42_in_dclass254 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_43_in_dclass258 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_dclass261 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_dclass263 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_fields_in_dclass265 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_dclass267 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_46_in_dclass286 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_47_in_dclass290 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_dclass293 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_dclass295 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_fields_in_dclass297 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_dclass299 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_42_in_dclass318 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_43_in_dclass322 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_dclass325 = new BitSet(new long[]{0x0003000000000000L});
    public static final BitSet FOLLOW_48_in_dclass328 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_49_in_dclass332 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_dclass335 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_dclass337 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_fields_in_dclass339 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_dclass341 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_50_in_relation366 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_51_in_relation370 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_relation373 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_relation375 = new BitSet(new long[]{0x0010000000000000L});
    public static final BitSet FOLLOW_52_in_relation377 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_table_in_relation379 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_53_in_relation381 = new BitSet(new long[]{0x0000001000000000L,0x00000000000003E0L});
    public static final BitSet FOLLOW_reltype_in_relation383 = new BitSet(new long[]{0x0010000000000000L});
    public static final BitSet FOLLOW_52_in_relation385 = new BitSet(new long[]{0x0000001000000000L,0x00000000000003E0L});
    public static final BitSet FOLLOW_reltype_in_relation387 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_relation389 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_54_in_renom416 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_55_in_renom420 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_TYPE_in_renom423 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_56_in_renom425 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_TYPE_in_renom427 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TYPE_in_table449 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_field_in_fields469 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_52_in_fields472 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_field_in_fields474 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_fieldname_in_field498 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_53_in_field500 = new BitSet(new long[]{0x7800000800000000L});
    public static final BitSet FOLLOW_datatype_in_field502 = new BitSet(new long[]{0x0200000000000000L});
    public static final BitSet FOLLOW_57_in_field504 = new BitSet(new long[]{0x8000000000000000L,0x000000000000001FL});
    public static final BitSet FOLLOW_optional_in_field506 = new BitSet(new long[]{0x0400000000000000L});
    public static final BitSet FOLLOW_58_in_field508 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_fieldname_in_field528 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_53_in_field530 = new BitSet(new long[]{0x0200000000000000L});
    public static final BitSet FOLLOW_57_in_field533 = new BitSet(new long[]{0x8000000000000000L,0x000000000000001FL});
    public static final BitSet FOLLOW_optional_in_field535 = new BitSet(new long[]{0x0400000000000000L});
    public static final BitSet FOLLOW_58_in_field537 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_fieldname_in_field555 = new BitSet(new long[]{0x0020000000000000L});
    public static final BitSet FOLLOW_53_in_field557 = new BitSet(new long[]{0x7800000800000000L});
    public static final BitSet FOLLOW_datatype_in_field559 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_fieldname_in_field577 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TYPE_in_fieldname597 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_option_in_optional618 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_52_in_optional621 = new BitSet(new long[]{0x8000000000000000L,0x000000000000001FL});
    public static final BitSet FOLLOW_option_in_optional623 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_TYPE_in_datatype645 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_datatype647 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_datatype649 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_datatype651 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TYPE_in_datatype669 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_59_in_datatype686 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_60_in_datatype690 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_datatype693 = new BitSet(new long[]{0x0000002000000000L});
    public static final BitSet FOLLOW_enumopt_in_datatype695 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_datatype697 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_datatype715 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_61_in_set738 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_62_in_set742 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_TYPE_in_set745 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_set747 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_set749 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_set751 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_61_in_set770 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_62_in_set774 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_TYPE_in_set777 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_61_in_set794 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_62_in_set798 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_args_in_enumopt819 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_52_in_enumopt822 = new BitSet(new long[]{0x0000002000000000L});
    public static final BitSet FOLLOW_args_in_enumopt824 = new BitSet(new long[]{0x0010000000000002L});
    public static final BitSet FOLLOW_VAL_in_args847 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_63_in_option870 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_64_in_option876 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_65_in_option882 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_66_in_option888 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_67_in_option894 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_68_in_option898 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_69_in_reltype982 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_70_in_reltype988 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_71_in_reltype994 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_72_in_reltype1000 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_73_in_reltype1006 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUM_in_reltype1012 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUM_in_reltype1016 = new BitSet(new long[]{0x0000000000000000L,0x0000000000000400L});
    public static final BitSet FOLLOW_74_in_reltype1018 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_reltype1020 = new BitSet(new long[]{0x0000000000000002L});

}