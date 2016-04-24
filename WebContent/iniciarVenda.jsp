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
      int ID=0;
      
      FormatarCampos fc = new FormatarCampos();
      String data = fc.dataAtual();
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
           String sqlID = "select max(cod) as codigo from REC";
    	   resultset = statement.executeQuery(sqlID);    	
//  			System.out.println("sql ID" + sqlID);    	   
    	   while (resultset.next()) {
   			ID = Integer.parseInt(resultset.getString("codigo"));
   			System.out.println("sql ID" + sqlID + "ID " + ID);
   		}
           
           statement = conexao.createStatement();
           String sql = "insert into REC (COD, restaurante, cliente, data, datai_restaurante, horai_restaurante, mesanum,"
        		      + "garcom_restaurante) values (" + String.valueOf(ID = ID + 1) 
        		   	  + ", 'S', '" + request.getParameter("mesa") + "', '" + data + "', '" + data + "', '" + hora 
        		   	  + "', '" + request.getParameter("mesa") + "', '" + request.getParameter("garcom") + "')";
  			System.out.println("sql " + sql);
           int gravou = statement.executeUpdate(sql);
           if (gravou == 1)
              //out.print("1");
        	   out.print(ID);
           else
              out.print("0");
            }
            catch(Exception erro)
            {
               out.print(erro+"0");
            }

%>