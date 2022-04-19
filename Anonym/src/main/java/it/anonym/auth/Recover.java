package it.anonym.auth;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.math.BigInteger;
import java.util.Map;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.Hash;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.gas.StaticGasProvider;
import org.web3j.utils.Numeric;

import com.opensymphony.xwork2.ActionSupport;

import it.anonym.bean.Cliente;
import it.anonym.util.SmartContract;

public class Recover extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private String eth_address;
	private String challenge;
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
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getEth_address() {
		return eth_address;
	}

	public void setEth_address(String eth_address) {
		this.eth_address = eth_address;
	}
	
	
	public String getChallenge() {
		return challenge;
	}

	public void setChallenge(String challenge) {
		this.challenge = challenge;
	}

	public String execute() {
		return SUCCESS;
	}

	
	public String generateChallenge(){
		try {
			
			//Generate Challenge
			challenge = RandomStringUtils.random(20, true, true);
			byte[]chall=Hash.sha3(Hash.sha3((challenge).getBytes()));
			
			//Send Challenge to SmartContract
			String contractAddr="0x646368Aa304379E42fC85734Ddfb0Fad0D780C3C";
			String endPoint = "https://ropsten.infura.io/...";
			String privateEthKeyIP="...";
			Credentials credsIP = Credentials.create(privateEthKeyIP);
			StaticGasProvider SGP=new StaticGasProvider(BigInteger.valueOf(4_100_000_000L*10),new BigInteger("999999"));
			Web3j web3 = Web3j.build(new HttpService(endPoint));
			SmartContract contract= SmartContract.load(contractAddr, web3, credsIP, SGP );
			
			//String outcome1=contract.stateMap(eth_address).send();
			//System.out.println("BEFORE Transaction outcome:"+outcome1);
			
			TransactionReceipt receipt=null;
			receipt=contract.setChallenge(eth_address, Numeric.hexStringToByteArray(bytesToHex(chall))).send();
			System.out.println("Transaction hash:"+receipt.getTransactionHash());
			//String outcome=contract.stateMap(eth_address).send();
			//System.out.println("AFTER Transaction outcome:"+outcome);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String endRecover() {
		System.out.println("TRANSACTION EXECUTED!");
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
			Cliente cliente = (Cliente) oi.readObject();
			oi.close();
			fi.close();
			
			//LOGIN CON SUCCESSO
			session.put("cliente", cliente);
			if(nextAction!=null && !nextAction.equals("")) return "next";
			return SUCCESS;

		} catch (FileNotFoundException e) {
			System.out.println("File not found");
			return ERROR;
		} catch (IOException e) {
			System.out.println("Error initializing stream");
			//this.addActionError(this.getText("login.error"));
			//return INPUT;
			return ERROR;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}
	
	

	private static String bytesToHex(byte[] hash) {
		StringBuilder hexString = new StringBuilder(2 * hash.length);
		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if(hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}




}
