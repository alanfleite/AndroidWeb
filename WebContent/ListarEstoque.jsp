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
           resultset = statement.executeQuery("select PROD, CODPROD, UNID, Q1, VT from ESTOQ where PROD is not null and Q1 > 0 order by PROD");
           //resultset = statement.executeQuery("select PROD, CODPROD, UNID, Q1, VT from ESTOQ where GRUPO='0005' and PROD is not null and Q1 > 0 order by PROD");
           //resultset = statement.executeQuery("select PROD, CODPROD, UNID, Q1, VTATACADO from ESTOQ where PROD is not null and Q1 > 0 and VTATACADO <> 0.00 order by PROD");
           while(resultset.next())
           {
        	        //out.print(resultset.getString("prod")+"#");
                    out.print(resultset.getString("prod")+"@");
                    out.print(resultset.getString("codprod")+"$");
                    out.print(resultset.getString("unid")+"|");
                    //String qtStr = resultset.getString("q1").replace( "." , ""); //tira ponto  
                    //int qtInt = Integer.parseInt(resultset.getString("q1"));
                    //int qtInt = Integer.parseInt(qtStr);
                    out.print(resultset.getString("q1")+"{");
                    //out.print(String.valueOf(qtInt)+";");
                    out.print(resultset.getString("vt")+"}#");
                    //out.print(resultset.getString("vt")+ "<br/>");
                    

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