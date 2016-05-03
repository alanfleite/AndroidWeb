<%@page import="br.com.datasol.auxilio.FormatarCampos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%    
      //System.out.println(request.getParameter("dataems"));
      FormatarCampos fc = new FormatarCampos();
      //String data = fc.dataGravarFirebird(request.getParameter("dataems"));
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
           
           resultset = statement.executeQuery("select max(cod) as total from cad_cli");
   		int id=0;
   		int idSomado=0;
   		while (resultset.next()){
   			id = resultset.getInt("total");
   			idSomado = id + 1;
//   			System.out.println("ID Vendedor" +  id);
   		}
   		
           
           //resultset = statement.executeQuery("select USUARIO from CAD_CLI where USUARIO is not null order by USUARIO");
  
  //String data = fc.dataGravarFirebird(request.getParameter("dataems"));

           String sql = "insert into CAD_CLI (cod, usuario, razao, ende, ende_num, fone, cel, bairro, descida, uf, cnpj, rg, inscest," 
                      + "email, contato, cpf) values (" + idSomado + ", '"
                                     + request.getParameter("usuario") + "', '"
				                     + request.getParameter("razao") + "', '"
			         	      		 + request.getParameter("ende") + "', '"
  	       	    	  	  		     + request.getParameter("ende_num") + "', '"
  				          		     + request.getParameter("fone") + "', '"
				          		     + request.getParameter("cel") + "', '"
			        	  		     + request.getParameter("bairro") + "', '"
			        	  		     + request.getParameter("cidade") + "', '"
  	        	  		    		 + request.getParameter("uf") + "', '"
  	        	  		    		 + request.getParameter("cnpj") + "', '"
  	        	  		    		 + request.getParameter("rg") + "', '"
  	        	  		    		 + request.getParameter("inscest") + "', '"
  	        	  		    		 + request.getParameter("email") + "', '"
  	        	  		    		 + request.getParameter("contato") + "', '"
  	        	  		    		 + request.getParameter("cpf") + "');";
			        	  		     
			        	  
	//System.out.println("sql " + sql + " - cod " + idSomado);        	  
  
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