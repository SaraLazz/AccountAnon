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

    <script src="https://unpkg.com/@metamask/detect-provider/dist/detect-provider.min.js"></script>



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

						
							<s:text name="text.testo2" />
								<button id="button" class="btn_1" onClick="myFunction1()"><s:text name="button1" /></button>
							<s:hidden value="%{challenge}" name="challenge" id="challenge"/>
							<s:hidden value="%{eth_address}" name="eth_address" id="eth_address"/>
							
							<br>
							<br>
							<div id="ErrorMex" style="display:none"> <h3><s:text name="error.mex1"/></h3></div>
							
							<!-- <a href="${pageContext.request.contextPath}/prodotti/ListaAlberi"
								class="btn_1"></a> -->

						</div>

					</div>

				</div>

			</div>

		</div>
		 <!--   <div class="banner_img">
             <img src="${pageContext.request.contextPath}/img/banner.jpg" class="img-fluid">
            </div> -->
            
              <div class="banner_img">
             <img src="${pageContext.request.contextPath}/img/single_blog_1.jpg" class="img-fluid">
            </div>
		
	</section>

	



	<script>
	
	let currentAccount=null;
	let eth_address=null;
	let challenge=null;

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

async function myFunction1() {
	document.getElementById("button").disabled = true;
	eth_address=document.getElementById("eth_address").value;
	challenge=document.getElementById("challenge").value;
	console.log("eth="+eth_address);
	console.log(challenge);
	start();
}

	async function start(){
		
		const provider = await detectEthereumProvider();
		if (provider) {
		  startApp(provider); // Initialize your app
		 
		  /***********************************************************/
		  /* Handle user accounts and accountsChanged (per EIP-1193) */
		  /***********************************************************/
	// Note that this event is emitted on page load.
	// If the array of accounts is non-empty, you're already
	// connected.
		  
		  ethereum
		    .request({ method: 'eth_accounts' })
		    .then(handleAccountsChanged)
		    .catch((err) => {
		      // Some unexpected error.
		      // For backwards compatibility reasons, if no accounts are available,
		      // eth_accounts will return an empty array.
		      console.error(err);
		    });
		  ethereum.on('accountsChanged', handleAccountsChanged);
		  
		} else {
		  alert('Please install MetaMask!');
		}	
	}
	//import detectEthereumProvider from '@metamask/detect-provider';

	// this returns the provider, or null if it wasn't detected
	

function startApp(provider) {
	  // If the provider returned by detectEthereumProvider is not the same as
	  // window.ethereum, something is overwriting it, perhaps another wallet.
	  if (provider !== window.ethereum) {
	    console.error('Do you have multiple wallets installed?');
	  }
	  // Access the decentralized web!
	}
	
	
//For now, 'eth_accounts' will continue to always return an array
function handleAccountsChanged(accounts) {
  if (accounts.length === 0) {
    // MetaMask is locked or the user has not connected any accounts
    console.log('Please connect to MetaMask.');
    alert("Please connect to MetaMask and choose a chain.");
  } else if (accounts[0] !== currentAccount) {
    currentAccount = accounts[0];
    console.log("curr="+currentAccount)
    //send to the server current account
   if(currentAccount.toLowerCase()==eth_address.toLowerCase()){
	   //PROCEDI!
	   document.getElementById("ErrorMex").style.display="none";
	   myFunction();
   }else{
	   //LOG IN WITH A DIFFERENT ACCOUNT
	   console.log("LOG IN WITH A DIFFERENT ACCOUNT");
 	   document.getElementById("ErrorMex").style.display="inline";
   }
    
  }
}


async function myFunction() {
		
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
		var hash=web3.utils.soliditySha3(challenge);
			
		console.log(challenge);
		
		var contract = new web3.eth.Contract(ABI,contract_address);
		contract.methods.solveChallenge(hash).send({from: currentAccount })
		.on('confirmation', function(confirmationNumber, receipt){
			console.log(receipt);
			console.log(confirmationNumber);
            //alert("Transaction succesfully executed");
            window.location.href = "Subscribe.action";
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
		      await contract.solveChallenge(hash).then(function(){
		            alert("Transaction succesfully executed");
		            await contract.stateMap(currentAccount).then((result) =>{
			    		console.log("result="+result);
			    		if(result=="Confirmed"){
			    			 window.location.href = "Subscribe.action";
			    		}
			    		else{
			    			window.alert("ERROR!");
			    		}
		            };
		      });
		    } catch (error) {
		      console.log(error);
		    } */
}


</script>



</body>
</html>