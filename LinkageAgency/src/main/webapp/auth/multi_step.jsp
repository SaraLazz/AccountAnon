<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>  
<head>  
<title> Authentication </title>    
  <meta charset="utf-8">    
  <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link href=  
'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>  
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'>
    </script>  
    <script src=  
'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'>  
    </script>  
    
    <script src="https://cdn.ethers.io/lib/ethers-5.2.umd.min.js" type="application/javascript"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
    <script src="https://unpkg.com/@metamask/detect-provider/dist/detect-provider.min.js"></script>
    
    <link rel="stylesheet" href="old.css">
    
</head>  
<!--<style>  </style> --> 
<body>  
    <div class="container">  
    <h2> <s:text name="title"/></h2> </h2>  
        <div class="row justify-content-center">  
            <div class="col-11 col-sm-9 col-md-7  
                col-lg-6 col-xl-5 text-center p-0 mt-3 mb-2">  
                <div class="px-0 pt-4 pb-0 mt-3 mb-3">  
                    <form id="form">  
                    <ul id="progressbar">  
                    <li class="active" id="step1">  
                    <strong> <s:text name="step1.name"/> </strong>  
                    </li>  
                    <li id="step2"> <strong> <s:text name="step2.name"/> </strong> </li>  
                    <li id="step3"> <strong> <s:text name="step3.name"/> </strong> </li>  
                    <li id="step4"> <strong> <s:text name="step4.name"/> </strong> </li>  
                        </ul>  
                <div class="progress">  
                <div class="pbar"> </div>  
                    </div> <br>  
                    <fieldset>  
                    <h2> <s:text name="step1.mex"/> </h2> 
                    <br>
                   <div id="ErrorMex" style="display:none"> <h2><s:text name="error.mex1"/></h2></div>
                    <!-- action="PostProcess.action" -->
                    <!--<img style="margin-left:30%; margin-right:40%; margin-top:20px;" alt="" src="../img/page-loader.gif"> -->
				<input type="button" name="next-step" id="button_step1" class="next-step" value="Next Step" disabled onclick="handleStep2()"/>  
                </fieldset>  
                <fieldset>  
        <h2> <s:text name="step2.mex"/> </h2>  
        <br>
        <div id="ErrorMex2" style="display:none"> <h2><s:text name="error.mex2"/></h2></div>
    <input type="button" name="next-step" id="button_step2" class="next-step" value="Next Step" disabled onclick="handleStep3()"/>  
    <!-- <input type="button" name="pre-step" class="pre-step" value="Pre Step" />   -->
            </fieldset>  
            <fieldset>  
            <h2> <s:text name="step3.mex"/> </h2> 
							
							<input type="button" name="next-step" id="button_step3" class="next-step" value="Final Step" disabled onclick="handleStep4()"/>  
    <!--  <input type="button" name="pre-step" class="pre-step" value="Pre Step" />  -->
        </fieldset>  
        <fieldset>  
        <div class="finish">
								<div>
									<h2 class="fs-title text-center">
									<s:text name="step4.mex"/></h2>
									<br> <br>
									<div class="row justify-content-center">
										<div class="col-3">
											<img src="https://img.icons8.com/color/96/000000/ok--v2.png"
												class="fit-image">
										</div>
									</div>
									<br> <br>
								</div>
        </div>  
    <!-- <input type="button" name="pre-step" class="pre-step" value="Pre Step" />   -->
                    </fieldset>  
                    </form>  
                </div>  
            </div>  
        </div>  
    </div>  
<script> 

