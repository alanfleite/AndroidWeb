package br.com.datasol.auxilio;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class FormatarCampos {

	public String campoMoeda(String valor){
		/*
		double valorD = 0;
		valorD = Double.parseDouble(valor);

		NumberFormat nf = NumberFormat.getCurrencyFormat();
		String valorFormatado = nf.format(valorD);

		return valorFormatado;		
	}

	public String campoMoeda1(String valor){
		double valorD = 0;
		valorD = Double.parseDouble(valor);

		NumberFormat nf = NumberFormat.getFormat("####0.00");
		String valorFormatado = nf.format(valorD);

		return valorFormatado;
		*/
		return null;
	}

	public String campoNumericoGravar(String valor){
		String valorFormatado;

		if(valor == null || valor.toString().trim().equals("")){  
			valorFormatado = "0.0";	   
		} else { 
			valorFormatado = valor.replace(",", ".");
		}
		return valorFormatado;		
	}

	public String campoDuasDecimal(String valor){
/*		
		double valorD = 0;
		valorD = Double.parseDouble(valor);

		NumberFormat nf = NumberFormat.getFormat("####0.00");
		//ou    NumberFormat nf = NumberFormat.getFormat("00.000000");	    
		String valorFormatado = nf.format(valorD);

		return valorFormatado;
*/				
		return null;		
	}

	public String horaAtual(){
		String horaAtual = null;
	 	Date d = new Date();
	 	horaAtual = DateFormat.getTimeInstance().format(d);
		
		return horaAtual;
	}
	
	public String dataAtual(){
		String dataAtual = null;		
	 	Date d = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(d);

		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		dataAtual =  df.format(c.getTime());
		
		return dataAtual;
	}	
	
	public String dataAtualFirebird(){
		String dataAtual = null;		
	 	Date d = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(d);

		//DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		//dataAtual =  df.format(c.getTime());
		DateFormat df = DateFormat.getDateInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		dataAtual =  sdf.format(c.getTime());
		
		return dataAtual;
	}
	
	public String dataGravarFirebird(String dataStr){	
		String ano = dataStr.substring(0, 4);
		String mes = dataStr.substring(5, 7);
		String dia = dataStr.substring(8, 10);
		String dataFiribird = dia + "." + mes + "." + ano;

		return dataFiribird;
	}	
	
	public String dataAtualSomar(){
		String dataAtual1 = null;
	 	Date d = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(d);

		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		dataAtual1 =  df.format(c.getTime());


		c.add(Calendar.DAY_OF_YEAR,5 );//adicionamos 5 dias a data aual
		c.add(Calendar.MONTH,3 );//adicionamos 3 mêses a data atual
		c.add(Calendar.YEAR,1 );//adicionamos 1

		return dataAtual1;
	}
}
