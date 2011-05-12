tree grammar dreqltree;

options {
   ASTLabelType=CommonTree;
   tokenVocab=dreql;
}

@members {
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
}

@header {
   import java.util.HashMap;
   import java.util.ArrayList;
   import java.io.FileWriter;
   import java.io.IOException;
}

dreql
returns[HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out]
@init{
	HashMap<String,ClassContent> classes_in = new HashMap<String,ClassContent>();
	HashMap<String,ArrayList<Relation>> relations_in = new HashMap<String,ArrayList<Relation>>();
	HashMap<String,String> renom_in = new HashMap<String,String>();
}
	:	^(DREQL commands[classes_in,relations_in,renom_in]) {
			$classes_out = $commands.classes_out;
			$relations_out = $commands.relations_out;
			$renom_out = $commands.renom_out;

			changeRenomType($renom_out, $classes_out);
			HashMap<String,TableContent> tablescont = generateSQL($classes_out, $relations_out);
/*			for(String table : tablescont.keySet()) {
			   System.out.println("Table: " + table);
			   System.out.println(tablescont.get(table).toString());
			}*/
			printSqlCode(tablescont);
			generatePerl(tablescont);
		}
	;

commands[HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in]
returns[HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out]
	:	^(COMMANDS (command[classes_in,relations_in,renom_in] {
			$classes_in = $command.classes_out;
			$relations_in = $command.relations_out;
			$renom_in = $command.renom_out;
		})+) {
			$classes_out = $command.classes_out;
			$relations_out = $command.relations_out;
			$renom_out = $command.renom_out;
		}
	;

command[HashMap<String,ClassContent> classes_in, HashMap<String,ArrayList<Relation>> relations_in, HashMap<String,String> renom_in]
returns[HashMap<String,ClassContent> classes_out, HashMap<String,ArrayList<Relation>> relations_out, HashMap<String,String> renom_out]
	:	^(COMMAND dclass[classes_in]) { $classes_out = $dclass.classes_out; $relations_out = $relations_in; $renom_out = $renom_in; }
		| ^(COMMAND relation[relations_in]) { $classes_out = $classes_in; $relations_out = $relation.relations_out; $renom_out = $renom_in; }
		| ^(COMMAND renom[renom_in]) { $classes_out = $classes_in; $relations_out = $relations_in; $renom_out = $renom.renom_out; }
	;

dclass[HashMap<String,ClassContent> classes_in]
returns[HashMap<String,ClassContent> classes_out]
	:	^(CLASS table fields) {
			if(!$classes_in.containsKey($table.table_out)) {
				$classes_in.put($table.table_out,new ClassContent($fields.fields_out, $fields.keys_out,false,null));
			}
			else System.out.println("ERROR: Table " + $table.table_out + " already defined!!!");
			$classes_out = $classes_in;
		}
		| ^(ABSTRACT table fields) {
			if(!$classes_in.containsKey($table.table_out)) {
				$classes_in.put($table.table_out,new ClassContent($fields.fields_out, $fields.keys_out,true,null));
			}
			else System.out.println("ERROR: Table " + $table.table_out + " already defined!!!");
			$classes_out = $classes_in;
		}
		| ^(EXTENDS a=table b=table fields) {
			if(!$classes_in.containsKey($a.table_out)) {
				$classes_in.put($a.table_out,new ClassContent($fields.fields_out, $fields.keys_out,false,$b.table_out));
			}
			else System.out.println("ERROR: Table " + $a.table_out + " already defined!!!");
			$classes_out = $classes_in;
		}
	;

relation[HashMap<String,ArrayList<Relation>> relations_in]
returns[HashMap<String,ArrayList<Relation>> relations_out]
	:	^(RELATION a=table b=table c=reltype d=reltype) {
			if($relations_in.containsKey($b.table_out)) {
				ArrayList<Relation> array = $relations_in.get($b.table_out);
				array.add(new Relation($a.table_out, $c.reltype_out, $d.reltype_out));
			}
			else {
				ArrayList<Relation> array = new ArrayList<Relation>();
				array.add(new Relation($a.table_out, $c.reltype_out, $d.reltype_out));
				$relations_in.put($b.table_out, array);
			}
			$relations_out = $relations_in;
		}
	;

renom[HashMap<String,String> renom_in]
returns[HashMap<String,String> renom_out]
	:	^(RENOM a=TYPE b=TYPE) {
			if($renom_in.containsKey($a.text)) {
				$renom_in.remove($a.text);
				$renom_in.put($a.text,$b.text);
			}
			else $renom_in.put($a.text,$b.text);
			$renom_out = $renom_in;
		}
	;

