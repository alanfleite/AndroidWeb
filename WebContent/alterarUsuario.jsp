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
           //System.out.println("conectou legal com o PostgreSQL");
           statement = conexao.createStatement();
           String sql = "update usuarios set nome = '"+request.getParameter("usuarionovo")+
                   "', senha = '"+request.getParameter("senha")+"' "+
                   " where usuario = '"+ request.getParameter("usuariovelho")+"'";
           int alterar = statement.executeUpdate(sql);
           if (alterar == 1)
              out.print("1");
           else
              out.print("0");
            }
            catch(Exception erro)
            {
               out.print(erro+"0");
            }

%>