$(document).ready(function () {  
	//FIRST THING-> CALL STEP1 SCRIPT
	//step1();
	
    var currentGfgStep, nextGfgStep, preGfgStep;  
    var opacity;  
    var current = 1;  
    var steps = $("fieldset").length;  
    setProgressBar(current);  
    $(".next-step").click(function () {  
        currentGfgStep = $(this).parent();  
        nextGfgStep = $(this).parent().next();  
        $("#progressbar li").eq($("fieldset")  
            .index(nextGfgStep)).addClass("active");  
        nextGfgStep.show();  
        currentGfgStep.animate({ opacity: 0 }, {  
            step: function (now) {  
                opacity = 1 - now;  
                currentGfgStep.css({  
                    'display': 'none',  
                    'position': 'relative'  
                });  
                nextGfgStep.css({ 'opacity': opacity });  
            },  
            duration: 500  
        });  
        setProgressBar(++current);  
    });  
    $(".pre-step").click(function () {  
        currentGfgStep = $(this).parent();  
        preGfgStep = $(this).parent().prev();  
        $("#progressbar li").eq($("fieldset")  
        .index(currentGfgStep)).removeClass("active");  
        preGfgStep.show();  
        currentGfgStep.animate({ opacity: 0 }, {  
            step: function (now) {  
                opacity = 1 - now;  
                currentGfgStep.css({  
                    'display': 'none',  
                    'position': 'relative'  
                });  
                preGfgStep.css({ 'opacity': opacity });  
            },  
            duration: 500  
        });  
        setProgressBar(--current);  
    });  
    function setProgressBar(currentStep) {  
        var percent = parseFloat(100 / steps) * current;  
        percentpercent = percent.toFixed();  
        $(".pbar")  
            .css("width", percent + "%")  
    }  
    $(".submit").click(function () {  
        return false;  
    })  
});  
</script>  

<script>
/*****************************************/
/* Detect the MetaMask Ethereum provider */
/*****************************************/
 
 let currentAccount = null;
 let eth1_address = null;
 let eth2_address = null;
 //let bool_step1=false;
 let token=null;
 let signature=null;
 let challenge=null;

start(); //await può essere chiamato solo dentro async function!

