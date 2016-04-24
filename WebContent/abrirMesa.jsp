<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.datasol.auxilio.FormatarCampos"%>

<%

	  String driver = "org.firebirdsql.jdbc.FBDriver";      
	  String url = "jdbc:firebirdsql:localhost/3050:C:/datasol/database/datasol.GDB";
	  String usuario = "SYSDBA";
      String senha   = "masterkey";
      
      FormatarCampos fc = new FormatarCampos();
      String data = fc.dataAtualFirebird();
      String hora = fc.horaAtual();
      
      Connection conexao;
      Statement statement;
      ResultSet resultset;
      try
      {
           Class.forName(driver);
           conexao = DriverManager.getConnection(url, usuario, senha);
           //System.out.println("conectou legal com o PostgreSQL");
           statement = conexao.createStatement();
           String sql = "insert into restaurantemesa (usada, datai, horai, mesanum, garcom) values " +
                   "('S', '" + data + "', '" + hora + "', '" + request.getParameter("mesa") 
                		    + "', '" + request.getParameter("garcom") + "')";
           
//           System.out.println("sql " + sql);
           int gravou = statement.executeUpdate(sql);
           if (gravou == 1){
        	   out.print("1");
        	   
        	   String sqlMesa = "update CADASTROMESA set usada='S' where mesanum=" + request.getParameter("mesa");
        	   statement.executeUpdate(sqlMesa);
//        	   System.out.println("sql Mesa " + sqlMesa);
           }
           else
              out.print("0");
            }
            catch(Exception erro)
            {
               out.print(erro + "0");
            }

%>