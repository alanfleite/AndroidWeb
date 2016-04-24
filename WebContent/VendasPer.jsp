<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	String driver = "org.firebirdsql.jdbc.FBDriver";
	String url = "jdbc:firebirdsql:localhost/3050:C:/datasol/database/datasol.GDB";
	String usuario = "SYSDBA";
	String senha = "masterkey";
	Connection conexao;
	Statement statement;
	ResultSet resultset;
	try {
		Class.forName(driver);
		conexao = DriverManager.getConnection(url, usuario, senha);
		//out.println("conectou legal com o MySQL");
		String sql = "select FANTASIA, DATAEMS, TOTG, VENDEDOR from REC where VENDEDOR='" + request.getParameter("vendedor")
				+ "' and DATAEMS>='" + request.getParameter("datai")		
				+ "' and DATAEMS<='" + request.getParameter("dataf")
				+ "' order by DATAEMS";
		//out.println("sql " + sql);
		statement = conexao.createStatement();
		resultset = statement
				.executeQuery(sql);
		while (resultset.next()) {
			out.print(resultset.getString("fantasia") + "@");
			out.print(resultset.getString("dataems") + "$");
			out.print(resultset.getString("totg") + "|");
			out.print(resultset.getString("vendedor") + "}#");
		}
	} catch (ClassNotFoundException Driver) {
		out.print("Driver não localizado: " + Driver);
	} catch (SQLException Fonte) {
		out.print("Deu erro na conexão " + "com a fonte de dados: "
				+ Fonte);
	}
	out.println("^");
%>