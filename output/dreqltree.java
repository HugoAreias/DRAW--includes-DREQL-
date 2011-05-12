// $ANTLR 3.1.2 /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g 2009-07-10 05:05:52

   import java.util.HashMap;
   import java.util.ArrayList;
   import java.io.FileWriter;
   import java.io.IOException;


import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
public class dreqltree extends DebugTreeParser {
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

    public static final String[] ruleNames = new String[] {
        "invalidRule", "fields", "optional", "fieldname", "enumopt", "dclass", 
        "args", "reltype", "commands", "table", "command", "datatype", "field", 
        "dreql", "renom", "option", "set", "relation"
    };
     
        public int ruleLevel = 0;
        public int getRuleLevel() { return ruleLevel; }
        public void incRuleLevel() { ruleLevel++; }
        public void decRuleLevel() { ruleLevel--; }
        public dreqltree(TreeNodeStream input) {
            this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
        }
        public dreqltree(TreeNodeStream input, int port, RecognizerSharedState state) {
            super(input, state);
            DebugEventSocketProxy proxy =
                new DebugEventSocketProxy(this, port, input.getTreeAdaptor());
            setDebugListener(proxy);
            try {
                proxy.handshake();
            }
            catch (IOException ioe) {
                reportError(ioe);
            }
        }
    public dreqltree(TreeNodeStream input, DebugEventListener dbg) {
        super(input, dbg, new RecognizerSharedState());

    }
    protected boolean evalPredicate(boolean result, String predicate) {
        dbg.semanticPredicate(result, predicate);
        return result;
    }


    public String[] getTokenNames() { return dreqltree.tokenNames; }
    public String getGrammarFileName() { return "/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g"; }


    public class ObjPair<KeyType,ElemType> extends Object {
      
      private KeyType first = null;
      private ElemType second = null;
        
      /**
       * ObjPair Constructors
       */
      public ObjPair(KeyType first, ElemType second) {
        this.first = first;
        this.second = second;
      }

      /**
       *  Get and set methods
       */
      public KeyType getFirst() { return this.first; }
      public void setFirst(KeyType first) { this.first = first; }
      
      public ElemType getSecond() { return this.second; }
      public void setSecond(ElemType second) { this.second = second; }
        
      /**
       *  Equals method
       */
      public boolean equals(Object obj) {
        if(obj.getClass() == this.getClass()) {
          ObjPair<KeyType,ElemType> o = (ObjPair<KeyType,ElemType>) obj;
          return this.getFirst().equals(o.getFirst()) && this.getSecond().equals(o.getSecond());
        }
        else return false;
      }
    }

       //ClassContent definition
       public class ClassContent extends Object{
          private ArrayList<Fields> fields = null;
          private ArrayList<String> keys = null;
          private boolean isabstract = false;
          private String isextended = null;
          
          public ClassContent() {
             this.fields = new ArrayList<Fields>();
          }
          
          public ClassContent(ArrayList<Fields> fields, ArrayList<String> keys, boolean abs, String ext) {
             this.setFields(fields);
             this.setKeys(keys);
             this.isabstract = abs;
             this.isextended = ext;
          }
          
          public ArrayList<Fields> getFields() { return this.fields; }
          public ArrayList<String> getKeys() { return this.keys; }
          public boolean getIsAbstract() { return this.isabstract; }
          public String getExtends() { return this.isextended; }
          
          public void setFields(ArrayList<Fields> fields) { this.fields = new ArrayList<Fields>(fields); }
          public void setKeys(ArrayList<String> keys) { this.keys = new ArrayList<String>(keys); }
          public void setIsAbstract(boolean flag) { this.isabstract = flag; }
          public void setExtends(String ext) { this.isextended = ext; }
          
          public String toString() {
             StringBuffer str = new StringBuffer();
             for(Fields field : this.fields) {
                str.append(field.toString());
             }
             return str.toString();
          }
       }
       //end of ClassContent definition
       
       //TableContent definition
       public class TableContent extends Object{
          private ArrayList<Fields> fields = null;
          private ArrayList<String> primkeys = null;
          private ArrayList<ObjPair<String,String>> fgnkeys = null;
          
          public TableContent() {
             this.fields = new ArrayList<Fields>();
             this.primkeys = new ArrayList<String>();
             this.fgnkeys = new ArrayList<ObjPair<String,String>>();
          }
          
          public TableContent(ArrayList<Fields> fields, ArrayList<String> primkeys, ArrayList<ObjPair<String,String>> fgnkeys) {
             this.setFields(fields);
             this.setPrimKeys(primkeys);
             this.setFgnKeys(fgnkeys);
          }
          
          public ArrayList<Fields> getFields() { return this.fields; }
          public ArrayList<String> getPrimKeys() { return this.primkeys; }
          public ArrayList<ObjPair<String,String>> getFgnKeys() { return this.fgnkeys; }
          
          public void setFields(ArrayList<Fields> fields) { this.fields = new ArrayList<Fields>(fields); }
          public void setPrimKeys(ArrayList<String> keys) { this.primkeys = new ArrayList<String>(keys); }
          public void setFgnKeys(ArrayList<ObjPair<String,String>> keys) { this.fgnkeys = new ArrayList<ObjPair<String,String>>(keys); }
          
          public String toString() {
             StringBuffer str = new StringBuffer();
             for(Fields field : this.fields) {
                str.append(field.toString());
             }
             for(String key : this.primkeys) {
                str.append("PrimKey: " + key + "\n");
             }
             for(ObjPair<String,String> obj : this.fgnkeys) {
                str.append("FgnKey: (" + obj.getFirst() + "," + obj.getSecond() + ")\n");
             }
             return str.toString();
          }
       }
       //end of TableContent definition
       
       //Fields definition
       public class Fields extends Object {
          private String name = null;
          private String datatype = null;
          private String size = null;
          private ArrayList<String> options = null;
          
          public Fields() {
          }
          
          public Fields(String name, String datatype, String size, ArrayList<String> options) {
             this.setName(name);
             this.setDatatype(datatype);
             this.setSize(size);
             if(options != null)
                this.setOptions(options);
          }
          
          public String getName() { return this.name; }
          public String getDatatype() { return this.datatype; }
          public String getSize() { return this.size; }
          public ArrayList<String> getOptions() { return this.options; }
          
          public void setName(String name) { this.name = name; }
          public void setDatatype(String datatype) { this.datatype = datatype; }
          public void setSize(String size) { this.size = size; }
          public void setOptions(ArrayList<String> options) { this.options = new ArrayList<String>(options); }
          
          public String toString() {
             StringBuffer str = new StringBuffer();
             str.append("Field: " + this.name + "; ");
             str.append("Type: " + this.datatype + "; ");
             str.append("Size: " + this.size + "; ");
             if(this.options != null) {
                str.append("Options: ");
                for(String option : this.options) {
                   str.append(option + ", ");
                }
                str.append(";");
             }
             str.append("\n");
             return str.toString();
          }
       }
       //end of Fields definition
       //Relation definition
       public class Relation extends Object {
          private String table = null;
          private String from = null;
          private String to = null;
          
          public Relation() {
          }
          
          public Relation(String name, String from, String to) {
             this.table = name;
             this.from = from;
             this.to = to;
          }

          public String getTable() { return this.table; }
          public String getFrom() { return this.from; }
          public String getTo() { return this.to; }

          public void setTable(String name) { this.table = name; }
          public void setFrom(String from) { this.from = from; }
          public void setTo(String to) { this.to = to; }
          
          public String toString() {
             StringBuffer str = new StringBuffer();
             str.append("Table: " + this.table + "; ");
             str.append("with: " + this.from + " to " + this.to + "\n");
             return str.toString();
          }
       }
       //end of Relation definition
       
       public void searchSet(String table, HashMap<String,ClassContent> classes, HashMap<String,ArrayList<String>> primkeys, HashMap<String,ArrayList<ObjPair<String,String>>> fgnkeys) {
          ClassContent cont = classes.get(table);
          ArrayList<Fields> fields = cont.getFields();
          ArrayList<String> keys  = cont.getKeys();
          for(Fields field : fields) {
             String data = field.getDatatype().substring(0,3);
             if(data.matches("set")) {
                ArrayList<String> newprimkeys = new ArrayList<String>();
                ArrayList<ObjPair<String,String>> newfgnkeys = new ArrayList<ObjPair<String,String>>();
                newprimkeys.add(field.getName());
                for(String key : keys) {
                   newprimkeys.add(key);
                   newfgnkeys.add(new ObjPair<String,String>(key,table));
                }//end for
                String newname = table + "_" + field.getName();
                primkeys.put(newname,newprimkeys);
                fgnkeys.put(newname,newfgnkeys);
             }//end if
          }
       }

       
       //Gerar o SQL
       public HashMap<String,TableContent> generateSQL(HashMap<String,ClassContent> classes, HashMap<String,ArrayList<Relation>> relations) {
          HashMap<String,TableContent> tablescont = new HashMap<String,TableContent>();
          //Criar a tabela
          for(String create : classes.keySet()) {
             ClassContent cont = classes.get(create);
             if(cont.getIsAbstract() == false) {
                TableContent tbcontent = createCode(classes, create);
                ArrayList<String> primkeys = new ArrayList<String>();
                //Criar as chaves primarias
                ArrayList<String> keys = cont.getKeys();
                primkeys.addAll(keys);
                tablescont = setTables(classes,create,keys,tablescont);
                if(relations.containsKey(create)) {
                   ArrayList<ObjPair<String,String>> fgnkeys = new ArrayList<ObjPair<String,String>>();
                   ArrayList<Relation> rellist = relations.get(create);
                   for(Relation rel : rellist) {
                      String from = rel.getFrom();
                      String to = rel.getTo();
                      String tablename = rel.getTable();
                      if((from.matches("ZeroToN") || from.matches("OneToN") || from.matches("N")) && (to.matches("ZeroToN") || to.matches("OneToN") || to.matches("N"))) {
                         tablescont = createNewTable(classes,create,tablename,tablescont);
                      }//end if
                      else {
                         if(classes.containsKey(tablename)) {
                            ArrayList<String> relkeys = classes.get(tablename).getKeys();
                            ArrayList<Fields> relfields = classes.get(tablename).getFields();
                            
                            for(String key : relkeys) {
                               Fields relfield = searchField(relfields,key);
                               tbcontent.setFields(fieldCode(relfield,tbcontent.getFields()));
                               if(keys.size() == 0) {
                                  primkeys.add(key);
                               }//end if
                               fgnkeys.add(new ObjPair<String,String>(key,tablename));
                            }//end for
                         }//end if
                         else System.out.println("ERROR: Class " + tablename + " not defined!!!\n");
                      }//end else
                   }//end for
                   tbcontent.setFgnKeys(fgnkeys);
                }//end if
                tbcontent.setPrimKeys(primkeys);
                tablescont.put(create,tbcontent);
             }//end if
          }//end for
          return tablescont;
       }//end method
       
       //Procuras tipos de dados set
       public HashMap<String,TableContent> setTables(HashMap<String,ClassContent> classes, String create, ArrayList<String> keys, HashMap<String,TableContent> tablescont) {
          ClassContent cont = classes.get(create);
          ArrayList<Fields> fields = cont.getFields();
          for(Fields field : fields) {
             String data = field.getDatatype().substring(0,3);
             if(data.matches("set")) {
                String newtable =  create + "_" + field.getName();
                ArrayList<Fields> newfields = new ArrayList<Fields>();
                ArrayList<String> newprimkeys = new ArrayList<String>();
                ArrayList<ObjPair<String,String>> newfgnkeys = new ArrayList<ObjPair<String,String>>();
                newfields = fieldCodeSet(field,newfields);
                newprimkeys.add(field.getName());
                newprimkeys.addAll(keys);
                for(String key : keys) {
                   Fields keyfield = searchField(fields,key);
                   newfields = fieldCode(keyfield,newfields);
                   newfgnkeys.add(new ObjPair(key,create));
                }//end for
                TableContent tbcontent = new TableContent();
                tbcontent.setFields(newfields);
                tbcontent.setPrimKeys(newprimkeys);
                tbcontent.setFgnKeys(newfgnkeys);
                tablescont.put(newtable,tbcontent);
             }//end if
          }//end for
          return tablescont;
       }
       
