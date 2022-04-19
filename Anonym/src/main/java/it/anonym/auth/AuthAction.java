package it.anonym.auth;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import it.anonym.bean.Account;
import it.anonym.bean.Cliente;

public class AuthAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger("AuthAction");
	private Account account;
	private String eth_address;
	private Map<String,Object> session;
	private String nextAction;

	public String getNextAction() {
		return nextAction;
	}
	
	public void setNextAction(String nextAction) {
		this.nextAction=nextAction;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	
	public String getEth_address() {
		return eth_address;
	}

	public void setEth_address(String eth_address) {
		this.eth_address = eth_address;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String login(){
		Cliente cliente=new Cliente();
		cliente.setAccount(account);
		//cliente.setEth_address(eth_address);
		
		try {
			File myObj = new File("myObjects.txt");
		      if (myObj.createNewFile()) {
		        System.out.println("File created: " + myObj.getName());
		      } else {
		        System.out.println("File already exists.");
		      }
			
			
			FileInputStream fi = new FileInputStream(new File("myObjects.txt"));
			ObjectInputStream oi = new ObjectInputStream(fi);

			// Read objects
			Cliente old_cliente = (Cliente) oi.readObject();
			oi.close();
			fi.close();
			
			if(cliente.equals(old_cliente)) {
				//LOGIN CON SUCCESSO
				session.put("cliente", cliente);
				if(nextAction!=null && !nextAction.equals("")) return "next";
				return SUCCESS;
			}
			else {
				logger.warn("non ho trovato iscritti");
				this.addActionError(this.getText("login.error"));
				return INPUT;
			}

		} catch (FileNotFoundException e) {
			System.out.println("File not found");
			return ERROR;
		} catch (IOException e) {
			System.out.println("Error initializing stream");
			//logger.warn("non ho trovato iscritti");
			this.addActionError(this.getText("login.error"));
			return INPUT;
			//return ERROR;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}

	public String primaIscrizione(){
		Cliente cliente=new Cliente();
		cliente.setAccount(account);
		cliente.setEth_address(eth_address);
		
		//SERIALIZZA IN UN FILE IL CLIENT
		try {
			FileOutputStream f = new FileOutputStream(new File("myObjects.txt"));
			ObjectOutputStream o = new ObjectOutputStream(f);

			// Write objects to file
			o.writeObject(cliente);
			o.close();
			f.close();
			
			cliente.setIdcliente(1);
			session.put("cliente", cliente);
			return SUCCESS;
			
		} catch (FileNotFoundException e) {
			System.out.println("File not found");
			return ERROR;
		} catch (IOException e) {
			System.out.println("Error initializing stream");
			return ERROR;
		}
	}

}
