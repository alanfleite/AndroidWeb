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
      for(int i = 1; i < 800; i++){
          String sql = "insert into cad_cli (cod, usuario, razao, ende, ende_num, fone, cel, bairro, descida, uf," + 
                       " cnpj, cpf) values " +
                       "(" + i + ", 'Teste de Cliente novo DATASOL Cade " + i + "', 'Teste de Cliente novo razao Cade " + i + 
               	       "', 'Av. Tubirio Odilon Ribeiro', '873', '06934516563', '06984440854', 'Jd Oliveiras'," + 
                       " 'Pimenta Bueno', 'RO', '01.123.456/0001-98', '123.456.789-12')";
          statement.executeUpdate(sql);

      }
//      try
//      {
    	  
//           Class.forName(driver);
//           conexao = DriverManager.getConnection(url, usuario, senha);
           //System.out.println("conectou legal com o PostgreSQL");
//           statement = conexao.createStatement();
           
           //for(int i = 1; i < 1000; i++){
        	   //for (int lendo = 0; lendo < result.size(); lendo++) {
//               String sql = "insert into cad_cli (cod, usuario, ende, ende_num, cel, bairro, descida, uf, cnpj, cpf) values " +
//                       "(" + i + ", 'Teste de Cliente novo DATASOL Cade " + i + "', 'Av. Tubirio Odilon Ribeiro', '873'," +
//                       "'06984440854', 'Jd Oliveiras', 'Pimenta Bueno', 'RO', '01.123.456/0001-98', '123.456.789-12')";
//               statement.executeUpdate(sql);
//           }
 //          int gravou = statement.executeUpdate(sql);

// if (gravou == 1)
//              out.print("1");
//           else
//              out.print("0");
//            }
//      }
      
//            catch(Exception erro)
//            {
//               out.print(erro+"0");
//            }

%>