       //Create code
       public TableContent createCode(HashMap<String,ClassContent> classes, String create) {
          TableContent tbcontent = new TableContent();
          ArrayList<Fields> tablefields = new ArrayList<Fields>();
          ClassContent cont = classes.get(create);
          ArrayList<Fields> fields = cont.getFields();
          for(Fields field : fields) {
             tablefields = fieldCode(field,tablefields);
          }
          if(cont.getExtends() != null) {
             String abstable = cont.getExtends();
             if(classes.containsKey(abstable)) {
                fields = classes.get(abstable).getFields();
                for(Fields field : fields) {
                   tablefields = fieldCode(field,tablefields);
                }
             }
             else System.out.println("ERROR: Abstract class " + abstable + " is not defined!!!\n");
          }
          tbcontent.setFields(tablefields);
          return tbcontent;
       }   
       
       //Cria o codigo para os campos
       public ArrayList<Fields> fieldCode(Fields field, ArrayList<Fields> tablefields) {
          String data = field.getDatatype().substring(0,3);
          if(!data.matches("set")) {
             tablefields.add(field);
          }//end if
          return tablefields;
       }
       
       //Cria o codigo para os campos mesmo para os set
       public ArrayList<Fields> fieldCodeSet(Fields field, ArrayList<Fields> tablefields) {
          String data = field.getDatatype().substring(0,3);
          if(!data.matches("set"))
             tablefields.add(field);
          else {
             field.setDatatype(field.getDatatype().substring(4));
             tablefields.add(field);
          }
          return tablefields;
       }


       public HashMap<String,TableContent> createNewTable(HashMap<String,ClassContent> classes, String table, String tablename, HashMap<String,TableContent> tablescont) {
          String newtable = table + "_" + tablename;
          ClassContent cont = classes.get(table);
          ClassContent cont2 = classes.get(tablename);
          ArrayList<String> keys = cont.getKeys();
          ArrayList<String> keys2 = cont2.getKeys();
          ArrayList<Fields> newfields = new ArrayList<Fields>();
          ArrayList<String> newprimkeys = new ArrayList<String>();
          ArrayList<ObjPair<String,String>> newfgnkeys = new ArrayList<ObjPair<String,String>>();
          
          newprimkeys.addAll(keys);
          newprimkeys.addAll(keys2);
          for(String key : keys) {
             Fields field = searchField(cont.getFields(), key);
             newfields = fieldCode(field,newfields);
             newfgnkeys.add(new ObjPair<String,String>(key,table));
          }
          for(String key : keys2) {
             Fields field = searchField(cont2.getFields(), key);
             newfields = fieldCode(field,newfields);
             newfgnkeys.add(new ObjPair<String,String>(key,tablename));
          }
          TableContent tbcontent = new TableContent();
          tbcontent.setFields(newfields);
          tbcontent.setPrimKeys(newprimkeys);
          tbcontent.setFgnKeys(newfgnkeys);
          tablescont.put(newtable,tbcontent);
          return tablescont;
       }

       //Procura a informacao das chaves
       public Fields searchField(ArrayList<Fields> fields, String key) {
          for(Fields field : fields) {
             if(key.matches(field.getName()))
                return field;
          }
          return null;
       }
       
       //Imprime o codigo para ficheiro
       public void printFile(String buffer) {
          try {
             FileWriter handle = new FileWriter("/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/database.sql");
             handle.write(buffer);
             handle.close();
          } catch(IOException e) {
             System.out.println(e.getMessage());
          }
       }
      
      //Imprime os codigo sql para os creates
      public void printSqlCode(HashMap<String,TableContent> tablescont) {
         StringBuffer str = new StringBuffer();
         for(String table : tablescont.keySet()) {
            TableContent cont = tablescont.get(table);
            str.append("create table " + table + " (\n");
            for(Fields field : cont.getFields()) {
               str.append(fieldSQLCode(field));
            }
            str.append("\tprimary key (");
            for(String key : cont.getPrimKeys()) {
               str.append(key + ", ");
            }
            str = new StringBuffer(str.substring(0,str.length()-2));
            str.append("),\n");
            for(ObjPair<String,String> obj : cont.getFgnKeys()) {
               str.append("\tforeign key (" + obj.getFirst() + ") references " + obj.getSecond() + "(" + obj.getFirst() + "),\n");
            }//end for
            str = new StringBuffer(str.substring(0,str.length()-2));
            str.append("\n\t);\n");
         }
         printFile(str.toString());
       }
       
       //Cria o codigo para os campos
       public String fieldSQLCode(Fields field) {
          StringBuffer str = new StringBuffer();
          String data = field.getDatatype().substring(0,3);
          if(!data.matches("set")) {
             str.append("\t" + field.getName() + " " + field.getDatatype());
             if(null != field.getSize()) {
                str.append("(" + field.getSize() + ")");
             }
             //Adicionar as opcoes
             if(null != field.getOptions()) {
                ArrayList<String> options = field.getOptions();
                for(String opt : options) {
                   if(opt.matches("Editable")) {}
                      //str.append(" READONLY");
                   else if(opt.matches("Visible"))
                      str.append(" VISIBLE");
                   else if(opt.matches("Optional"))
                      str.append(" NOT NULL");
                   else if(opt.matches("Masked"))
                      str.append(" MASKED");
                   else if(opt.matches("AutoInc")) {}
                      //str.append(" AUTOINCREMENT");
                   else if(opt.matches("Key"))
                      str.append(" NOT NULL");
                }//end for
                str.append(",\n");
             }//end if
             else {
                //Se nao temos opcoes entao definimos cm sendo opcional
                str.append(" NULL,\n");
             }//end else
          }//end if
          return str.toString();
       }

       //Verifica as renomeacoes
       public void changeRenomType(HashMap<String,String> renom, HashMap<String,ClassContent> classes) {
          for(String key : classes.keySet()) {
             ClassContent cont = classes.get(key);
             ArrayList<Fields> fields = cont.getFields();
             for(Fields field : fields) {
                String type = field.getDatatype();
                for(String ren : renom.keySet()) {
                   if(type.matches(ren)) {
                      String realtype = renom.get(ren);
                      field.setDatatype(realtype);
                   }
                }
             }
          }
       }
       
        //Gera o codigo para as funcoes em perl
       public void generatePerl(HashMap<String,TableContent> tablescont) {
          StringBuffer str = new StringBuffer();
          str.append("use DBI;\nuse Tie::IxHash;\nuse Switch;\nuse base 'Exporter';\n\nour @EXPORT = (");
          for(String table : tablescont.keySet()) {
             str.append("'insert_" + table + "', 'delete_" + table + "', 'update_" + table + "', 'select_" + table + "', ");
          }
          str = new StringBuffer(str.substring(0,str.length()-2));
          str.append(");\n\nour " + ((char) 36) + "VERSION = '0.01';\n\n");
          str.append("our " + ((char) 36) + "db;\ntie " + ((char) 37) +"{" + ((char) 36) + "db}, 'Tie::IxHash';\n");
          for(String tablename : tablescont.keySet()) {
             TableContent table = tablescont.get(tablename);
             str.append("\ntie " + ((char) 37) + "{" + ((char) 36) + "db->{" + tablename + "}}, 'Tie::IxHash';\n");
             str.append("tie " + ((char) 37) + "{" + ((char) 36) + "db->{" + tablename + "}->{'fields'}}, 'Tie::IxHash';\n");
             str.append(((char) 37) + "{" + ((char) 36) + "db->{" + tablename + "}->{'fields'}} = (\n");
             for(Fields field : table.getFields()) {
                str.append("\t" + "'" + field.getName() + "'" + " => {\n" + "\t\ttype => " + "'" + field.getDatatype() + "',\n" + "\t\tsize => " + "'" + field.getSize() + "',\n");
                if(field.getOptions() != null) {
                   str.append("\t\toptions => [ ");
                   for(String opt : field.getOptions()) {
                      str.append("'" + opt + "', ");
                   }
                   str = new StringBuffer(str.substring(0,str.length()-2));
                   str.append(" ]\n");
                }
                str.append("\t},\n");
             }
             str = new StringBuffer(str.substring(0,str.length()-2));
             str.append("\n);\n" + ((char) 36) + "db->{" + tablename + "}->{'primkeys'} = {\n");
             for(String pkey : table.getPrimKeys()) {
                str.append("\t" + pkey + " => undef,\n");
             }
             str.append("};\n" + ((char) 36) + "db->{" + tablename + "}->{'fgnkeys'} = {\n");
             for(ObjPair<String,String> fgnkey : table.getFgnKeys()) {
                str.append("\t" + fgnkey.getFirst() + " => '" + fgnkey.getSecond() + "',\n");
             }
             str.append("};\n");
          }
          str = generateQueries(str, tablescont);
          printPerlFile(str.toString());
       }
       
       /**
        * Codigo para gerar as varias funcoes em perl
        */
       
