<%@page import="br.com.datasol.auxilio.FormatarCampos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%    
      //System.out.println(request.getParameter("dataems"));
      FormatarCampos fc = new FormatarCampos();
      String data = fc.dataGravarFirebird(request.getParameter("dataems"));
      //System.out.println("data " + data);

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
           
  //String data = fc.dataGravarFirebird(request.getParameter("dataems"));

           String sql = "insert into RECMOVEL (fantasia, razao, cnpj, tot, totg, dataems, vendedor, codvend, condpg, codcli, exportada)" 
  		              + " values ('" + request.getParameter("fantasia") + "', '"
				                     + request.getParameter("razao") + "', '"
			         	      		 + request.getParameter("cnpj") + "', "
  	       	    	  	  		     + request.getParameter("tot") + ", "
  				          		     + request.getParameter("totg") + ", '"
				          		  //+ request.getParameter("dataems") + "', '"
			          			  //+ "15.03.2014" + "', '"
			          			     + data + "', '"
			        	  		     + request.getParameter("vendedor") + "', '"
			        	  		     + request.getParameter("codvend") + "', '"
  	        	  		    		 + request.getParameter("condpg") + "', '"
  	        	  		    		 + request.getParameter("codcli") + "', '"
			        	  		     + "N');";
			        	  
	//System.out.println("sql " + sql);        	  
  
           int gravou = statement.executeUpdate(sql);
           if (gravou == 1){
        	   out.print("1");
        	   //System.out.print(request.getParameter("dataems"));
           }
           else
              out.print("0");
            }
            catch(Exception erro)
            {
              out.print(erro + "0");
            }
%> 