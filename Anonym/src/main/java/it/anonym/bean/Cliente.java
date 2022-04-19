package it.anonym.bean;

import java.util.Objects;

public class Cliente implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer idcliente;
	private String eth_address;
	private Account account;

	public Cliente() {
	}
	
	public Cliente(Account account) {
		this.account = account;
	}

	public String getEth_address() {
		return eth_address;
	}

	public void setEth_address(String eth_address) {
		this.eth_address = eth_address;
	}

	public Integer getIdcliente() {
		return this.idcliente;
	}

	public void setIdcliente(Integer idcliente) {
		this.idcliente = idcliente;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	
	@Override
	public int hashCode() {
		return Objects.hash(idcliente);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		return Objects.equals(idcliente, other.idcliente);
	}

	@Override
	public String toString() {
		return "ID:" + idcliente + "\nEth Address="+ eth_address + "\n" + account.toString();
	}
	

}
