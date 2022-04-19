<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/ethjs@0.3.4/dist/ethjs.min.js"></script>
<script src="https://cdn.ethers.io/lib/ethers-5.2.umd.min.js" type="application/javascript"></script>

 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><s:text name="breadcrumb.subscribe"/></title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    
</head>
<body>
 <!--::header part start::-->
    <!-- Header part end-->

    <!-- breadcrumb part start-->
   <!--   <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2><s:text name="breadcrumb.subscribe"/></h2>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
    <!-- breadcrumb part end-->

    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2><s:text name="enter.title" /></h2>
                           <a href="${pageContext.request.contextPath}/auth/Login" class="btn_3"><s:text name="button.value"/></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3><s:text name="subscribe.title" /><br>
                                <s:text name="subscribe.subtitle" /></h3>
                           
                                
                           <div style="position: relative; width: 500px; margin-left: 15px">
                           <s:actionerror/>
								<s:form cssClass="row contact_form" action="FirstLogin"> <!-- era PrimoAccesso -->
								<s:hidden name="eth_address" value="%{eth_address}"/>
									<s:textfield
										cssClass="col-md-12 form-group p_star form-control"
										style="width:400px;" cssId="username" name="account.username"
										placeholder="%{getText('field.username')}" />
									<s:password cssClass="col-md-12 form-group p_star form-control"
										style="width:400px;" cssId="password" name="account.password"
										placeholder="%{getText('field.password')}" />
										
										<!-- qui inserisci un banner per dire che devi creare un nuovo account sul tuo account metamask -->
										
									<s:submit cssClass="col-md-12 form-group btn_3" value="%{getText('button.value')}" />
								</s:form>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
    

    <!--::footer_part start::-->
    <!--::footer_part end::-->
</body>
</html>