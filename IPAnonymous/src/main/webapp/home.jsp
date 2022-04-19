<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

<title></title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/ethjs@0.3.4/dist/ethjs.min.js"></script>
<script src="https://cdn.ethers.io/lib/ethers-5.2.umd.min.js" type="application/javascript"></script>



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon"
	href="${pageContext.request.contextPath}/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-5">
					<div class="banner_text">
						<div class="banner_text_iner">

						
							<s:text name="text.testo1" />
								<button id="button" class="btn_1" onClick="myFunction()"><s:text name="button1" /></button>
							<s:hidden value="%{challenge}" name="challenge" id="challenge"/>
							
							<!-- <a href="${pageContext.request.contextPath}/prodotti/ListaAlberi"
								class="btn_1"></a> -->

						</div>

					</div>

				</div>

			</div>

		</div>
		  <div class="banner_img">
             <img src="${pageContext.request.contextPath}/img/banner.jpg" class="img-fluid">
            </div>
		
	</section>

	



	<script>

//you probably won't need it except for debugging
//in most cases.
function toHex(bytes) {
  return Array.from(
    bytes,
    byte => byte.toString(16).padStart(2, "0")
  ).join("");
}

// You almost certainly want UTF-8, which is
// now natively supported:
function stringToUTF8Bytes(string) {
  return new TextEncoder().encode(string);
}



async function myFunction() {
	var startTime = performance.now()
	
	document.getElementById("button").disabled = true;
			
	if(window.ethereum){
		console.log("Metamask ok!")
		const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
		const account_eth1 = accounts[0];
		console.log("account_eth1="+account_eth1);
		var challenge = document.getElementById("challenge").value;
		console.log("challenge="+challenge);
		
		const ABI = 
			[
				{
					"inputs": [],
					"stateMutability": "nonpayable",
					"type": "constructor"
				},
				{
					"inputs": [
						{
							"internalType": "string",
							"name": "a",
							"type": "string"
						},
						{
							"internalType": "string",
							"name": "b",
							"type": "string"
						}
					],
					"name": "compareStrings",
					"outputs": [
						{
							"internalType": "bool",
							"name": "",
							"type": "bool"
						}
					],
					"stateMutability": "view",
					"type": "function"
				},
				{
					"inputs": [
						{
							"internalType": "address",
							"name": "user",
							"type": "address"
						},
						{
							"internalType": "bytes32",
							"name": "challenge",
							"type": "bytes32"
						}
					],
					"name": "setChallenge",
					"outputs": [],
					"stateMutability": "nonpayable",
					"type": "function"
				},
				{
					"inputs": [
						{
							"internalType": "bytes32",
							"name": "solution",
							"type": "bytes32"
						}
					],
					"name": "solveChallenge",
					"outputs": [],
					"stateMutability": "nonpayable",
					"type": "function"
				},
				{
					"inputs": [
						{
							"internalType": "address",
							"name": "",
							"type": "address"
						}
					],
					"name": "stateMap",
					"outputs": [
						{
							"internalType": "string",
							"name": "",
							"type": "string"
						}
					],
					"stateMutability": "view",
					"type": "function"
				}
			]
			
		
		   const contract_address= "0x646368Aa304379E42fC85734Ddfb0Fad0D780C3C"
		   
		web3 = new Web3(web3.currentProvider)
		var hash=web3.utils.soliditySha3("Identity_User"+challenge);
			
		var contract = new web3.eth.Contract(ABI,contract_address);
		
		var endTime = performance.now()
		console.log(endTime-startTime);
		
		contract.methods.solveChallenge(hash).send({from: account_eth1 })
		.on('confirmation', function(confirmationNumber, receipt){
			console.log(receipt);
			console.log(confirmationNumber);
            //alert("Transaction succesfully executed");
            return;
		})
		.on('error', function(error, receipt) {
			console.log(error);
			console.log(receipt);
			return;
		});
			
		/* const provider = new ethers.providers.Web3Provider(window.ethereum);
		 const signer = provider.getSigner();
		 const contract = new ethers.Contract(contract_address, ABI, signer);
		   try {
		      await contract.solveChallenge(hash).then((transaction_hash)=>{
		    	  	console.log(transaction_hash);
		            alert("Transaction succesfully executed");
		      });
		    } catch (error) {
		      console.log(error);
		    } */

	}
	else{
		console.error("Install Metamask!") 
	}
}


</script>



</body>
</html>