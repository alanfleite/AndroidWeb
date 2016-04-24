<%@page import="br.com.datasol.auxilio.FormatarCampos"%>
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
           //resultset = statement.executeQuery("select USUARIO from CAD_CLI where USUARIO is not null order by USUARIO");
           
           String sql = "insert into PROD_VENDMOVEL (prod, q1, vl_u, vl_t, codvend, vendedor, exportada)" 
  		           + " values ('" + request.getParameter("prod") + "', '"
				                  + request.getParameter("q1") + "', '"
			       	      		  + request.getParameter("vl_u") + "', "
  	       	    		  		  + request.getParameter("vl_t") + ", "
  				          		  + request.getParameter("codvend") + ", '"
			        	  		  + request.getParameter("vendedor") + "', '"
			        	  		  + "N');";
  
           int gravou = statement.executeUpdate(sql);
           if (gravou == 1){
        	   out.print("1");
           }
           else
              out.print("0");
            }
            catch(Exception erro)
            {
              out.print(erro + "0");
            }
%> 