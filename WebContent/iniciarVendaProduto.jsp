<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

	  String driver = "org.firebirdsql.jdbc.FBDriver";      
	  String url = "jdbc:firebirdsql:localhost/3050:C:/datasol/database/datasol.GDB";
	  String usuario = "SYSDBA";
      String senha   = "masterkey";
      
      Date hoje = new Date();
      String horaAtual = null;
      String idVendaC;
      int verID=0;

      horaAtual = DateFormat.getTimeInstance().format(hoje);
      
      
      Connection conexao;
      Statement statement;
      ResultSet resultset;
      try
      {
           Class.forName(driver);
           conexao = DriverManager.getConnection(url, usuario, senha);
           //System.out.println("conectou legal com o PostgreSQL");
           if (verID == 0){
               statement = conexao.createStatement();
               String sqlBuscarVenda = "select cod, cliente from rec where restaurante = 'S' and alter table rec add usada_restaurante = 'N' and mesanum = " 
                                        + request.getParameter("mesa") + " and garcom_restaurante" + ", '" 
                                        + request.getParameter("garcom") + "')";
                                        
    			resultset = statement.executeQuery(sqlBuscarVenda);
    			if (resultset.next()){
    				idVendaC = resultset.getString(0);
    				System.out.println("id " + resultset.getString(0));
    			}
    			verID++;
           }
                                    
           statement = conexao.createStatement();
           String sql = "insert into prod_vend (restaurante, data, datai_restaurante, horai_restaurante, mesanum, garcom) values " +
                        "('S', " + hoje + ", " + hoje + ", " + horaAtual + ", '" + request.getParameter("mesa") + 
                		", '" + request.getParameter("garcom") + "')";
           int gravou = statement.executeUpdate(sql);
           if (gravou == 1)
              out.print("1");
           else
              out.print("0");
            }
            catch(Exception erro)
            {
               out.print(erro+"0");
            }
      
      public void inserirProduto(){
          try
          {
                   statement = conexao.createStatement();
                   String sqlInserirProduto = "select cod, cliente from rec where restaurante = 'S' and alter table rec add usada_restaurante = 'N' and mesanum = " 
                                            + request.getParameter("mesa") + " and garcom_restaurante" + ", '" 
                                            + request.getParameter("garcom") + "')";
                                            
        			resultset = statement.executeQuery(sqlBuscarVenda);
        			if (resultset.next()){
        				idVendaC = resultset.getString(0);
        				System.out.println("id " + resultset.getString(0));
        			}
        			verID++;
               }
                                        
               statement = conexao.createStatement();
               String sql = "insert into prod_vend (restaurante, data, datai_restaurante, horai_restaurante, mesanum, garcom) values " +
                            "('S', " + hoje + ", " + hoje + ", " + horaAtual + ", '" + request.getParameter("mesa") + 
                    		", '" + request.getParameter("garcom") + "')";
               int gravou = statement.executeUpdate(sql);
               if (gravou == 1)
                  out.print("1");
               else
                  out.print("0");
                }
                catch(Exception erro)
                {
                   out.print(erro+"0");
                }

      }

%>