       public StringBuffer insertFunction(String tablename, StringBuffer str) {
          str.append("\n# Preloaded methods go here.\n\n=head2 insert_" + tablename + "\n\nINSERT\n\n=cut\n\nsub insert_" + tablename + " {\n\tmy @fields = @_;");
          str.append("\n\tmy @tfield = keys " + ((char)37) + "{" + ((char)36) + "db->{" + tablename + "}->{'fields'}};\n\tmy " + ((char)36) + "diff = scalar(@tfield) - scalar(@fields);");
          str.append("\n\n\tif ( " + ((char)36) + "diff < 0 ) { " + ((char)36) + "@ = \"Invalid number of fields submitted!\"; return undef }\n\tmy " + ((char)36) + "i = 0;\n\tmy @newfld;");
          str.append("\n\tmy " + ((char)36) + "dbh = DBI->connect(\"dbi:SQLite:dbname=[DATABASE_PATH]\",\"[DB_USERNAME]\",\"[DB_PASSWORD]\",");
          str.append("{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die " + ((char)36) + "DBI::errstr;");
          str.append("\n\tforeach ( @tfield ) {\n\t\tmy " + ((char)36) + "miss=0;\n\t\tswitch ( " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'type'} ) {");
          str.append("\n\t\t\tcase /\\bvarchar\\b/i {\n\t\t\t\t");
          str.append("if ( uc(" + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'size'}) ne 'NULL' && length(" + ((char)36) + "fields[" + ((char)36)
          	+ "i]) > " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'size'} ) {");
          str.append("\n\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "@ = \"Varchar too large, " + ((char)36) + "_ field can only have " + ((char)36)
          	+ "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'size'} characters!\";");
          str.append("\n\t\t\t\t\treturn undef\n\t\t\t\t}\n\t\t\t}");
          str.append("\n\t\t\tcase /\\binteger\\b/i { if ( " + ((char)36) + "fields[" + ((char)36) + "i] !~ /^\\d+" + ((char)36) + "/ ) { " + ((char)36) + "dbh->disconnect or warn "
          	+ ((char)36) + "dbh->errstr; " + ((char)36) + "@ = \"Invalid type found, " + ((char)36) + "_ field is of type INTEGER!\"; return undef } }");
          str.append("\n\t\t\tcase /\\breal\\b/i { if ( " + ((char)36) + "fields[" + ((char)36) + "i] !~ /^\\d+(\\.\\d+)?" + ((char)36) + "/ ) { " + ((char)36)
          	+ "dbh->disconnect or warn " + ((char)36) + "dbh->errstr; " + ((char)36) + "@ = \"Invalid type found, " + ((char)36) + "_ field is of type REAL!\"; return undef } }");
          str.append("\n\t\t\telse {}\n\t\t}");
          str.append("\n\t\tOPT: foreach my " + ((char)36) + "opt ( @{" + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'options'}} ) {");
          str.append("\n\t\t\tswitch (" + ((char)36) + "opt) {\n\t\t\t\tcase /\\beditable\\b/i       { next }\n\t\t\t\tcase /\\bvisible\\b/i        { next }");
          str.append("\n\t\t\t\tcase /\\bnull\\b/i           { next }\n\t\t\t\tcase /\\bmasked\\b/i         { next }\n\t\t\t\tcase /\\bauto_increment\\b/i {");
          str.append("\n\t\t\t\t\tif ( 0 == " + ((char)36) + "diff ) {\n\t\t\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM "
          	+ tablename + " WHERE " + ((char)36) + "_='" + ((char)36) + "fields[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\t\t\tif ( exists " + ((char)36) + "rv->{" + ((char)36) + "fields[" + ((char)36) + "i]} ) {");
          str.append("\n\t\t\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\t\t" + ((char)36) + "@ = \"" + ((char)36) + "_ is an Auto increment field, " + ((char)36) + "fields[" + ((char)36) + "i] value already found on the "
          	+ tablename + " table!\";");
          str.append("\n\t\t\t\t\t\t\treturn undef\n\t\t\t\t\t\t}\n\t\t\t\t\t\telse { next }\n\t\t\t\t\t}\n\t\t\t\t\telse { " + ((char)36) + "miss=1; last OPT }\n\t\t\t\t}\n\t\t\t\tcase /\\boptional\\b/i       {");
          str.append("\n\t\t\t\t\tif ( uc(" + ((char)36) + "fields[" + ((char)36) + "i]) eq 'NULL' ) { " + ((char)36) + "dbh->disconnect or warn " + ((char)36)
          	+ "dbh->errstr; " + ((char)36) + "@ = \"" + ((char)36) + "_ cannot be a null value!\"; return undef }");
          str.append("\n\t\t\t\t\telse { next }\n\t\t\t\t}\n\t\t\t\tcase /\\bunique\\b/i         {");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "_='" + ((char)36) + "fields[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\t\tif ( exists " + ((char)36) + "rv->{" + ((char)36) + "fields[" + ((char)36) + "i]} ) {");
          str.append("\n\t\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\t" + ((char)36) + "@ = \"" + ((char)36) + "_ must have an Unique value, " + ((char)36) + "fields[" + ((char)36) + "i] value already found on the "
          	+ tablename + " table!\";");
          str.append("\n\t\t\t\t\t\treturn undef\n\t\t\t\t\t}\n\t\t\t\t\telse { next }\n\t\t\t\t}\n\t\t\t\telse { next }\n\t\t\t}\n\t\t}");
          str.append("\n\t\tif ( 1 == " + ((char)36) + "miss ) { " + ((char)36) + "diff-- }\n\t\telse {");
    	  str.append("\n\t\t\tif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} && exists " + ((char)36) + "db->{" + tablename + "}->{'primkeys'}->{" + ((char)36) + "_} ) {}");
          str.append("\n\t\t\telsif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} ) {");
          str.append("\n\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{"
          	+ ((char)36) + "_} WHERE " + ((char)36) + "_='" + ((char)36) + "fields[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\tif ( !exists " + ((char)36) + "rv->{" + ((char)36) + "fields[" + ((char)36) + "i]} ) {");
          str.append("\n\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "@ = \"Foreign key " + ((char)36) + "_ cannot be added because '" + ((char)36) + "fields[" + ((char)36)
          	+ "i]' key does not exist on the " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} table!\";");
          str.append("\n\t\t\t\t\treturn undef\n\t\t\t\t}\n\t\t\t}");
    	  str.append("\n\t\t\tif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} && exists " + ((char)36) + "db->{" + tablename + "}->{'primkeys'}->{" + ((char)36) + "_} ) {}");
          str.append("\n\t\t\telsif ( exists " + ((char)36) + "db->{" + tablename +"}->{'primkeys'}->{" + ((char)36) + "_} ) {");
          str.append("\n\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename +" WHERE " + ((char)36) + "_='" + ((char)36) + "fields[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\tif ( exists " + ((char)36) + "rv->{" + ((char)36) + "fields[" + ((char)36) + "i]} ) {");
          str.append("\n\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "@ = \"Primary key " + ((char)36) + "_ cannot be added because '" + ((char)36) + "fields[" + ((char)36)
          	+ "i]' key already exists on the " + tablename + " table!\";");
          str.append("\n\t\t\t\t\treturn undef\n\t\t\t\t}\n\t\t\t}\n\t\t\t" + ((char)36) + "i++;\n\t\t\tpush @newfld, " + ((char)36) + "_\n\t\t}\n\t}");
          str.append("\n\tif ( " + ((char)36) + "diff != 0 ) { " + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr; " + ((char)36)
          	+ "@ = \"Invalid number of fields submitted!\"; return undef }");
          str.append("\n\tmy " + ((char)36) + "sql = 'INSERT INTO " + tablename + "('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';");
          str.append("\n\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\tmy " + ((char)36) + "res=" + ((char)36) + "sth->execute(@fields) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t" + ((char)36) + "dbh->commit;\n\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;\n\treturn " + ((char)36) + "res;\n}\n");
          return str;
       }
       
       public StringBuffer selectFunction(String tablename, StringBuffer str) {
          str.append("\n# Preloaded methods go here.\n\n=head2 select_" + tablename + "\n\nSELECT\n\n=cut\n\n");
          str.append("sub select_" + tablename + " {\n\tmy (" + ((char)36) + "condition, @fields) = @_;\n\n\t");
          str.append("my " + ((char)36) + "dbh = DBI->connect(\"dbi:SQLite:dbname=[DATABASE_PATH]\",\"[DB_USERNAME]\",\"[DB_PASSWORD]\"");
          str.append(",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die " + ((char)36) +"DBI::errstr;");
          str.append("\n\tforeach (@fields) {\n\t\tif ( !exists " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_} ) {");
          str.append("\n\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;\n\t\t\t" + ((char)36) + "@ = \"Unknown field '" + ((char)36)
          	+ "_' found while selecting data from " + tablename + " table!\";\n\t\t\treturn undef");
          str.append("\n\t\t}\n\t\telse { next }\n\t}\n\tmy " + ((char)36) + "sql;");
          str.append("\n\tif ( 'undef' eq " + ((char)36) + "condition ) { " + ((char)36) + "sql = 'SELECT '.(join ',',@fields).\" FROM " + tablename + "\" }");
          str.append("\n\telse { " + ((char)36) + "sql = 'SELECT '.(join ',',@fields).\" FROM " + tablename + " WHERE " + ((char)36) + "condition\" }\n\n");
          str.append("\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "fields[0]);");
          str.append("\n\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;\n\treturn " + ((char)36) + "rv;\n}\n");
          return str;
       }
       
       public StringBuffer deleteFunction(String tablename, StringBuffer str) {
          str.append("\n# Preloaded methods go here.\n\n=head2 delete_" + tablename + "\n\nDELETE\n\n=cut\n\nsub delete_"+tablename+" {\n\tmy " + ((char)36) + "condition = shift;");
          str.append("\n\tmy " + ((char)36) + "i=1;");
          str.append("\n\tmy " + ((char)36) + "dbh = DBI->connect(\"dbi:SQLite:dbname=[DATABASE_PATH]\",\"[DB_USERNAME]\",\"[DB_PASSWORD]\","
          	+ "{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die " + ((char)36) + "DBI::errstr;");
          str.append("\n\n\tforeach ( keys " + ((char)37) + "{" + ((char)36) + "db->{" + tablename + "}->{'primkeys'}} ) {");
          str.append("\n\t\tforeach my " + ((char)36) + "tb ( keys " + ((char)37) + "{" + ((char)36) + "db} ) {");
          str.append("\n\t\t\tif ( exists " + ((char)36) + "db->{" + ((char)36) + "tb}->{'fgnkeys'}->{" + ((char)36) + "_} ) {\n\t\t\t\tmy " + ((char)36) + "notnull = 0;");
          str.append("\n\t\t\t\tforeach my " + ((char)36) + "opt ( @{" + ((char)36) + "db->{" + ((char)36) + "tb}->{'fields'}->{" + ((char)36) + "_}->{'options'}} ) {");
          str.append("\n\t\t\t\t\tif ( " + ((char)36) + "opt =~ /\\boptional\\b/i ) { " + ((char)36) + "notnull = 1; last }\n\t\t\t\t\telse { next }\n\t\t\t\t}");
          str.append("\n\t\t\t\tunless ( 1 == " + ((char)36) + "notnull ) {");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sql;");
          str.append("\n\t\t\t\t\tif ( 'undef' eq " + ((char)36) + "condition ) { " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + "\" }");
          str.append("\n\t\t\t\t\telse { " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "condition\" }");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\t\tforeach my " + ((char)36) + "key ( keys " + ((char)37) + "{" + ((char)36) + "rv} ) {");
          str.append("\n\t\t\t\t\t\tmy " + ((char)36) + "sql = \"UPDATE " + ((char)36) + "tb SET " + ((char)36) + "_=? WHERE " + ((char)36) + "_='" + ((char)36) + "key'\";");
          str.append("\n\t\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\tmy " + ((char)36) + "str = 'NULL'." + ((char)36) + "i++;");
          str.append("\n\t\t\t\t\t\t"+((char)36)+"sth->execute("+((char)36)+"str) or "+((char)36)+"@ = " +((char)36)+ "dbh->errstr;\n\t\t\t\t\t}\n\t\t\t\t\t" +((char)36)+ "dbh->commit\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t}");
          str.append("\n\tmy " + ((char)36) + "sql;\n\tif ( 'undef' eq " + ((char)36) + "condition ) { " + ((char)36) + "sql = \"DELETE FROM " + tablename + "\" }");
          str.append("\n\telse { " + ((char)36) + "sql = \"DELETE FROM " + tablename + " WHERE " + ((char)36) + "condition\" }");
          str.append("\n\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\tmy " + ((char)36) + "res=" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t" + ((char)36) + "dbh->commit;\n\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;\n\treturn " + ((char)36) + "res;\n}\n");
          return str;
       }
       
       public StringBuffer updateFunction(String tablename, StringBuffer str) {
          str.append("\n# Preloaded methods go here.\n\n=head2 update_" + tablename + "\n\nUPDATE\n\n=cut\n\nsub update_" + tablename + " {");
          str.append("\n\tmy (" + ((char)36) + "set, " + ((char)36) + "condition) = @_;\n\tmy @fields;\n\tmy @values;");
          str.append("\n\n\twhile (" + ((char)36) + "set =~ /\\b(\\w+)\\s*=\\s*['\"](.*?)['\"]/g) { push @fields," + ((char)36) + "1; push @values," + ((char)36) + "2 }");
          str.append("\n\tif ( scalar(@fields) != scalar(@values) ) { " + ((char)36) + "@ = \"Invalid assignment in the set statement!\"; return undef }");
          str.append("\n\tmy " + ((char)36) + "i = 0;\n\tmy " + ((char)36) + "fgn;");
          str.append("\n\tmy " + ((char)36) + "dbh = DBI->connect(\"dbi:SQLite:dbname=[DATABASE_PATH]\",\"[DB_USERNAME]\",\"[DB_PASSWORD]\", "
          	+ "{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die " + ((char)36) + "DBI::errstr;");
          str.append("\n\n\tforeach ( @fields ) {\n\t\tswitch ( " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'type'} ) {\n\t\t\tcase /\\bvarchar\\b/i {");
          str.append("\n\t\t\t\tif ( uc(" + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'size'}) ne 'NULL' && length(" + ((char)36) + "values["
          	+ ((char)36) + "i]) > " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'size'} ) {");
          str.append("\n\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "@ = \"Varchar too large, " + ((char)36) + "_ field can only have " + ((char)36) + "db->{" + tablename + "}->{'fields'}->{"
          	+ ((char)36) + "_}->{'size'} characters!\";");
          str.append("\n\t\t\t\t\treturn undef\n\t\t\t\t}\n\t\t\t}\n\t\t\tcase /\\binteger\\b/i { if ( " + ((char)36) + "values[" + ((char)36) + "i] !~ /^\\d+" + ((char)36) + "/ ) { " + ((char)36));
          str.append("dbh->disconnect or warn " + ((char)36) + "dbh->errstr; " + ((char)36) + "@ = \"Invalid type found, " + ((char)36) + "_ field is of type INTEGER!\"; return undef } }");
          str.append("\n\t\t\tcase /\\breal\\b/i { if ( " + ((char)36) + "values[" + ((char)36) + "i] !~ /^\\d+(\\.\\d+)?" + ((char)36) + "/ ) { " + ((char)36) + "dbh->disconnect or warn " + ((char)36)
          	+ "dbh->errstr; " + ((char)36) + "@ = \"Invalid type found, " + ((char)36) + "_ field is of type REAL!\"; return undef } }");
          str.append("\n\t\t\telse {}\n\t\t}\n\t\tOPT: foreach my " + ((char)36) + "opt ( @{" + ((char)36) + "db->{" + tablename + "}->{'fields'}->{" + ((char)36) + "_}->{'options'}} ) {");
          str.append("\n\t\t\tswitch (" + ((char)36) + "opt) {\n\t\t\t\tcase /\\beditable\\b/i       { " + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr; " + ((char)36)
          	+ "@ = \"" + ((char)36) + "_ is not an editable field!\"; return undef }");
          str.append("\n\t\t\t\tcase /\\bvisible\\b/i        { next }\n\t\t\t\tcase /\\bnull\\b/i           { next }\n\t\t\t\tcase /\\bmasked\\b/i         { next }\n\t\t\t\tcase /\\bauto_increment\\b/i {");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "_='" + ((char)36) + "values[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\tmy " +((char)36)+ "rv = " +((char)36)+ "sth->fetchall_hashref(" +((char)36)+ "_);\n\t\t\t\t\tif ( exists " +((char)36)+ "rv->{" +((char)36)+ "values[" +((char)36)+ "i]} ) {");
          str.append("\n\t\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\t" +((char)36)+ "@ = \"" +((char)36)+ "_ is an Auto increment field, " +((char)36)+ "values[" +((char)36)+ "i] value already found on the " + tablename +" table!\";");
          str.append("\n\t\t\t\t\t\treturn undef\n\t\t\t\t\t}\n\t\t\t\t\telse { next }\n\t\t\t\t}\n\t\t\t\tcase /\\boptional\\b/i       {");
          str.append("\n\t\t\t\t\tif ( uc(" + ((char)36) + "values[" + ((char)36) + "i]) eq 'NULL' ) { " + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr; " + ((char)36)
          	+ "@ = \"" + ((char)36) + "_ cannot be a null value!\"; return undef }");
          str.append("\n\t\t\t\t\telse { next }\n\t\t\t\t}\n\t\t\t\tcase /\\bunique\\b/i         {");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "_='" + ((char)36) + "values[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t"+((char)36)+"sth->execute or "+((char)36)+"@ = "+((char)36)+"dbh->errstr;\n\t\t\t\t\tmy "+((char)36)+"rv = "+((char)36)+"sth->fetchall_hashref("+((char)36)+"_);");
          str.append("\n\t\t\t\t\tif ( exists " + ((char)36) + "rv->{" + ((char)36) + "values[" + ((char)36) + "i]} ) {\n\t\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t\t"+((char)36)+"@ = \""+((char)36)+"_ must have an Unique value, "+((char)36)+"values["+((char)36)+"i] value already found on the " + tablename + " table!\";");
          str.append("\n\t\t\t\t\t\treturn undef\n\t\t\t\t\t}\n\t\t\t\t\telse { next }\n\t\t\t\t}\n\t\t\t\telse { next }\n\t\t\t}\n\t\t}");
          str.append("\n\t\tif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} && exists " + ((char)36) + "db->{" + tablename + "}->{'primkeys'}->{" + ((char)36) + "_} ) {}");
          str.append("\n\t\telsif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} ) {");
          str.append("\n\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "condition\";");
          str.append("\n\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\tforeach my " + ((char)36) + "key ( keys " + ((char)37) + "{" + ((char)36) + "rv} ) {");
          str.append("\n\t\t\t\t" + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} WHERE "
          	+ ((char)36) + "_='" + ((char)36) + "key'\";");
          str.append("\n\t\t\t\t" + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t"+((char)36)+"sth->execute or "+((char)36)+"@ = "+((char)36)+"dbh->errstr;\n\t\t\t\t" + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\t\t\tif ( !exists " + ((char)36) + "rv->{" + ((char)36) + "values[" + ((char)36) + "i]} ) {\n\t\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t\t" + ((char)36) + "@ = \"Foreign key " + ((char)36) + "_ cannot be updated because '" + ((char)36) + "values[" + ((char)36) + "i]' key does not exist on the "
          	+ ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} table!\";");
          str.append("\n\t\t\t\t\treturn undef\n\t\t\t\t}\n\t\t\t\telse { next }\n\t\t\t}\n\t\t}");
    	  str.append("\n\t\tif ( exists " + ((char)36) + "db->{" + tablename + "}->{'fgnkeys'}->{" + ((char)36) + "_} && exists " + ((char)36) + "db->{" + tablename + "}->{'primkeys'}->{" + ((char)36) + "_} ) {}");
          str.append("\n\t\telsif ( exists " + ((char)36) + "db->{" + tablename + "}->{'primkeys'}->{" + ((char)36) + "_} ) {");
          str.append("\n\t\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "_='" + ((char)36) + "values[" + ((char)36) + "i]'\";");
          str.append("\n\t\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t" +((char)36)+ "sth->execute or " +((char)36)+ "@ = " +((char)36)+ "dbh->errstr;\n\t\t\tmy " +((char)36)+ "rv = " +((char)36)+ "sth->fetchall_hashref(" +((char)36)+ "_);");
          str.append("\n\t\t\tif ( exists " + ((char)36) + "rv->{" + ((char)36) + "values[" + ((char)36) + "i]} ) {\n\t\t\t\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t\t" + ((char)36) + "@ = \"Primary key " + ((char)36) + "_ cannot be updated because '" + ((char)36) + "values[" + ((char)36)
          	+ "i]' key already exists on the " + tablename + " table!\";");
          str.append("\n\t\t\t\treturn undef\n\t\t\t}\n\t\t\telse {\n\t\t\t\tforeach my " + ((char)36) + "tb ( keys " + ((char)37) + "{" + ((char)36) + "db} ) {");
          str.append("\n\t\t\t\t\tif ( exists " + ((char)36) + "db->{" + ((char)36) + "tb}->{'fgnkeys'}->{" + ((char)36) + "_} ) {\n\t\t\t\t\t\t" + ((char)36) + "fgn->{" + ((char)36) + "_} = {");
          str.append("\n\t\t\t\t\t\t\tvalue => "+((char)36)+"values["+((char)36)+"i],\n\t\t\t\t\t\t\ttable => "+((char)36)+"tb\n\t\t\t\t\t\t};\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t\t"+((char)36)+"i++;\n\t}");
          str.append("\n\tforeach ( keys " + ((char)37) + "{" + ((char)36) + "fgn} ) {");
          str.append("\n\t\tmy " + ((char)36) + "sql = \"SELECT " + ((char)36) + "_ FROM " + tablename + " WHERE " + ((char)36) + "condition\";");
          str.append("\n\t\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t" +((char)36)+ "sth->execute or " +((char)36)+ "@ = " +((char)36)+ "dbh->errstr;\n\t\tmy " + ((char)36) + "rv = " + ((char)36) + "sth->fetchall_hashref(" + ((char)36) + "_);");
          str.append("\n\t\tforeach my " + ((char)36) + "key ( keys " + ((char)37) + "{" + ((char)36) + "rv} ) {");
          str.append("\n\t\t\t" + ((char)36) + "sql = \"UPDATE " + ((char)36) + "fgn->{" + ((char)36) + "_}->{'table'} SET " + ((char)36) + "_=? WHERE " + ((char)36) + "_='" + ((char)36) + "key'\";");
          str.append("\n\t\t\t" + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t\t" + ((char)36) + "sth->execute(" + ((char)36) + "fgn->{" + ((char)36) + "_}->{'value'}) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t\t}\n\t\t" + ((char)36) + "dbh->commit\n\t}");
          str.append("\n\tmy " + ((char)36) + "sql = \"UPDATE " + tablename + " SET " + ((char)36) + "set WHERE " + ((char)36) + "condition\";");
          str.append("\n\tmy " + ((char)36) + "sth = " + ((char)36) + "dbh->prepare(" + ((char)36) + "sql) or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\tmy " + ((char)36) + "res=" + ((char)36) + "sth->execute or " + ((char)36) + "@ = " + ((char)36) + "dbh->errstr;");
          str.append("\n\t" + ((char)36) + "dbh->commit;\n\t" + ((char)36) + "dbh->disconnect or warn " + ((char)36) + "dbh->errstr;\n\treturn " + ((char)36) + "res;\n}\n");
          return str;
       }
       
       //gera as queries sql em perl
       public StringBuffer generateQueries(StringBuffer str, HashMap<String,TableContent> tablescont) {
          for(String tablename : tablescont.keySet()) {
             str = selectFunction(tablename,str);
             str = insertFunction(tablename,str);
             str = deleteFunction(tablename,str);
             str = updateFunction(tablename,str);
          }
          return str;
       }
       
       //Imprime o codigo para ficheiro
       public void printPerlFile(String buffer) {
          try {
             FileWriter handle = new FileWriter("/Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/sqlqueries.pl");
             handle.write(buffer);
             handle.close();
          } catch(IOException e) {
             System.out.println(e.getMessage());
          }
       }


    public static class dreql_return extends TreeRuleReturnScope {
        public HashMap<String,ClassContent> classes_out;
        public HashMap<String,ArrayList<Relation>> relations_out;
        public HashMap<String,String> renom_out;
    };

    // $ANTLR start "dreql"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:753:1: dreql returns [HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out] : ^( DREQL commands[classes_in,relations_in,renom_in] ) ;
    public final dreqltree.dreql_return dreql() throws RecognitionException {
        dreqltree.dreql_return retval = new dreqltree.dreql_return();
        retval.start = input.LT(1);

        dreqltree.commands_return commands1 = null;



        	HashMap<String,ClassContent> classes_in = new HashMap<String,ClassContent>();
        	HashMap<String,ArrayList<Relation>> relations_in = new HashMap<String,ArrayList<Relation>>();
        	HashMap<String,String> renom_in = new HashMap<String,String>();

        try { dbg.enterRule(getGrammarFileName(), "dreql");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(753, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:760:2: ( ^( DREQL commands[classes_in,relations_in,renom_in] ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:760:4: ^( DREQL commands[classes_in,relations_in,renom_in] )
            {
            dbg.location(760,4);
            dbg.location(760,6);
            match(input,DREQL,FOLLOW_DREQL_in_dreql54); 

            match(input, Token.DOWN, null); 
            dbg.location(760,12);
            pushFollow(FOLLOW_commands_in_dreql56);
            commands1=commands(classes_in, relations_in, renom_in);

            state._fsp--;


            match(input, Token.UP, null); 
            dbg.location(760,56);

            			retval.classes_out = (commands1!=null?commands1.classes_out:null);
            			retval.relations_out = (commands1!=null?commands1.relations_out:null);
            			retval.renom_out = (commands1!=null?commands1.renom_out:null);

            			changeRenomType(retval.renom_out, retval.classes_out);
            			HashMap<String,TableContent> tablescont = generateSQL(retval.classes_out, retval.relations_out);
            /*			for(String table : tablescont.keySet()) {
            			   System.out.println("Table: " + table);
            			   System.out.println(tablescont.get(table).toString());
            			}*/
            			printSqlCode(tablescont);
            			generatePerl(tablescont);
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(774, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "dreql");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "dreql"

    public static class commands_return extends TreeRuleReturnScope {
        public HashMap<String,ClassContent> classes_out;
        public HashMap<String,ArrayList<Relation>> relations_out;
        public HashMap<String,String> renom_out;
    };

    // $ANTLR start "commands"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:776:1: commands[HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in] returns [HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out] : ^( COMMANDS ( command[classes_in,relations_in,renom_in] )+ ) ;
    public final dreqltree.commands_return commands(HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in) throws RecognitionException {
        dreqltree.commands_return retval = new dreqltree.commands_return();
        retval.start = input.LT(1);

        dreqltree.command_return command2 = null;


        try { dbg.enterRule(getGrammarFileName(), "commands");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(776, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:778:2: ( ^( COMMANDS ( command[classes_in,relations_in,renom_in] )+ ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:778:4: ^( COMMANDS ( command[classes_in,relations_in,renom_in] )+ )
            {
            dbg.location(778,4);
            dbg.location(778,6);
            match(input,COMMANDS,FOLLOW_COMMANDS_in_commands76); 

            match(input, Token.DOWN, null); 
            dbg.location(778,15);
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:778:15: ( command[classes_in,relations_in,renom_in] )+
            int cnt1=0;
            try { dbg.enterSubRule(1);

            loop1:
            do {
                int alt1=2;
                try { dbg.enterDecision(1);

                int LA1_0 = input.LA(1);

                if ( (LA1_0==COMMAND) ) {
                    alt1=1;
                }


                } finally {dbg.exitDecision(1);}

                switch (alt1) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:778:16: command[classes_in,relations_in,renom_in]
            	    {
            	    dbg.location(778,16);
            	    pushFollow(FOLLOW_command_in_commands79);
            	    command2=command(classes_in, relations_in, renom_in);

            	    state._fsp--;

            	    dbg.location(778,58);

            	    			classes_in = (command2!=null?command2.classes_out:null);
            	    			relations_in = (command2!=null?command2.relations_out:null);
            	    			renom_in = (command2!=null?command2.renom_out:null);
            	    		

            	    }
            	    break;

            	default :
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt1++;
            } while (true);
            } finally {dbg.exitSubRule(1);}


            match(input, Token.UP, null); 
            dbg.location(782,8);

            			retval.classes_out = (command2!=null?command2.classes_out:null);
            			retval.relations_out = (command2!=null?command2.relations_out:null);
            			retval.renom_out = (command2!=null?command2.renom_out:null);
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(787, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "commands");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "commands"

    public static class command_return extends TreeRuleReturnScope {
        public HashMap<String,ClassContent> classes_out;
        public HashMap<String,ArrayList<Relation>> relations_out;
        public HashMap<String,String> renom_out;
    };

    // $ANTLR start "command"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:789:1: command[HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in] returns [HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out] : ( ^( COMMAND dclass[classes_in] ) | ^( COMMAND relation[relations_in] ) | ^( COMMAND renom[renom_in] ) );
    public final dreqltree.command_return command(HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in) throws RecognitionException {
        dreqltree.command_return retval = new dreqltree.command_return();
        retval.start = input.LT(1);

        HashMap<String,ClassContent> dclass3 = null;

        HashMap<String,ArrayList<Relation>> relation4 = null;

        HashMap<String,String> renom5 = null;


        try { dbg.enterRule(getGrammarFileName(), "command");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(789, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:791:2: ( ^( COMMAND dclass[classes_in] ) | ^( COMMAND relation[relations_in] ) | ^( COMMAND renom[renom_in] ) )
            int alt2=3;
            try { dbg.enterDecision(2);

            int LA2_0 = input.LA(1);

            if ( (LA2_0==COMMAND) ) {
                int LA2_1 = input.LA(2);

                if ( (LA2_1==DOWN) ) {
                    switch ( input.LA(3) ) {
                    case CLASS:
                    case ABSTRACT:
                    case EXTENDS:
                        {
                        alt2=1;
                        }
                        break;
                    case RENOM:
                        {
                        alt2=3;
                        }
                        break;
                    case RELATION:
                        {
                        alt2=2;
                        }
                        break;
                    default:
                        NoViableAltException nvae =
                            new NoViableAltException("", 2, 2, input);

                        dbg.recognitionException(nvae);
                        throw nvae;
                    }

                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 2, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(2);}

            switch (alt2) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:791:4: ^( COMMAND dclass[classes_in] )
                    {
                    dbg.location(791,4);
                    dbg.location(791,6);
                    match(input,COMMAND,FOLLOW_COMMAND_in_command103); 

                    match(input, Token.DOWN, null); 
                    dbg.location(791,14);
                    pushFollow(FOLLOW_dclass_in_command105);
                    dclass3=dclass(classes_in);

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(791,34);
                     retval.classes_out = dclass3; retval.relations_out = relations_in; retval.renom_out = renom_in; 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:792:5: ^( COMMAND relation[relations_in] )
                    {
                    dbg.location(792,5);
                    dbg.location(792,7);
                    match(input,COMMAND,FOLLOW_COMMAND_in_command116); 

                    match(input, Token.DOWN, null); 
                    dbg.location(792,15);
                    pushFollow(FOLLOW_relation_in_command118);
                    relation4=relation(relations_in);

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(792,39);
                     retval.classes_out = classes_in; retval.relations_out = relation4; retval.renom_out = renom_in; 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:793:5: ^( COMMAND renom[renom_in] )
                    {
                    dbg.location(793,5);
                    dbg.location(793,7);
                    match(input,COMMAND,FOLLOW_COMMAND_in_command129); 

                    match(input, Token.DOWN, null); 
                    dbg.location(793,15);
                    pushFollow(FOLLOW_renom_in_command131);
                    renom5=renom(renom_in);

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(793,32);
                     retval.classes_out = classes_in; retval.relations_out = relations_in; retval.renom_out = renom5; 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(794, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "command");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "command"


    // $ANTLR start "dclass"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:796:1: dclass[HashMap<String,ClassContent> classes_in] returns [HashMap<String,ClassContent> classes_out] : ( ^( CLASS table fields ) | ^( ABSTRACT table fields ) | ^( EXTENDS a= table b= table fields ) );
    public final HashMap<String,ClassContent> dclass(HashMap<String,ClassContent> classes_in) throws RecognitionException {
        HashMap<String,ClassContent> classes_out = null;

        String a = null;

        String b = null;

        String table6 = null;

        dreqltree.fields_return fields7 = null;

        String table8 = null;

        dreqltree.fields_return fields9 = null;

        dreqltree.fields_return fields10 = null;


        try { dbg.enterRule(getGrammarFileName(), "dclass");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(796, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:798:2: ( ^( CLASS table fields ) | ^( ABSTRACT table fields ) | ^( EXTENDS a= table b= table fields ) )
            int alt3=3;
            try { dbg.enterDecision(3);

            switch ( input.LA(1) ) {
            case CLASS:
                {
                alt3=1;
                }
                break;
            case ABSTRACT:
                {
                alt3=2;
                }
                break;
            case EXTENDS:
                {
                alt3=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }

            } finally {dbg.exitDecision(3);}

            switch (alt3) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:798:4: ^( CLASS table fields )
                    {
                    dbg.location(798,4);
                    dbg.location(798,6);
                    match(input,CLASS,FOLLOW_CLASS_in_dclass151); 

                    match(input, Token.DOWN, null); 
                    dbg.location(798,12);
                    pushFollow(FOLLOW_table_in_dclass153);
                    table6=table();

                    state._fsp--;

                    dbg.location(798,18);
                    pushFollow(FOLLOW_fields_in_dclass155);
                    fields7=fields();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(798,26);

                    			if(!classes_in.containsKey(table6)) {
                    				classes_in.put(table6,new ClassContent((fields7!=null?fields7.fields_out:null), (fields7!=null?fields7.keys_out:null),false,null));
                    			}
                    			else System.out.println("ERROR: Table " + table6 + " already defined!!!");
                    			classes_out = classes_in;
                    		

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:805:5: ^( ABSTRACT table fields )
                    {
                    dbg.location(805,5);
                    dbg.location(805,7);
                    match(input,ABSTRACT,FOLLOW_ABSTRACT_in_dclass165); 

                    match(input, Token.DOWN, null); 
                    dbg.location(805,16);
                    pushFollow(FOLLOW_table_in_dclass167);
                    table8=table();

                    state._fsp--;

                    dbg.location(805,22);
                    pushFollow(FOLLOW_fields_in_dclass169);
                    fields9=fields();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(805,30);

                    			if(!classes_in.containsKey(table8)) {
                    				classes_in.put(table8,new ClassContent((fields9!=null?fields9.fields_out:null), (fields9!=null?fields9.keys_out:null),true,null));
                    			}
                    			else System.out.println("ERROR: Table " + table8 + " already defined!!!");
                    			classes_out = classes_in;
                    		

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:812:5: ^( EXTENDS a= table b= table fields )
                    {
                    dbg.location(812,5);
                    dbg.location(812,7);
                    match(input,EXTENDS,FOLLOW_EXTENDS_in_dclass179); 

                    match(input, Token.DOWN, null); 
                    dbg.location(812,16);
                    pushFollow(FOLLOW_table_in_dclass183);
                    a=table();

                    state._fsp--;

                    dbg.location(812,24);
                    pushFollow(FOLLOW_table_in_dclass187);
                    b=table();

                    state._fsp--;

                    dbg.location(812,31);
                    pushFollow(FOLLOW_fields_in_dclass189);
                    fields10=fields();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(812,39);

                    			if(!classes_in.containsKey(a)) {
                    				classes_in.put(a,new ClassContent((fields10!=null?fields10.fields_out:null), (fields10!=null?fields10.keys_out:null),false,b));
                    			}
                    			else System.out.println("ERROR: Table " + a + " already defined!!!");
                    			classes_out = classes_in;
                    		

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(819, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "dclass");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return classes_out;
    }
    // $ANTLR end "dclass"


    // $ANTLR start "relation"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:821:1: relation[HashMap<String,ArrayList<Relation>> relations_in] returns [HashMap<String,ArrayList<Relation>> relations_out] : ^( RELATION a= table b= table c= reltype d= reltype ) ;
    public final HashMap<String,ArrayList<Relation>> relation(HashMap<String,ArrayList<Relation>> relations_in) throws RecognitionException {
        HashMap<String,ArrayList<Relation>> relations_out = null;

        String a = null;

        String b = null;

        String c = null;

        String d = null;


        try { dbg.enterRule(getGrammarFileName(), "relation");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(821, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:823:2: ( ^( RELATION a= table b= table c= reltype d= reltype ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:823:4: ^( RELATION a= table b= table c= reltype d= reltype )
            {
            dbg.location(823,4);
            dbg.location(823,6);
            match(input,RELATION,FOLLOW_RELATION_in_relation208); 

            match(input, Token.DOWN, null); 
            dbg.location(823,16);
            pushFollow(FOLLOW_table_in_relation212);
            a=table();

            state._fsp--;

            dbg.location(823,24);
            pushFollow(FOLLOW_table_in_relation216);
            b=table();

            state._fsp--;

            dbg.location(823,32);
            pushFollow(FOLLOW_reltype_in_relation220);
            c=reltype();

            state._fsp--;

            dbg.location(823,42);
            pushFollow(FOLLOW_reltype_in_relation224);
            d=reltype();

            state._fsp--;


            match(input, Token.UP, null); 
            dbg.location(823,52);

            			if(relations_in.containsKey(b)) {
            				ArrayList<Relation> array = relations_in.get(b);
            				array.add(new Relation(a, c, d));
            			}
            			else {
            				ArrayList<Relation> array = new ArrayList<Relation>();
            				array.add(new Relation(a, c, d));
            				relations_in.put(b, array);
            			}
            			relations_out = relations_in;
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(835, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "relation");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return relations_out;
    }
    // $ANTLR end "relation"


    // $ANTLR start "renom"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:837:1: renom[HashMap<String,String> renom_in] returns [HashMap<String,String> renom_out] : ^( RENOM a= TYPE b= TYPE ) ;
    public final HashMap<String,String> renom(HashMap<String,String> renom_in) throws RecognitionException {
        HashMap<String,String> renom_out = null;

        CommonTree a=null;
        CommonTree b=null;

        try { dbg.enterRule(getGrammarFileName(), "renom");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(837, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:839:2: ( ^( RENOM a= TYPE b= TYPE ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:839:4: ^( RENOM a= TYPE b= TYPE )
            {
            dbg.location(839,4);
            dbg.location(839,6);
            match(input,RENOM,FOLLOW_RENOM_in_renom243); 

            match(input, Token.DOWN, null); 
            dbg.location(839,13);
            a=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_renom247); 
            dbg.location(839,20);
            b=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_renom251); 

            match(input, Token.UP, null); 
            dbg.location(839,27);

            			if(renom_in.containsKey((a!=null?a.getText():null))) {
            				renom_in.remove((a!=null?a.getText():null));
            				renom_in.put((a!=null?a.getText():null),(b!=null?b.getText():null));
            			}
            			else renom_in.put((a!=null?a.getText():null),(b!=null?b.getText():null));
            			renom_out = renom_in;
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(847, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "renom");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return renom_out;
    }
    // $ANTLR end "renom"


    // $ANTLR start "table"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:849:1: table returns [String table_out] : ^( TABLE TYPE ) ;
    public final String table() throws RecognitionException {
        String table_out = null;

        CommonTree TYPE11=null;

        try { dbg.enterRule(getGrammarFileName(), "table");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(849, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:851:2: ( ^( TABLE TYPE ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:851:4: ^( TABLE TYPE )
            {
            dbg.location(851,4);
            dbg.location(851,6);
            match(input,TABLE,FOLLOW_TABLE_in_table269); 

            match(input, Token.DOWN, null); 
            dbg.location(851,12);
            TYPE11=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_table271); 

            match(input, Token.UP, null); 
            dbg.location(851,18);
             table_out = (TYPE11!=null?TYPE11.getText():null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(852, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "table");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return table_out;
    }
    // $ANTLR end "table"

    public static class fields_return extends TreeRuleReturnScope {
        public ArrayList<Fields> fields_out;
        public ArrayList<String> keys_out;
    };

    // $ANTLR start "fields"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:854:1: fields returns [ArrayList<Fields> fields_out, ArrayList<String> keys_out] : ^( FIELDS ( field )+ ) ;
    public final dreqltree.fields_return fields() throws RecognitionException {
        dreqltree.fields_return retval = new dreqltree.fields_return();
        retval.start = input.LT(1);

        dreqltree.field_return field12 = null;



        	ArrayList<Fields> array = new ArrayList<Fields>();
        	ArrayList<String> keys = new ArrayList<String>();

        try { dbg.enterRule(getGrammarFileName(), "fields");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(854, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:860:2: ( ^( FIELDS ( field )+ ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:860:4: ^( FIELDS ( field )+ )
            {
            dbg.location(860,4);
            dbg.location(860,6);
            match(input,FIELDS,FOLLOW_FIELDS_in_fields294); 

            match(input, Token.DOWN, null); 
            dbg.location(860,13);
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:860:13: ( field )+
            int cnt4=0;
            try { dbg.enterSubRule(4);

            loop4:
            do {
                int alt4=2;
                try { dbg.enterDecision(4);

                int LA4_0 = input.LA(1);

                if ( (LA4_0==FIELD) ) {
                    alt4=1;
                }


                } finally {dbg.exitDecision(4);}

                switch (alt4) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:860:14: field
            	    {
            	    dbg.location(860,14);
            	    pushFollow(FOLLOW_field_in_fields297);
            	    field12=field();

            	    state._fsp--;

            	    dbg.location(860,20);

            	    			array.add((field12!=null?field12.field_out:null));
            	    			if((field12!=null?field12.key_out:null) != null) keys.add((field12!=null?field12.key_out:null));
            	    		

            	    }
            	    break;

            	default :
            	    if ( cnt4 >= 1 ) break loop4;
                        EarlyExitException eee =
                            new EarlyExitException(4, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt4++;
            } while (true);
            } finally {dbg.exitSubRule(4);}


            match(input, Token.UP, null); 
            dbg.location(863,8);

            			retval.fields_out = array;
            			retval.keys_out = keys;
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(867, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "fields");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "fields"

    public static class field_return extends TreeRuleReturnScope {
        public Fields field_out;
        public String key_out;
    };

    // $ANTLR start "field"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:869:1: field returns [Fields field_out, String key_out] : ( ^( FIELD fieldname datatype optional ) | ^( FIELD fieldname optional ) | ^( FIELD fieldname datatype ) | ^( FIELD fieldname ) );
    public final dreqltree.field_return field() throws RecognitionException {
        dreqltree.field_return retval = new dreqltree.field_return();
        retval.start = input.LT(1);

        String fieldname13 = null;

        dreqltree.datatype_return datatype14 = null;

        dreqltree.optional_return optional15 = null;

        String fieldname16 = null;

        dreqltree.optional_return optional17 = null;

        String fieldname18 = null;

        dreqltree.datatype_return datatype19 = null;

        String fieldname20 = null;


        try { dbg.enterRule(getGrammarFileName(), "field");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(869, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:871:2: ( ^( FIELD fieldname datatype optional ) | ^( FIELD fieldname optional ) | ^( FIELD fieldname datatype ) | ^( FIELD fieldname ) )
            int alt5=4;
            try { dbg.enterDecision(5);

            try {
                isCyclicDecision = true;
                alt5 = dfa5.predict(input);
            }
            catch (NoViableAltException nvae) {
                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(5);}

            switch (alt5) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:871:4: ^( FIELD fieldname datatype optional )
                    {
                    dbg.location(871,4);
                    dbg.location(871,6);
                    match(input,FIELD,FOLLOW_FIELD_in_field319); 

                    match(input, Token.DOWN, null); 
                    dbg.location(871,12);
                    pushFollow(FOLLOW_fieldname_in_field321);
                    fieldname13=fieldname();

                    state._fsp--;

                    dbg.location(871,22);
                    pushFollow(FOLLOW_datatype_in_field323);
                    datatype14=datatype();

                    state._fsp--;

                    dbg.location(871,31);
                    pushFollow(FOLLOW_optional_in_field325);
                    optional15=optional();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(871,41);

                    			retval.field_out = new Fields(fieldname13, (datatype14!=null?datatype14.type_out:null), (datatype14!=null?datatype14.size_out:null), (optional15!=null?optional15.options_out:null));
                    			if((optional15!=null?optional15.flag_out:false)) retval.key_out = fieldname13;
                    			else retval.key_out = null;
                    		

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:876:5: ^( FIELD fieldname optional )
                    {
                    dbg.location(876,5);
                    dbg.location(876,7);
                    match(input,FIELD,FOLLOW_FIELD_in_field335); 

                    match(input, Token.DOWN, null); 
                    dbg.location(876,13);
                    pushFollow(FOLLOW_fieldname_in_field337);
                    fieldname16=fieldname();

                    state._fsp--;

                    dbg.location(876,23);
                    pushFollow(FOLLOW_optional_in_field339);
                    optional17=optional();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(876,33);

                    			retval.field_out = new Fields(fieldname16,"varchar","255", (optional17!=null?optional17.options_out:null));
                    			if((optional17!=null?optional17.flag_out:false)) retval.key_out = fieldname16;
                    			else retval.key_out = null;
                    		

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:881:5: ^( FIELD fieldname datatype )
                    {
                    dbg.location(881,5);
                    dbg.location(881,7);
                    match(input,FIELD,FOLLOW_FIELD_in_field349); 

                    match(input, Token.DOWN, null); 
                    dbg.location(881,13);
                    pushFollow(FOLLOW_fieldname_in_field351);
                    fieldname18=fieldname();

                    state._fsp--;

                    dbg.location(881,23);
                    pushFollow(FOLLOW_datatype_in_field353);
                    datatype19=datatype();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(881,33);
                     retval.field_out = new Fields(fieldname18, (datatype19!=null?datatype19.type_out:null), (datatype19!=null?datatype19.size_out:null), null); retval.key_out = null; 

                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:882:5: ^( FIELD fieldname )
                    {
                    dbg.location(882,5);
                    dbg.location(882,7);
                    match(input,FIELD,FOLLOW_FIELD_in_field363); 

                    match(input, Token.DOWN, null); 
                    dbg.location(882,13);
                    pushFollow(FOLLOW_fieldname_in_field365);
                    fieldname20=fieldname();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(882,24);
                     retval.field_out = new Fields(fieldname20,"varchar","255",null); retval.key_out = null; 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(883, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "field");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "field"


    // $ANTLR start "fieldname"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:885:1: fieldname returns [String name_out] : ^( FIELDNAME TYPE ) ;
    public final String fieldname() throws RecognitionException {
        String name_out = null;

        CommonTree TYPE21=null;

        try { dbg.enterRule(getGrammarFileName(), "fieldname");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(885, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:887:2: ( ^( FIELDNAME TYPE ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:887:4: ^( FIELDNAME TYPE )
            {
            dbg.location(887,4);
            dbg.location(887,6);
            match(input,FIELDNAME,FOLLOW_FIELDNAME_in_fieldname383); 

            match(input, Token.DOWN, null); 
            dbg.location(887,16);
            TYPE21=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_fieldname385); 

            match(input, Token.UP, null); 
            dbg.location(887,22);
             name_out = (TYPE21!=null?TYPE21.getText():null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(888, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "fieldname");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return name_out;
    }
    // $ANTLR end "fieldname"

    public static class datatype_return extends TreeRuleReturnScope {
        public String type_out;
        public String size_out;
    };

    // $ANTLR start "datatype"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:890:1: datatype returns [String type_out, String size_out] : ( ^( DATATYPE TYPE ) | ^( DATATYPE TYPE NUM ) | ^( DATATYPE ENUM enumopt ) | ^( DATATYPE set ) );
    public final dreqltree.datatype_return datatype() throws RecognitionException {
        dreqltree.datatype_return retval = new dreqltree.datatype_return();
        retval.start = input.LT(1);

        CommonTree TYPE22=null;
        CommonTree TYPE23=null;
        CommonTree NUM24=null;
        String enumopt25 = null;

        dreqltree.set_return set26 = null;


        try { dbg.enterRule(getGrammarFileName(), "datatype");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(890, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:892:2: ( ^( DATATYPE TYPE ) | ^( DATATYPE TYPE NUM ) | ^( DATATYPE ENUM enumopt ) | ^( DATATYPE set ) )
            int alt6=4;
            try { dbg.enterDecision(6);

            int LA6_0 = input.LA(1);

            if ( (LA6_0==DATATYPE) ) {
                int LA6_1 = input.LA(2);

                if ( (LA6_1==DOWN) ) {
                    switch ( input.LA(3) ) {
                    case TYPE:
                        {
                        int LA6_3 = input.LA(4);

                        if ( (LA6_3==UP) ) {
                            alt6=1;
                        }
                        else if ( (LA6_3==NUM) ) {
                            alt6=2;
                        }
                        else {
                            NoViableAltException nvae =
                                new NoViableAltException("", 6, 3, input);

                            dbg.recognitionException(nvae);
                            throw nvae;
                        }
                        }
                        break;
                    case ENUM:
                        {
                        alt6=3;
                        }
                        break;
                    case SETTYPE:
                        {
                        alt6=4;
                        }
                        break;
                    default:
                        NoViableAltException nvae =
                            new NoViableAltException("", 6, 2, input);

                        dbg.recognitionException(nvae);
                        throw nvae;
                    }

                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 6, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 6, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(6);}

            switch (alt6) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:892:4: ^( DATATYPE TYPE )
                    {
                    dbg.location(892,4);
                    dbg.location(892,6);
                    match(input,DATATYPE,FOLLOW_DATATYPE_in_datatype403); 

                    match(input, Token.DOWN, null); 
                    dbg.location(892,15);
                    TYPE22=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_datatype405); 

                    match(input, Token.UP, null); 
                    dbg.location(892,21);
                     retval.type_out = (TYPE22!=null?TYPE22.getText():null); retval.size_out = null; 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:893:5: ^( DATATYPE TYPE NUM )
                    {
                    dbg.location(893,5);
                    dbg.location(893,7);
                    match(input,DATATYPE,FOLLOW_DATATYPE_in_datatype415); 

                    match(input, Token.DOWN, null); 
                    dbg.location(893,16);
                    TYPE23=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_datatype417); 
                    dbg.location(893,21);
                    NUM24=(CommonTree)match(input,NUM,FOLLOW_NUM_in_datatype419); 

                    match(input, Token.UP, null); 
                    dbg.location(893,26);
                     retval.type_out = (TYPE23!=null?TYPE23.getText():null); retval.size_out = (NUM24!=null?NUM24.getText():null); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:894:5: ^( DATATYPE ENUM enumopt )
                    {
                    dbg.location(894,5);
                    dbg.location(894,7);
                    match(input,DATATYPE,FOLLOW_DATATYPE_in_datatype429); 

                    match(input, Token.DOWN, null); 
                    dbg.location(894,16);
                    match(input,ENUM,FOLLOW_ENUM_in_datatype431); 
                    dbg.location(894,21);
                    pushFollow(FOLLOW_enumopt_in_datatype433);
                    enumopt25=enumopt();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(894,30);
                     retval.type_out = "ENUM(" + enumopt25 + ")"; retval.size_out = null; 

                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:895:5: ^( DATATYPE set )
                    {
                    dbg.location(895,5);
                    dbg.location(895,7);
                    match(input,DATATYPE,FOLLOW_DATATYPE_in_datatype443); 

                    match(input, Token.DOWN, null); 
                    dbg.location(895,16);
                    pushFollow(FOLLOW_set_in_datatype445);
                    set26=set();

                    state._fsp--;


                    match(input, Token.UP, null); 
                    dbg.location(895,21);
                     retval.type_out =(set26!=null?set26.type_out:null); retval.size_out = (set26!=null?set26.size_out:null); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(896, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "datatype");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "datatype"

    public static class set_return extends TreeRuleReturnScope {
        public String type_out;
        public String size_out;
    };

    // $ANTLR start "set"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:898:1: set returns [String type_out, String size_out] : ( ^( SETTYPE TYPE NUM ) | ^( SETTYPE TYPE ) | ^( SETTYPE SET ) );
    public final dreqltree.set_return set() throws RecognitionException {
        dreqltree.set_return retval = new dreqltree.set_return();
        retval.start = input.LT(1);

        CommonTree TYPE27=null;
        CommonTree NUM28=null;
        CommonTree TYPE29=null;

        try { dbg.enterRule(getGrammarFileName(), "set");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(898, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:900:2: ( ^( SETTYPE TYPE NUM ) | ^( SETTYPE TYPE ) | ^( SETTYPE SET ) )
            int alt7=3;
            try { dbg.enterDecision(7);

            int LA7_0 = input.LA(1);

            if ( (LA7_0==SETTYPE) ) {
                int LA7_1 = input.LA(2);

                if ( (LA7_1==DOWN) ) {
                    int LA7_2 = input.LA(3);

                    if ( (LA7_2==TYPE) ) {
                        int LA7_3 = input.LA(4);

                        if ( (LA7_3==NUM) ) {
                            alt7=1;
                        }
                        else if ( (LA7_3==UP) ) {
                            alt7=2;
                        }
                        else {
                            NoViableAltException nvae =
                                new NoViableAltException("", 7, 3, input);

                            dbg.recognitionException(nvae);
                            throw nvae;
                        }
                    }
                    else if ( (LA7_2==SET) ) {
                        alt7=3;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 7, 2, input);

                        dbg.recognitionException(nvae);
                        throw nvae;
                    }
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 7, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 7, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(7);}

            switch (alt7) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:900:4: ^( SETTYPE TYPE NUM )
                    {
                    dbg.location(900,4);
                    dbg.location(900,6);
                    match(input,SETTYPE,FOLLOW_SETTYPE_in_set463); 

                    match(input, Token.DOWN, null); 
                    dbg.location(900,14);
                    TYPE27=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_set465); 
                    dbg.location(900,19);
                    NUM28=(CommonTree)match(input,NUM,FOLLOW_NUM_in_set467); 

                    match(input, Token.UP, null); 
                    dbg.location(900,24);
                     retval.type_out = new String("set:" + (TYPE27!=null?TYPE27.getText():null)); retval.size_out = (NUM28!=null?NUM28.getText():null); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:901:5: ^( SETTYPE TYPE )
                    {
                    dbg.location(901,5);
                    dbg.location(901,7);
                    match(input,SETTYPE,FOLLOW_SETTYPE_in_set477); 

                    match(input, Token.DOWN, null); 
                    dbg.location(901,15);
                    TYPE29=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_set479); 

                    match(input, Token.UP, null); 
                    dbg.location(901,21);
                     retval.type_out = new String("set:" + (TYPE29!=null?TYPE29.getText():null)); retval.size_out = null; 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:902:5: ^( SETTYPE SET )
                    {
                    dbg.location(902,5);
                    dbg.location(902,7);
                    match(input,SETTYPE,FOLLOW_SETTYPE_in_set489); 

                    match(input, Token.DOWN, null); 
                    dbg.location(902,15);
                    match(input,SET,FOLLOW_SET_in_set491); 

                    match(input, Token.UP, null); 
                    dbg.location(902,20);
                     retval.type_out = new String("set:varchar"); retval.size_out = "255"; 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(903, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "set");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "set"


    // $ANTLR start "enumopt"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:905:1: enumopt returns [String type_out] : ^( ENUMOPT ( args[arg_in] )+ ) ;
    public final String enumopt() throws RecognitionException {
        String type_out = null;

        String args30 = null;



        	String arg_in = new String();

        try { dbg.enterRule(getGrammarFileName(), "enumopt");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(905, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:910:2: ( ^( ENUMOPT ( args[arg_in] )+ ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:910:4: ^( ENUMOPT ( args[arg_in] )+ )
            {
            dbg.location(910,4);
            dbg.location(910,6);
            match(input,ENUMOPT,FOLLOW_ENUMOPT_in_enumopt515); 

            match(input, Token.DOWN, null); 
            dbg.location(910,14);
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:910:14: ( args[arg_in] )+
            int cnt8=0;
            try { dbg.enterSubRule(8);

            loop8:
            do {
                int alt8=2;
                try { dbg.enterDecision(8);

                int LA8_0 = input.LA(1);

                if ( (LA8_0==ARGS) ) {
                    alt8=1;
                }


                } finally {dbg.exitDecision(8);}

                switch (alt8) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:910:15: args[arg_in]
            	    {
            	    dbg.location(910,15);
            	    pushFollow(FOLLOW_args_in_enumopt518);
            	    args30=args(arg_in);

            	    state._fsp--;

            	    dbg.location(910,28);

            	    			arg_in =  args30;
            	    		

            	    }
            	    break;

            	default :
            	    if ( cnt8 >= 1 ) break loop8;
                        EarlyExitException eee =
                            new EarlyExitException(8, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt8++;
            } while (true);
            } finally {dbg.exitSubRule(8);}


            match(input, Token.UP, null); 
            dbg.location(912,8);

            			type_out = args30.substring(0,args30.length()-1);
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(915, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "enumopt");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return type_out;
    }
    // $ANTLR end "enumopt"


    // $ANTLR start "args"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:917:1: args[String arg_in] returns [String arg_out] : ^( ARGS VAL ) ;
    public final String args(String arg_in) throws RecognitionException {
        String arg_out = null;

        CommonTree VAL31=null;

        try { dbg.enterRule(getGrammarFileName(), "args");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(917, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:919:2: ( ^( ARGS VAL ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:919:4: ^( ARGS VAL )
            {
            dbg.location(919,4);
            dbg.location(919,6);
            match(input,ARGS,FOLLOW_ARGS_in_args542); 

            match(input, Token.DOWN, null); 
            dbg.location(919,11);
            VAL31=(CommonTree)match(input,VAL,FOLLOW_VAL_in_args544); 

            match(input, Token.UP, null); 
            dbg.location(919,16);
             arg_out = arg_in + (VAL31!=null?VAL31.getText():null) + ","; 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(920, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "args");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return arg_out;
    }
    // $ANTLR end "args"

    public static class optional_return extends TreeRuleReturnScope {
        public ArrayList<String> options_out;
        public boolean flag_out;
    };

    // $ANTLR start "optional"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:922:1: optional returns [ArrayList<String> options_out, boolean flag_out] : ^( OPTIONAL ( option[flag_in] )+ ) ;
    public final dreqltree.optional_return optional() throws RecognitionException {
        dreqltree.optional_return retval = new dreqltree.optional_return();
        retval.start = input.LT(1);

        dreqltree.option_return option32 = null;



        	ArrayList<String> array = new ArrayList<String>();
        	boolean flag_in = false;

        try { dbg.enterRule(getGrammarFileName(), "optional");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(922, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:928:2: ( ^( OPTIONAL ( option[flag_in] )+ ) )
            dbg.enterAlt(1);

            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:928:4: ^( OPTIONAL ( option[flag_in] )+ )
            {
            dbg.location(928,4);
            dbg.location(928,6);
            match(input,OPTIONAL,FOLLOW_OPTIONAL_in_optional566); 

            match(input, Token.DOWN, null); 
            dbg.location(928,15);
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:928:15: ( option[flag_in] )+
            int cnt9=0;
            try { dbg.enterSubRule(9);

            loop9:
            do {
                int alt9=2;
                try { dbg.enterDecision(9);

                int LA9_0 = input.LA(1);

                if ( (LA9_0==OPTION) ) {
                    alt9=1;
                }


                } finally {dbg.exitDecision(9);}

                switch (alt9) {
            	case 1 :
            	    dbg.enterAlt(1);

            	    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:928:16: option[flag_in]
            	    {
            	    dbg.location(928,16);
            	    pushFollow(FOLLOW_option_in_optional569);
            	    option32=option(flag_in);

            	    state._fsp--;

            	    dbg.location(928,32);

            	    			array.add((option32!=null?option32.option_out:null));
            	    			flag_in = (option32!=null?option32.flag_out:false);
            	    		

            	    }
            	    break;

            	default :
            	    if ( cnt9 >= 1 ) break loop9;
                        EarlyExitException eee =
                            new EarlyExitException(9, input);
                        dbg.recognitionException(eee);

                        throw eee;
                }
                cnt9++;
            } while (true);
            } finally {dbg.exitSubRule(9);}


            match(input, Token.UP, null); 
            dbg.location(931,8);

            			retval.options_out = array;
            			retval.flag_out = flag_in;
            		

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(935, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "optional");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "optional"

    public static class option_return extends TreeRuleReturnScope {
        public String option_out;
        public boolean flag_out;
    };

    // $ANTLR start "option"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:937:1: option[boolean flag_in] returns [String option_out, boolean flag_out] : ( ^( OPTION EDITABLE ) | ^( OPTION VISIBLE ) | ^( OPTION OPTIONAL ) | ^( OPTION MASKED ) | ^( OPTION KEY ) | ^( OPTION AUTOINC ) );
    public final dreqltree.option_return option(boolean flag_in) throws RecognitionException {
        dreqltree.option_return retval = new dreqltree.option_return();
        retval.start = input.LT(1);

        try { dbg.enterRule(getGrammarFileName(), "option");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(937, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:939:2: ( ^( OPTION EDITABLE ) | ^( OPTION VISIBLE ) | ^( OPTION OPTIONAL ) | ^( OPTION MASKED ) | ^( OPTION KEY ) | ^( OPTION AUTOINC ) )
            int alt10=6;
            try { dbg.enterDecision(10);

            int LA10_0 = input.LA(1);

            if ( (LA10_0==OPTION) ) {
                int LA10_1 = input.LA(2);

                if ( (LA10_1==DOWN) ) {
                    switch ( input.LA(3) ) {
                    case EDITABLE:
                        {
                        alt10=1;
                        }
                        break;
                    case VISIBLE:
                        {
                        alt10=2;
                        }
                        break;
                    case OPTIONAL:
                        {
                        alt10=3;
                        }
                        break;
                    case MASKED:
                        {
                        alt10=4;
                        }
                        break;
                    case KEY:
                        {
                        alt10=5;
                        }
                        break;
                    case AUTOINC:
                        {
                        alt10=6;
                        }
                        break;
                    default:
                        NoViableAltException nvae =
                            new NoViableAltException("", 10, 2, input);

                        dbg.recognitionException(nvae);
                        throw nvae;
                    }

                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 10, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 10, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(10);}

            switch (alt10) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:939:4: ^( OPTION EDITABLE )
                    {
                    dbg.location(939,4);
                    dbg.location(939,6);
                    match(input,OPTION,FOLLOW_OPTION_in_option594); 

                    match(input, Token.DOWN, null); 
                    dbg.location(939,13);
                    match(input,EDITABLE,FOLLOW_EDITABLE_in_option596); 

                    match(input, Token.UP, null); 
                    dbg.location(939,23);
                     retval.option_out = new String("Editable"); retval.flag_out = flag_in; 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:940:5: ^( OPTION VISIBLE )
                    {
                    dbg.location(940,5);
                    dbg.location(940,7);
                    match(input,OPTION,FOLLOW_OPTION_in_option606); 

                    match(input, Token.DOWN, null); 
                    dbg.location(940,14);
                    match(input,VISIBLE,FOLLOW_VISIBLE_in_option608); 

                    match(input, Token.UP, null); 
                    dbg.location(940,23);
                     retval.option_out = new String("Visible"); retval.flag_out = flag_in; 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:941:5: ^( OPTION OPTIONAL )
                    {
                    dbg.location(941,5);
                    dbg.location(941,7);
                    match(input,OPTION,FOLLOW_OPTION_in_option618); 

                    match(input, Token.DOWN, null); 
                    dbg.location(941,14);
                    match(input,OPTIONAL,FOLLOW_OPTIONAL_in_option620); 

                    match(input, Token.UP, null); 
                    dbg.location(941,24);
                     retval.option_out = new String("Optional"); retval.flag_out = flag_in; 

                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:942:5: ^( OPTION MASKED )
                    {
                    dbg.location(942,5);
                    dbg.location(942,7);
                    match(input,OPTION,FOLLOW_OPTION_in_option630); 

                    match(input, Token.DOWN, null); 
                    dbg.location(942,14);
                    match(input,MASKED,FOLLOW_MASKED_in_option632); 

                    match(input, Token.UP, null); 
                    dbg.location(942,22);
                     retval.option_out = new String("Masked"); retval.flag_out = flag_in; 

                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:943:5: ^( OPTION KEY )
                    {
                    dbg.location(943,5);
                    dbg.location(943,7);
                    match(input,OPTION,FOLLOW_OPTION_in_option642); 

                    match(input, Token.DOWN, null); 
                    dbg.location(943,14);
                    match(input,KEY,FOLLOW_KEY_in_option644); 

                    match(input, Token.UP, null); 
                    dbg.location(943,19);
                     retval.option_out = new String("Key"); retval.flag_out = true; 

                    }
                    break;
                case 6 :
                    dbg.enterAlt(6);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:944:5: ^( OPTION AUTOINC )
                    {
                    dbg.location(944,5);
                    dbg.location(944,7);
                    match(input,OPTION,FOLLOW_OPTION_in_option654); 

                    match(input, Token.DOWN, null); 
                    dbg.location(944,14);
                    match(input,AUTOINC,FOLLOW_AUTOINC_in_option656); 

                    match(input, Token.UP, null); 
                    dbg.location(944,23);
                     retval.option_out = new String("AutoInc"); retval.flag_out = flag_in; 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(945, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "option");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return retval;
    }
    // $ANTLR end "option"


    // $ANTLR start "reltype"
    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:947:1: reltype returns [String reltype_out] : ( ^( RELTYPE ONE ) | ^( RELTYPE ZEROTOONE ) | ^( RELTYPE ONETON ) | ^( RELTYPE ZEROTON ) | ^( RELTYPE NTOM ) | ^( RELTYPE NUM ) | ^( RELTYPE a= NUM b= NUM ) );
    public final String reltype() throws RecognitionException {
        String reltype_out = null;

        CommonTree a=null;
        CommonTree b=null;
        CommonTree NUM33=null;

        try { dbg.enterRule(getGrammarFileName(), "reltype");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(947, 1);

        try {
            // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:949:2: ( ^( RELTYPE ONE ) | ^( RELTYPE ZEROTOONE ) | ^( RELTYPE ONETON ) | ^( RELTYPE ZEROTON ) | ^( RELTYPE NTOM ) | ^( RELTYPE NUM ) | ^( RELTYPE a= NUM b= NUM ) )
            int alt11=7;
            try { dbg.enterDecision(11);

            try {
                isCyclicDecision = true;
                alt11 = dfa11.predict(input);
            }
            catch (NoViableAltException nvae) {
                dbg.recognitionException(nvae);
                throw nvae;
            }
            } finally {dbg.exitDecision(11);}

            switch (alt11) {
                case 1 :
                    dbg.enterAlt(1);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:949:4: ^( RELTYPE ONE )
                    {
                    dbg.location(949,4);
                    dbg.location(949,6);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype674); 

                    match(input, Token.DOWN, null); 
                    dbg.location(949,14);
                    match(input,ONE,FOLLOW_ONE_in_reltype676); 

                    match(input, Token.UP, null); 
                    dbg.location(949,19);
                     reltype_out = new String("One"); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:950:5: ^( RELTYPE ZEROTOONE )
                    {
                    dbg.location(950,5);
                    dbg.location(950,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype686); 

                    match(input, Token.DOWN, null); 
                    dbg.location(950,15);
                    match(input,ZEROTOONE,FOLLOW_ZEROTOONE_in_reltype688); 

                    match(input, Token.UP, null); 
                    dbg.location(950,26);
                     reltype_out = new String("ZeroToOne"); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:951:5: ^( RELTYPE ONETON )
                    {
                    dbg.location(951,5);
                    dbg.location(951,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype698); 

                    match(input, Token.DOWN, null); 
                    dbg.location(951,15);
                    match(input,ONETON,FOLLOW_ONETON_in_reltype700); 

                    match(input, Token.UP, null); 
                    dbg.location(951,23);
                     reltype_out = new String("OneToN"); 

                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:952:5: ^( RELTYPE ZEROTON )
                    {
                    dbg.location(952,5);
                    dbg.location(952,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype710); 

                    match(input, Token.DOWN, null); 
                    dbg.location(952,15);
                    match(input,ZEROTON,FOLLOW_ZEROTON_in_reltype712); 

                    match(input, Token.UP, null); 
                    dbg.location(952,24);
                     reltype_out = new String("ZeroToN"); 

                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:953:5: ^( RELTYPE NTOM )
                    {
                    dbg.location(953,5);
                    dbg.location(953,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype722); 

                    match(input, Token.DOWN, null); 
                    dbg.location(953,15);
                    match(input,NTOM,FOLLOW_NTOM_in_reltype724); 

                    match(input, Token.UP, null); 
                    dbg.location(953,21);
                     reltype_out = new String("N"); 

                    }
                    break;
                case 6 :
                    dbg.enterAlt(6);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:954:5: ^( RELTYPE NUM )
                    {
                    dbg.location(954,5);
                    dbg.location(954,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype734); 

                    match(input, Token.DOWN, null); 
                    dbg.location(954,15);
                    NUM33=(CommonTree)match(input,NUM,FOLLOW_NUM_in_reltype736); 

                    match(input, Token.UP, null); 
                    dbg.location(954,20);
                     reltype_out = (NUM33!=null?NUM33.getText():null); 

                    }
                    break;
                case 7 :
                    dbg.enterAlt(7);

                    // /Users/Hades/Personal/Universidade/EL/PI/Projecto/v2.2/dreqltree.g:955:5: ^( RELTYPE a= NUM b= NUM )
                    {
                    dbg.location(955,5);
                    dbg.location(955,7);
                    match(input,RELTYPE,FOLLOW_RELTYPE_in_reltype746); 

                    match(input, Token.DOWN, null); 
                    dbg.location(955,16);
                    a=(CommonTree)match(input,NUM,FOLLOW_NUM_in_reltype750); 
                    dbg.location(955,22);
                    b=(CommonTree)match(input,NUM,FOLLOW_NUM_in_reltype754); 

                    match(input, Token.UP, null); 
                    dbg.location(955,28);
                     reltype_out = (a!=null?a.getText():null) + ".." + (b!=null?b.getText():null); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        dbg.location(956, 2);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "reltype");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return reltype_out;
    }
    // $ANTLR end "reltype"

    // Delegated rules


    protected DFA5 dfa5 = new DFA5(this);
    protected DFA11 dfa11 = new DFA11(this);
    static final String DFA5_eotS =
        "\43\uffff";
    static final String DFA5_eofS =
        "\43\uffff";
    static final String DFA5_minS =
        "\1\13\1\2\1\15\1\2\1\43\2\3\1\2\2\uffff\1\33\1\3\1\34\1\2\2\3\1"+
        "\2\1\36\2\uffff\1\3\1\35\2\3\1\2\3\3\1\45\6\3";
    static final String DFA5_maxS =
        "\1\13\1\2\1\15\1\2\1\43\1\3\1\16\1\2\2\uffff\1\43\1\44\1\34\1\2"+
        "\1\16\1\3\1\2\1\43\2\uffff\1\16\1\35\1\44\1\3\1\2\3\3\1\45\1\3\1"+
        "\16\1\3\1\35\1\3\1\16";
    static final String DFA5_acceptS =
        "\10\uffff\1\2\1\4\10\uffff\1\1\1\3\17\uffff";
    static final String DFA5_specialS =
        "\43\uffff}>";
    static final String[] DFA5_transitionS = {
            "\1\1",
            "\1\2",
            "\1\3",
            "\1\4",
            "\1\5",
            "\1\6",
            "\1\11\10\uffff\1\7\1\uffff\1\10",
            "\1\12",
            "",
            "",
            "\1\14\3\uffff\1\15\3\uffff\1\13",
            "\1\16\40\uffff\1\17",
            "\1\20",
            "\1\21",
            "\1\23\12\uffff\1\22",
            "\1\24",
            "\1\25",
            "\1\27\4\uffff\1\26",
            "",
            "",
            "\1\23\12\uffff\1\22",
            "\1\30",
            "\1\32\40\uffff\1\31",
            "\1\33",
            "\1\34",
            "\1\35",
            "\1\36",
            "\1\36",
            "\1\37",
            "\1\36",
            "\1\23\12\uffff\1\22",
            "\1\40",
            "\1\41\31\uffff\1\30",
            "\1\42",
            "\1\23\12\uffff\1\22"
    };

    static final short[] DFA5_eot = DFA.unpackEncodedString(DFA5_eotS);
    static final short[] DFA5_eof = DFA.unpackEncodedString(DFA5_eofS);
    static final char[] DFA5_min = DFA.unpackEncodedStringToUnsignedChars(DFA5_minS);
    static final char[] DFA5_max = DFA.unpackEncodedStringToUnsignedChars(DFA5_maxS);
    static final short[] DFA5_accept = DFA.unpackEncodedString(DFA5_acceptS);
    static final short[] DFA5_special = DFA.unpackEncodedString(DFA5_specialS);
    static final short[][] DFA5_transition;

    static {
        int numStates = DFA5_transitionS.length;
        DFA5_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA5_transition[i] = DFA.unpackEncodedString(DFA5_transitionS[i]);
        }
    }

    class DFA5 extends DFA {

        public DFA5(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 5;
            this.eot = DFA5_eot;
            this.eof = DFA5_eof;
            this.min = DFA5_min;
            this.max = DFA5_max;
            this.accept = DFA5_accept;
            this.special = DFA5_special;
            this.transition = DFA5_transition;
        }
        public String getDescription() {
            return "869:1: field returns [Fields field_out, String key_out] : ( ^( FIELD fieldname datatype optional ) | ^( FIELD fieldname optional ) | ^( FIELD fieldname datatype ) | ^( FIELD fieldname ) );";
        }
        public void error(NoViableAltException nvae) {
            dbg.recognitionException(nvae);
        }
    }
    static final String DFA11_eotS =
        "\13\uffff";
    static final String DFA11_eofS =
        "\13\uffff";
    static final String DFA11_minS =
        "\1\20\1\2\1\26\5\uffff\1\3\2\uffff";
    static final String DFA11_maxS =
        "\1\20\1\2\1\44\5\uffff\1\44\2\uffff";
    static final String DFA11_acceptS =
        "\3\uffff\1\1\1\2\1\3\1\4\1\5\1\uffff\1\6\1\7";
    static final String DFA11_specialS =
        "\13\uffff}>";
    static final String[] DFA11_transitionS = {
            "\1\1",
            "\1\2",
            "\1\3\1\4\1\5\1\6\1\7\11\uffff\1\10",
            "",
            "",
            "",
            "",
            "",
            "\1\11\40\uffff\1\12",
            "",
            ""
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
            return "947:1: reltype returns [String reltype_out] : ( ^( RELTYPE ONE ) | ^( RELTYPE ZEROTOONE ) | ^( RELTYPE ONETON ) | ^( RELTYPE ZEROTON ) | ^( RELTYPE NTOM ) | ^( RELTYPE NUM ) | ^( RELTYPE a= NUM b= NUM ) );";
        }
        public void error(NoViableAltException nvae) {
            dbg.recognitionException(nvae);
        }
    }
 

    public static final BitSet FOLLOW_DREQL_in_dreql54 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_commands_in_dreql56 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_COMMANDS_in_commands76 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_command_in_commands79 = new BitSet(new long[]{0x0000000000000048L});
    public static final BitSet FOLLOW_COMMAND_in_command103 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_dclass_in_command105 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_COMMAND_in_command116 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_relation_in_command118 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_COMMAND_in_command129 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_renom_in_command131 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_CLASS_in_dclass151 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_table_in_dclass153 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_fields_in_dclass155 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ABSTRACT_in_dclass165 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_table_in_dclass167 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_fields_in_dclass169 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_EXTENDS_in_dclass179 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_table_in_dclass183 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_table_in_dclass187 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_fields_in_dclass189 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELATION_in_relation208 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_table_in_relation212 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_table_in_relation216 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_reltype_in_relation220 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_reltype_in_relation224 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RENOM_in_renom243 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_renom247 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_TYPE_in_renom251 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TABLE_in_table269 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_table271 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_FIELDS_in_fields294 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_field_in_fields297 = new BitSet(new long[]{0x0000000000000808L});
    public static final BitSet FOLLOW_FIELD_in_field319 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_fieldname_in_field321 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_datatype_in_field323 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_optional_in_field325 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_FIELD_in_field335 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_fieldname_in_field337 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_optional_in_field339 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_FIELD_in_field349 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_fieldname_in_field351 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_datatype_in_field353 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_FIELD_in_field363 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_fieldname_in_field365 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_FIELDNAME_in_fieldname383 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_fieldname385 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DATATYPE_in_datatype403 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_datatype405 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DATATYPE_in_datatype415 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_datatype417 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_datatype419 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DATATYPE_in_datatype429 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ENUM_in_datatype431 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_enumopt_in_datatype433 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DATATYPE_in_datatype443 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_set_in_datatype445 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_SETTYPE_in_set463 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_set465 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_set467 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_SETTYPE_in_set477 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_set479 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_SETTYPE_in_set489 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_SET_in_set491 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ENUMOPT_in_enumopt515 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_args_in_enumopt518 = new BitSet(new long[]{0x0000000020000008L});
    public static final BitSet FOLLOW_ARGS_in_args542 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_VAL_in_args544 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTIONAL_in_optional566 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_option_in_optional569 = new BitSet(new long[]{0x0000000000008008L});
    public static final BitSet FOLLOW_OPTION_in_option594 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_EDITABLE_in_option596 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTION_in_option606 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_VISIBLE_in_option608 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTION_in_option618 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_OPTIONAL_in_option620 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTION_in_option630 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_MASKED_in_option632 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTION_in_option642 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_KEY_in_option644 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OPTION_in_option654 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_AUTOINC_in_option656 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype674 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ONE_in_reltype676 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype686 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ZEROTOONE_in_reltype688 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype698 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ONETON_in_reltype700 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype710 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ZEROTON_in_reltype712 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype722 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_NTOM_in_reltype724 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype734 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_NUM_in_reltype736 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RELTYPE_in_reltype746 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_NUM_in_reltype750 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_NUM_in_reltype754 = new BitSet(new long[]{0x0000000000000008L});

}