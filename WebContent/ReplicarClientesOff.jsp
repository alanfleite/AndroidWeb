<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	String driver = "org.firebirdsql.jdbc.FBDriver";
	String url = "jdbc:firebirdsql:localhost/3050:C:/datasol/database/datasol.GDB";
	String usuario = "SYSDBA";
	String senha = "masterkey";
	Connection conexao;
	Statement statement, statement1, statement2;
	ResultSet resultset, resultset1, resultset2;
	String vendedor = request.getParameter("vendedor");
	
//	System.out.println("Vendedor" +  vendedor);
	
	String idvendedor = null;
	Integer id = null;
	ArrayList<String> listaCidades1 =  new ArrayList();
//	List listaCidades = null;	

//buscando id do vendedor	
	try {
		Class.forName(driver);
		conexao = DriverManager.getConnection(url, usuario, senha);
		//out.println("conectou legal com o MySQL");
		statement = conexao.createStatement();
		resultset = statement.executeQuery("select ID from CADVENDEDOR where NOME='"	+ vendedor + "'");
		
		while (resultset.next()){
			id = resultset.getInt("ID");
//			System.out.println("ID Vendedor" +  id);
		}		
		
//buscando cidades do vendedor		
			statement1 = conexao.createStatement();
			resultset1 = statement1.executeQuery("select ATENDECIDADE from CADVENDEDORD where IDCADVENDEDOR=" + id);

			while (resultset1.next())
			{
//				System.out.println("cidade Vendedor " +  resultset1.getString("atendecidade"));
				 //String cidade = resultset1.getString("atendecidade");
				 //listaCidades.add(resultset1.getString("atendecidade"));
				 listaCidades1.add(resultset1.getString("atendecidade"));
			}	
	} catch (ClassNotFoundException Driver) {
		out.print("Driver não localizado: " + Driver);
	} catch (SQLException Fonte) {
		out.print("Deu erro na conexão " + "com a fonte de dados: "	+ Fonte);
	}

    try{
    	Class.forName(driver);
		conexao = DriverManager.getConnection(url, usuario, senha);
	
			int n = listaCidades1.size();
			
			if (n==0){
				statement2 = conexao.createStatement();
				resultset2 = statement2.executeQuery("select COD, USUARIO, RAZAO, CNPJ, PARCELAATRAZO, DESCIDA from CAD_CLI where USUARIO is not null order by USUARIO");

				//resultset = statement.executeQuery("select USUARIO, RAZAO, ENDE, ENDE_NUM, FONE, CEL, BAIRRO, DESCIDA, UF, CNPJ,"
				//	   + " CPF from CAD_CLI where USUARIO is not null order by USUARIO");

//				 System.out.println("cidade Vendedor 1 " +  resultset1.getString("atendecidade"));			
				while (resultset2.next()) {
					out.print(resultset2.getString("COD")+"{");
					out.print(resultset2.getString("USUARIO") + "|");
					out.print(resultset2.getString("RAZAO") + "@");
					//out.print(resultset.getString("ende")+"|");
					//out.print(resultset.getString("ende_num")+"¨");
					//out.print(resultset.getString("fone")+"/");
					//out.print(resultset.getString("cel")+"{");
					//out.print(resultset.getString("bairro")+"*");
					//out.print(resultset.getString("uf")+"$");
					//out.print(resultset.getString("cnpj")+"@");
					//out.print(resultset.getString("cpf")+"}#");
					out.print(resultset2.getString("CNPJ") + "$");
					out.print(resultset2.getString("PARCELAATRAZO") + "*");
					out.print(resultset2.getString("DESCIDA") + "%#");
				}				
			} else{
			    for (int i=0; i<n; i++) {
//			      System.out.printf("Posição %d- %s\n", i, listaCidades1.get(i));
			      
//					 System.out.println("cidade Vendedor " +  resultset1.getString("atendecidade"));
//					 String cidade = resultset1.getString("atendecidade");
					 
					statement2 = conexao.createStatement();
					resultset2 = statement2.executeQuery("select COD, USUARIO, RAZAO, CNPJ, PARCELAATRAZO, DESCIDA from CAD_CLI where DESCIDA='" 
					             + listaCidades1.get(i) + "' and USUARIO is not null order by USUARIO");

					//resultset = statement.executeQuery("select USUARIO, RAZAO, ENDE, ENDE_NUM, FONE, CEL, BAIRRO, DESCIDA, UF, CNPJ,"
					//	   + " CPF from CAD_CLI where USUARIO is not null order by USUARIO");

//					 System.out.println("cidade Vendedor 1 " +  resultset1.getString("atendecidade"));			
					while (resultset2.next()) {
						out.print(resultset2.getString("COD")+"{");
						out.print(resultset2.getString("USUARIO") + "|");
						out.print(resultset2.getString("RAZAO") + "@");
						//out.print(resultset.getString("ende")+"|");
						//out.print(resultset.getString("ende_num")+"¨");
						//out.print(resultset.getString("fone")+"/");
						//out.print(resultset.getString("cel")+"{");
						//out.print(resultset.getString("bairro")+"*");
						//out.print(resultset.getString("uf")+"$");
						//out.print(resultset.getString("cnpj")+"@");
						//out.print(resultset.getString("cpf")+"}#");
						out.print(resultset2.getString("CNPJ") + "$");
						out.print(resultset2.getString("PARCELAATRAZO") + "*");
						out.print(resultset2.getString("DESCIDA") + "%#");
					}
			    }
			}
	
	} catch (ClassNotFoundException Driver) {
		out.print("Driver não localizado: " + Driver);
	} catch (SQLException Fonte) {
		out.print("Deu erro na conexão " + "com a fonte de dados: "	+ Fonte);
	}
	out.println("^");
%>