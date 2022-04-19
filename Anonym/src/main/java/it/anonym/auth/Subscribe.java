package it.anonym.auth;

import java.math.BigInteger;

import org.apache.commons.lang.RandomStringUtils;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.Hash;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.gas.StaticGasProvider;
import org.web3j.utils.Numeric;

import com.opensymphony.xwork2.ActionSupport;

import it.anonym.util.SmartContract;

public class Subscribe extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String eth_address;
	private String challenge;
	
	
	public String getChallenge() {
		return challenge;
	}

	public void setChallenge(String challenge) {
		this.challenge = challenge;
	}

	public String getEth_address() {
		return eth_address;
	}

	public void setEth_address(String eth_address) {
		this.eth_address = eth_address;
	}

	
	public String testAddress() {
		System.out.println("eth_address="+eth_address);
		
		String contractAddr="0x646368Aa304379E42fC85734Ddfb0Fad0D780C3C";
		String endPoint = "https://ropsten.infura.io/...";
		String privateEthKeyIP="...";
		Credentials credsIP = Credentials.create(privateEthKeyIP);
		StaticGasProvider SGP=new StaticGasProvider(BigInteger.valueOf(4_100_000_000L*10),new BigInteger("999999"));
		Web3j web3 = Web3j.build(new HttpService(endPoint));
		SmartContract contract= SmartContract.load(contractAddr, web3, credsIP, SGP );
			
			//receipt=contract.setChallenge(eth_address, Numeric.hexStringToByteArray(bytesToHex(chall))).send();
			try {
				String outcome=contract.stateMap(eth_address).send();
				System.out.println("Transaction outcome:"+outcome);
				if(outcome.equals("Confirmed")) {
					System.out.println("ADDRESS OK!");
					
					//INVIO LA CHALLENGE
					challenge = RandomStringUtils.random(20, true, true);
					byte[]chall=Hash.sha3(Hash.sha3((challenge).getBytes()));
					TransactionReceipt receipt=null;
					receipt=contract.setChallenge(eth_address, Numeric.hexStringToByteArray(bytesToHex(chall))).send();
					System.out.println("Transaction hash:"+receipt.getTransactionHash());
					
					return SUCCESS;
				}
				else {
					//return ERROR;
					return SUCCESS;
				}
				//eth1_address=account;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return ERROR;
			}
			//System.out.println("Transaction hash:"+receipt.getTransactionHash());
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
