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
      String vendedor = request.getParameter("vendedor");
      
      try
      {
           Class.forName(driver);
           conexao = DriverManager.getConnection(url, usuario, senha);  
           //out.println("conectou legal com o MySQL");
           statement = conexao.createStatement();
           //resultset = statement.executeQuery("select USUARIO, RAZAO, CNPJ, DESCIDA from CAD_CLI where USUARIO is not null order by USUARIO");
           
           resultset = statement.executeQuery("select USUARIO, RAZAO, CNPJ, DESCIDA from CAD_CLI where USUARIO is not null order by USUARIO");
           
           //resultset = statement.executeQuery("select USUARIO, RAZAO, ENDE, ENDE_NUM, FONE, CEL, BAIRRO, DESCIDA, UF, CNPJ,"
        	//	   + " CPF from CAD_CLI where USUARIO is not null order by USUARIO");
           while(resultset.next())
        	   
           {
                    out.print(resultset.getString("USUARIO")+ "|");
                    out.print(resultset.getString("RAZAO") + "@");
                    //out.print(resultset.getString("ende")+"|");
                    //out.print(resultset.getString("ende_num")+"¨");
                    //out.print(resultset.getString("fone")+"/");
                    //out.print(resultset.getString("cel")+"{");
                    //out.print(resultset.getString("bairro")+"*");
                    //out.print(resultset.getString("uf")+"$");
                    //out.print(resultset.getString("cnpj")+"@");
                    //out.print(resultset.getString("cpf")+"}#");
                    out.print(resultset.getString("CNPJ")+"$");
                    out.print(resultset.getString("DESCIDA")+"%#");
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