async function start(){
	console.log(window.location.href);
	console.log(window.history);
	 console.log(document.referrer);
	
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
	
	  /**********************************************************/
	  /* Handle chain (network) and chainChanged (per EIP-1193) */
	  /**********************************************************/
	  const chainId = await ethereum.request({ method: 'eth_chainId' });
	  handleChainChanged(chainId);
	  ethereum.on('chainChanged', handleChainChanged);
	
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


function handleChainChanged(_chainId) {
  // We recommend reloading the page, unless you must do otherwise
  //window.location.reload();
  console.log("RELOAD YOUR PAGE");
  console.log(_chainId);
  //alert("Please chose your chain.");
}

// For now, 'eth_accounts' will continue to always return an array
function handleAccountsChanged(accounts) {
	var startTime = performance.now()
  if (accounts.length === 0) {
    // MetaMask is locked or the user has not connected any accounts
    console.log('Please connect to MetaMask.');
    alert("Please connect to MetaMask and choose a chain.");
  } else if (accounts[0] !== currentAccount) {
    currentAccount = accounts[0];
    //console.log(accounts[1]);
    // Do any other work!
    console.log(accounts);
    //|| currentAccount!=eth1_address bool_step1==false  || 
    if(eth1_address==null){
    	var endTime = performance.now()
		console.log(endTime-startTime);
    	
    var ajax = new XMLHttpRequest();
        ajax.open("POST","AuthenticationStep1.action", true);
        //ajax.setRequestHeader("connection", "close");
        //ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        ajax.setRequestHeader("Content-Type", "application/json");
 		//ajax.send(accounts);
        ajax.onreadystatechange = function() {
        	if (this.readyState == 4 && this.status == 200) {
        		const obj = JSON.parse(this.responseText);
        		console.log(obj);
        	     console.log(obj.eth1_address); 
        	     if(obj.eth1_address==null || obj.eth1_address==""){
            	     //console.log(document.getElementById("ErrorMex").display);
            	     document.getElementById("ErrorMex").style.display="inline";
        	     }
        	     else{
        	    	 eth1_address=obj.eth1_address;
            	     token=obj.token;
            	    document.getElementById("ErrorMex").style.display="none";
               		document.getElementById("button_step1").disabled = false;
               		
               		//bool_step1=true;
        	     }
        	    }
        	else {                 
                }
            };
            var data = {accountList:accounts};
        ajax.send(JSON.stringify(data));
        }
    
    else if(eth2_address==null){
    	if(currentAccount!=eth1_address){
    		document.getElementById("ErrorMex2").style.display="none";
       		//document.getElementById("button_step1").disabled = false;
       		eth2_address=currentAccount;
       		nextHandle2()
    	}
    	else{
    		document.getElementById("ErrorMex2").style.display="inline";
    	}
    }
    
  }
  }
  
  
  async function handleStep2(){
	  
	  var startTime = performance.now()
	  if(currentAccount!=eth1_address){
		  window.location.reload();
		  console.log("curr="+currentAccount);
		  console.log("eth1="+eth1_address);
	  }
	  else{
		
		 let msgHex = "0x" + toHex(stringToUTF8Bytes(token));	
		 console.log("mex_hex="+msgHex);
		 
		 var endTime = performance.now()
		console.log(endTime-startTime);
		 
		 signature=await window.ethereum.request({ method: 'personal_sign', params: [msgHex,ethereum.selectedAddress]});
		 
		 let pr_sig = new Promise ((resolve,reject) => {
				if(signature!=null && signature!=""){
					resolve();
					console.log("signature="+signature);
					if(eth2_address==null){
					console.log(document.getElementById("ErrorMex2").display);
            	    document.getElementById("ErrorMex2").style.display="inline";
					}
					else{
						nextHandle2();
					}
	  }
		 });
	  }
	  
  }
  
  
  async function nextHandle2(){
	  if(currentAccount!=eth2_address){
		  window.location.reload();
	  }
	  else{
	    var ajax = new XMLHttpRequest();
        ajax.open("POST","AuthenticationStep2.action", true);
        ajax.setRequestHeader("Content-Type", "application/json");
 		//ajax.send(accounts);
        ajax.onreadystatechange = function() {
        	if (this.readyState == 4 && this.status == 200) {
        		console.log(this.responseText); 
        		const obj = JSON.parse(this.responseText);
        	     challenge=obj.challenge;
        	     document.getElementById("button_step2").disabled = false;
        	    }
        	else {                 
                }
            };
            var data = {
            		signature:signature,
            		token:token,
            		eth2_address:eth2_address,
            		eth1_address:eth1_address
            		};
            console.log(JSON.stringify(data));
        ajax.send(JSON.stringify(data));
	}
  }
  
  async function handleStep3(){
	  if(currentAccount!=eth2_address){
		  window.location.reload();
	  }
	  else{
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
		  
		  var contract = new web3.eth.Contract(ABI,contract_address);
			contract.methods.solveChallenge(hash).send({from: currentAccount })
			.on('confirmation', function(confirmationNumber, receipt){
				console.log(receipt);
				console.log(confirmationNumber);
	            //alert("Transaction succesfully executed");
				document.getElementById("button_step3").disabled = false;
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
			            document.getElementById("button_step3").disabled = false;
			      });
			    } catch (error) {
			      console.log(error);
			    }
			    alert("Transaction succesfully executed");
			    document.getElementById("button_step3").disabled = false;*/
	  }
  }
  
  
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
	
	
	 async function handleStep4(){
		 setTimeout(function(){
			 //window.history.back()
			 let url="http://localhost:10285/Anonym/auth/TestAddress?eth_address="+eth2_address
			 window.location.href = url;
			 /*if (window.location.search === "") {
  				window.location = window.location.origin + "?eth2="+eth2_address;
			} else {
 				 window.location = window.location.origin + window.location.search + "&eth2="+eth2_address;
			}*/
		 }, 5000);
	 }
	

</script>


</body>  
</html>  
