<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/ethjs@0.3.4/dist/ethjs.min.js"></script>
<script src="https://cdn.ethers.io/lib/ethers-5.2.umd.min.js" type="application/javascript"></script>

<!-- <meta http-equiv="refresh" content="5;url=Home.action"/> -->
<!-- style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body onload="myFunction()">
	<img style="margin-left: 50%; margin-right: 50%; margin-top: 200px;"
		alt="" src="img/page-loader.gif">

	<s:form id="form" action="Home">
		<s:hidden name="eth_address" id="eth_add" value="pippo" />
	</s:form>


</body>


<script>
	async function myFunction() {
		//var startTime = performance.now()

		var form = document.getElementById("form");
		if (window.ethereum) {
			
			const accounts = await
			ethereum.request({
				method : 'eth_requestAccounts'
			});
			const account_eth1 = accounts[0];
			document.getElementById('eth_add').value = account_eth1;
		}
		//var endTime = performance.now()
		//console.log(endTime-startTime);
		form.submit();
	}
</script>
</html>