table
returns[String table_out]
	:	^(TABLE TYPE) { $table_out = $TYPE.text; }
	;

fields
returns[ArrayList<Fields> fields_out, ArrayList<String> keys_out]
@init {
	ArrayList<Fields> array = new ArrayList<Fields>();
	ArrayList<String> keys = new ArrayList<String>();
}
	:	^(FIELDS (field {
			array.add($field.field_out);
			if($field.key_out != null) keys.add($field.key_out);
		})+) {
			$fields_out = array;
			$keys_out = keys;
		}
	;

field
returns[Fields field_out, String key_out]
	:	^(FIELD fieldname datatype optional) {
			$field_out = new Fields($fieldname.name_out, $datatype.type_out, $datatype.size_out, $optional.options_out);
			if($optional.flag_out) $key_out = $fieldname.name_out;
			else $key_out = null;
		}
		| ^(FIELD fieldname optional) {
			$field_out = new Fields($fieldname.name_out,"varchar","255", $optional.options_out);
			if($optional.flag_out) $key_out = $fieldname.name_out;
			else $key_out = null;
		}
		| ^(FIELD fieldname datatype) { $field_out = new Fields($fieldname.name_out, $datatype.type_out, $datatype.size_out, null); $key_out = null; }
		| ^(FIELD fieldname) { $field_out = new Fields($fieldname.name_out,"varchar","255",null); $key_out = null; }
	;

fieldname
returns[String name_out]
	:	^(FIELDNAME TYPE) { $name_out = $TYPE.text; }
	;

datatype
returns[String type_out, String size_out]
	:	^(DATATYPE TYPE) { $type_out = $TYPE.text; $size_out = null; }
		| ^(DATATYPE TYPE NUM) { $type_out = $TYPE.text; $size_out = $NUM.text; }
		| ^(DATATYPE ENUM enumopt) { $type_out = "ENUM(" + $enumopt.type_out + ")"; $size_out = null; }
		| ^(DATATYPE set) { $type_out =$set.type_out; $size_out = $set.size_out; }
	;

set
returns[String type_out, String size_out]
	:	^(SETTYPE TYPE NUM) { $type_out = new String("set:" + $TYPE.text); $size_out = $NUM.text; }
		| ^(SETTYPE TYPE) { $type_out = new String("set:" + $TYPE.text); $size_out = null; }
		| ^(SETTYPE SET) { $type_out = new String("set:varchar"); $size_out = "255"; }
	;

enumopt
returns [String type_out]
@init {
	String arg_in = new String();
}
	:	^(ENUMOPT (args[arg_in] {
			arg_in =  $args.arg_out;
		})+) {
			$type_out = $args.arg_out.substring(0,$args.arg_out.length()-1);
		}
	;

args[String arg_in]
returns[String arg_out]
	:	^(ARGS VAL) { $arg_out = $arg_in + $VAL.text + ","; }
	;

optional
returns[ArrayList<String> options_out, boolean flag_out]
@init{
	ArrayList<String> array = new ArrayList<String>();
	boolean flag_in = false;
}
	:	^(OPTIONAL (option[flag_in] {
			array.add($option.option_out);
			flag_in = $option.flag_out;
		})+) {
			$options_out = array;
			$flag_out = flag_in;
		}
	;
	
option[boolean flag_in]
returns[String option_out, boolean flag_out]
	:	^(OPTION EDITABLE) { $option_out = new String("Editable"); $flag_out = $flag_in; }
		| ^(OPTION VISIBLE) { $option_out = new String("Visible"); $flag_out = $flag_in; }
		| ^(OPTION OPTIONAL) { $option_out = new String("Optional"); $flag_out = $flag_in; }
		| ^(OPTION MASKED) { $option_out = new String("Masked"); $flag_out = $flag_in; }
		| ^(OPTION KEY) { $option_out = new String("Key"); $flag_out = true; }
		| ^(OPTION AUTOINC) { $option_out = new String("AutoInc"); $flag_out = $flag_in; }
	;

reltype
returns[String reltype_out]
	:	^(RELTYPE ONE) { $reltype_out = new String("One"); }
		| ^(RELTYPE ZEROTOONE) { $reltype_out = new String("ZeroToOne"); }
		| ^(RELTYPE ONETON) { $reltype_out = new String("OneToN"); }
		| ^(RELTYPE ZEROTON) { $reltype_out = new String("ZeroToN"); }
		| ^(RELTYPE NTOM) { $reltype_out = new String("N"); }
		| ^(RELTYPE NUM) { $reltype_out = $NUM.text; }
		| ^(RELTYPE a=NUM b=NUM) { $reltype_out = $a.text + ".." + $b.text; }
	;
