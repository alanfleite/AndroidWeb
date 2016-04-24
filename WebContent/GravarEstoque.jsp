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
      
      Class.forName(driver);
      conexao = DriverManager.getConnection(url, usuario, senha);
      //System.out.println("conectou legal com o PostgreSQL");
      statement = conexao.createStatement();
      
      for(int i = 1; i < 4; i++){
          String sql = "insert into estoq (cod, prod, codprod, unid, q1, vt) values " +
                       "(" + i + ", 'Teste de Produto louco " + i + "', '1234-" + i + "', 'UN', 200, 10.15)";
          statement.executeUpdate(sql);

      }
%>