<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%    
      String driver = "org.firebirdsql.jdbc.FBDriver";      
      String url = "jdbc:firebirdsql:localhost/3050:C:/datasol/database/datasol.GDB";
      String usuario = "SYSDBA";
      String senha   = "masterkey";
      Connection conexao;
      Statement statement;
      ResultSet resultset;
      try
      {
           Class.forName(driver);
           conexao = DriverManager.getConnection(url, usuario, senha);  
           //out.println("conectou legal com o MySQL");
           statement = conexao.createStatement();
           resultset = statement.executeQuery("select * from senha");
           while(resultset.next())
           {
                    out.print(resultset.getString("nome")+"#");

           }
           }
            catch(ClassNotFoundException Driver)
            {
               out.print("Driver não localizado: "+Driver);
            }
            catch(SQLException Fonte)
            {
                out.print("Deu erro na conexão "+
                        "com a fonte de dados: "+Fonte);
            }
            out.println("^");
%>