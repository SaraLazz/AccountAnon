package it.anonym.auth;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import it.anonym.bean.Cliente;



public class VerificaCredenzialiInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L; 

	private static final Logger logger = LogManager.getLogger("VerificaCredenzialiInterceptor");

	public void destroy() { 
	}
	public void init() { 
	}

	public String intercept( ActionInvocation actionInvocation ) throws Exception {
		Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
		logger.info("Check credenziali avviato!");

		Cliente cliente = (Cliente) session.get( "cliente" ); 

		/*if(cliente.getNome()==null || cliente.getNome().equals("")){
			return "checkCredentials";
		}*/

		return actionInvocation.invoke();

	}
}
