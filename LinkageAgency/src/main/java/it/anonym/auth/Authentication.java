package it.anonym.auth;

import java.util.List;

import org.apache.commons.lang.RandomStringUtils;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.Hash;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.gas.StaticGasProvider;
import org.web3j.utils.Numeric;

import com.opensymphony.xwork2.ActionSupport;

import it.anonym.util.EthersUtils;
import it.anonym.util.SmartContract;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.security.Security;

public class Authentication extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String eth1_address;
	private String eth2_address;
	private String token;
	private String signature;
	private String challenge;
	//private String status;
	
	private List<String> accountList;
	//private static final Logger logger = LogManager.getLogger("AuthAction");
	/*private Account account;
	private Map<String,Object> session;
	private String nextAction;*/
	
	
	public List<String> getAccountList() {
		return accountList;
	}

	public void setAccountList(List<String> accountList) {
		this.accountList = accountList;
	}

	public String getChallenge() {
		return challenge;
	}
	public void setChallenge(String challenge) {
		this.challenge = challenge;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	public String getEth1_address() {
		return eth1_address;
	}

	public void setEth1_address(String eth_address) {
		this.eth1_address = eth_address;
	}
	

	public String getEth2_address() {
		return eth2_address;
	}

	public void setEth2_address(String eth2_address) {
		this.eth2_address = eth2_address;
	}

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
	public String step1(){
		long end1 = System.currentTimeMillis();  
		//String myAccount="0xa6B4facfc34E00467DA293deC27cA9f4C93b1615";
		String contractAddr="0x646368Aa304379E42fC85734Ddfb0Fad0D780C3C";
		String endPoint = "https://ropsten.infura.io/...";
		String privateEthKeyIP="...";
		Credentials credsIP = Credentials.create(privateEthKeyIP);
		StaticGasProvider SGP=new StaticGasProvider(BigInteger.valueOf(4_100_000_000L*10),new BigInteger("999999"));
		Web3j web3 = Web3j.build(new HttpService(endPoint));
		SmartContract contract= SmartContract.load(contractAddr, web3, credsIP, SGP );
		
		for(String account:accountList) {
			try {
				String outcome=contract.stateMap(account).send();
				System.out.println("Transaction outcome:"+outcome);
				if(outcome.equals("Confirmed")) {
					eth1_address=account;
					token = RandomStringUtils.random(20, true, true);
				}
				else {
					//DO NOTHING
				}
				//eth1_address=account;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return ERROR;
			}
			//System.out.println("Transaction hash:"+receipt.getTransactionHash());
			
		}
		long end2 = System.currentTimeMillis();  
		System.out.println(end2-end1);
		return SUCCESS;
	}
	
	
	public String step2() {
		long end1 = System.currentTimeMillis();
		String temp_eth_address=EthersUtils.verifyMessage(token,signature);
		if(eth1_address.equals(temp_eth_address)) {
			try {
				challenge=eth1_address + eth2_address + token + signature;
				byte[]chall=Hash.sha3(Hash.sha3((challenge).getBytes()));
				//Send Challenge to SmartContract
				String contractAddr="0x646368Aa304379E42fC85734Ddfb0Fad0D780C3C";
				String endPoint = "https://ropsten.infura.io/...";
				String privateEthKeyIP="...";
				Credentials credsIP = Credentials.create(privateEthKeyIP);
				StaticGasProvider SGP=new StaticGasProvider(BigInteger.valueOf(4_100_000_000L*10),new BigInteger("999999"));
				Web3j web3 = Web3j.build(new HttpService(endPoint));
				SmartContract contract= SmartContract.load(contractAddr, web3, credsIP, SGP );
				TransactionReceipt receipt=null;
				long end2 = System.currentTimeMillis();
				System.out.println(end2-end1);
				receipt=contract.setChallenge(eth2_address, Numeric.hexStringToByteArray(bytesToHex(chall))).send();
				System.out.println("Transaction hash:"+receipt.getTransactionHash());
				return SUCCESS;
				
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
		}
		else {
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
