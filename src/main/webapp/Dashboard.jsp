<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="com.bank.dto.TransactionID"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Citibank</title>
	<style type="text/css">
		*{
			margin: 0%;
		}
		body{
			background-image: url("images/bank_bg_pic.jpg");
			height: 100vh;
			width: 100vh;
			background-size: cover;
			overflow: hidden;
		}
		header{
			display: flex;
           
           
		}
		#logo{
			height: 80px;
			width: 80px;
			margin-top: 4%;
			margin-left: 4%;
		}
		#logo1{
			height: 85px;
			width: 200px;
			margin-top: 4%;
		}
        h2{
            display: inline;
			position: absolute;
			top: 5%;
			left: 80%;
			color: white;
        }
		h3{
            display: inline;
			position: absolute;
			top: 10%;
			left: 80%;
			color: white;
        }
		.nav_bar{
			display: inline-block;
			width: 250%;
			height: 5%;
			background-color: transparent;
			margin-top: 1%;
		}
		.home-btn,.updateAcc-btn,.reset-pin,.logout-btn{
			display: inline-block;
			background-color: transparent;
			border-radius: 20px;
			width: 10%;
			text-align: center;
			color:white;
			position: absolute;
			left: 43%;
			top: 20.2%;
			cursor: pointer;
			border: none;
			font-size: large;
			font-family: sans-serif;
		
			padding: 2px;
		}
		.home-btn{
			left: 23%;
		}
		.reset-pin{
			left: 63%;
		}
		.logout-btn{
			left: 83%;
		}
		.home-tools{
			display: inline-block;
			position: absolute;
			top: 28%;
			backdrop-filter:blur(4px);
			background-color: rgba(0, 0, 0, 0.1);
			width: 70%;
			height: 70%;
			left: 15%;
			border: 2px solid white;
			border-radius: 0px 20px 0px 20px;
		}
		.trans-card,.deposit-card,.balance-card,.pay-card{
			display: flex;
			position: absolute;
			top: 6%;
			height: 40%;
			width: 20%;
			background-color: white;
			border-radius: 15px;
			transition: transform 0.3s ease;
		}
		.trans-card{
			left: 4%;
		}
		.deposit-card{
			left: 28%;
		}
		.deposit-card:hover{
			transform: scale(1.1);
		}
		.trans-card:hover{
			transform: scale(1.1);
		}
		.balance-card:hover{
			transform: scale(1.1);
		}
		.pay-card:hover{
			transform: scale(1.1);
		}
		.balance-card{
			left: 52%;
		}
		.pay-card{
			left: 76%;
		}.trans-his{
			display: inline-block;
			position: absolute;
			top: 55%;
			left: 5%;
			background-color: transparent;
			width: 20%;
			height: 8%;
			border: 2px solid white;
			border-radius: 10px 0px 10px 0px;
		}#th{
			text-align: center;
			margin-top: 3%;
			color: white;
			font-size: large;
		}
		#i1{
			padding: 10px;
			margin: 2% 2% 2% 20%;
			width: 55%;
			border-radius: 25px;
			outline-color: aqua;
			background-color: rgba(160, 160, 160, 0.3);
			border-color: black;
			color:white;
		}
		#i1::placeholder{
			color: white;
		}
		.update-box,.resetPin-box{
			border: 2px solid white;
			display: inline-block;
			width: 30%;
			height: 400px;
			position: absolute;
			top: 30%;
			border-radius: 0px 25px 0px 25px;
			backdrop-filter:blur(4px);
			background-color: rgba(0, 0, 0, 0.1);
			transition: .5s;

		}
		.update-box{
			left: 110%;
		}
		.resetPin-box{
			left: 110%;
		}
		.failed{
			text-align: center;
			margin: 3% 0% 5% 0%;
			color:red;
		}
		.success{
			text-align: center;
			margin: 3% 0% 5% 0%;
			color:green;
			}
		#submit{
			margin-left: 22%;
			padding: 3px;
			width: 30%;
			border-radius: 20px;
			cursor: pointer;
		}#btn{
			display: flex;
			background-color: aqua;
			border-radius: 20px;
			width: 10%;
			height: 3%;
			position: absolute;
			left: 23%;
			top: 19.5%;
			transition: .5s;
			padding: 5px;
		}
		body{
			overflow: hidden;
		}
		h1{
			margin-top: 2%;
			text-align: center;
			color: white;
		}
		
		.box-container {
            display: flex;
            gap: 15px;
            width: 88%;
            overflow-x: scroll; /* Enables horizontal scrolling */
            padding: 10px;
            white-space: nowrap; /* Prevents wrapping */
            scrollbar-width: none;/* Hides scrollbar for Firefox */
			position: absolute;
			top: 68%;
			left: 5%; 
        }
		#boxData{
			position: absolute;
			top: 60%;
			left: 60%;
		}
		#btn1{
			position: absolute;
			top: 60%;
			left: 80%;
		}
        .box-container::-webkit-scrollbar {
            display: none; /* Hides scrollbar for Chrome, Edge, Safari */
        }
        .box {
            flex: 0 0 auto; /* Prevents shrinking and ensures fixed size */
            width: 250px;
            height: 100px;
            background-color:white;
            display:inline-block;
            font-size: 16px;
            font-weight: bold;
            border: 1px solid #ccc;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease; /* Smooth transition for scaling */
        }
        .box:hover {
            transform: scale(1.2); /* Scales the box by 20% on hover */
        }
		.payment-logo{
			width: 50%;
			height: 50%;
			position: absolute;
			top: 10%;
			left: 25%;
		}
		.card-info{
			position: absolute;
			top: 65%;
			left: 20%;
			  
		}
		.card-btn{
			width: 60%;
			height: 15%;
			position: absolute;
			top: 80%;
			left: 20%;
			background-color: #00ff00;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		.trans-popup{
			border: 2px solid white;
			display: inline-block;
			width: 30%;
			height: 400px;
			position: absolute;
			top: 45%;
			left: 25%;
			transform: translate(-50%,-50%) scale(0.1);
			backdrop-filter:blur(4px);
			background-color: white;
			transition: .5s;
			visibility: hidden;
		}

		#trans-btn{
			width: 60%;
			height: 8%;
			position: absolute;
			top: 80%;
			left: 21%;
			background-color: #00ff00;
			border: none;
		}
		#trans-cancel{
			width: 60%;
			height: 8%;
			position: absolute;
			top: 90%;
			left: 21%;
			border: 2px solid #00ff00;
			background-color: white;
			color: #00ff00;
		}
		#label1{
			margin: 5% 5% 5% 25%;
			color: black;
		}
		.trans-input{
			padding: 10px;
			margin: 2% 2% 2% 20%;
			width: 55%;
			border-radius: 25px;
			outline-color: aqua;
			background-color: white;
			border-color: black;
		}
		#trans-h1{
			margin: 5% 0% 5% 0%;
			color: black;
		}
		.deposit-popup{
			border: 2px solid white;
			display: inline-block;
			width: 25%;
			height: 300px;
			position: absolute;
			top: 42.4%;
			left: 41.8%;
			transform: translate(-50%,-50%) scale(0.1);
			backdrop-filter:blur(4px);
			background-color: white;
			transition: .5s;
			visibility: hidden;
		}
		.balance-popup{
			border: 2px solid white;
			display: inline-block;
			width: 25%;
			height: 300px;
			position: absolute;
			top: 44%;
			left: 58.5%;
			transform: translate(-50%,-50%) scale(0.1);
			backdrop-filter:blur(4px);
			background-color: white;
			transition: .5s;
			visibility: hidden;
		}
		.balanceLogo{
			height: 40%;
			width: 40%;
			margin-left: 30%;
		}
		#balance{
			text-align: center;
			position: absolute;
			top: 68%;
			left: 45%;
			color: black;

		}
		.view-transaction{
			position: absolute;
			top: 58%;
			left: 87%;
			height: 6%;
			width: 10%;
			background-color: transparent;
			border: 2px solid white;
			color: white;
			border-radius: 20px;
			font-family: sans-serif;
		}
		.transaction-table{
			display: inline-block;
			width: 50%;
			height: 500px;
			position: absolute;
			top: 70%;
			left: 80%;
			border: 2px solid black;
			border-radius: 20px;
			transform: translate(-50%,-50%) scale(0.1);
			backdrop-filter:blur(5px);
			background-color: rgba(255, 255, 255, 0.7);
			transition: .5s;
			visibility: hidden;
			overflow:hidden;
		}
		table{
		margin-left:1%;
		}
		table, th, td {
          border: 1px solid black;
          border-collapse: collapse;
		  padding: 3px;
		  text-align: center;
		}
		th,td{
			width: 18%;
			font-size: small;
		}
		th{
			color: purple;
		}
		.tranDetails-close{
			width: 10%;
			height: 5%;
			position: absolute;
			top: 93%;
			left: 85%;
			background-color: #00ff00;
			border: 1px solid black;
			border-radius: 5px;
		}
		.notice{
			display: inline-block;
			position: absolute;
			top: 30%;
			left: 35%;
			width: 30%;
			height: 40%;
			background-color: white;
			border: 2px solid black;
			font-size: small;
		}
		#transcancel-btn{
			position: absolute;
			top: 0%;
			left: 94%;
			cursor: pointer;
		}
		.transimg{
			position: absolute;
			top: -20%;
			left: 30%;
          height: 60%;
		  width: 40%;
		}
		.table-box{
			position: relative;
			height: 80%;
			width: 100%;
			overflow-y: scroll;
			scrollbar-width: none;
		}
		.table-box::-webkit-scrollbar {
           display: none; /* Hides scrollbar for Chrome, Edge, Safari */
        }
	</style>
</head>
<body id="body">
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png">
		<%Customer c=(Customer)session.getAttribute("customer"); %>
    </header>
     
	<h2>Welcome : <%=c.getName() %></h2>
	<h3>Account No :<%=c.getAccno() %></h3>
	<div>
<div class="nav_bar" id="nav-bar">
     <div id="btn"></div>
	<button class="home-btn" onclick="home()">Home</button>
	<button class="updateAcc-btn" onclick="update()">Update Acc</button>
	<button class="reset-pin" onclick="reset()">Reset Pin</button>
	<%if(c.getAccno()==1100110011) {%>
	<a href="AdminDashBoard.jsp"><button class="logout-btn" onclick="logout()" >Back to Admin</button></a>
	<%}
	else{%>
	<form action="Logout" method="post"><button class="logout-btn" name="logout" value="Logout" onclick="logout()">Logout</button></form>
	<%} %>
</div>

<div class="home-tools" id="home-box">
	<div class="trans-card"><img src="images/transfer_logo.webp" alt="" class="payment-logo">
		<h4 class="card-info">Transfer Amount</h4><br>
		<button class="card-btn" onclick="open_transPopup()">Transfer</button>
	</div>
	<div class="deposit-card"><img src="images/deposit.png" alt="" class="payment-logo">
		<h4 class="card-info">Deposit Amount</h4><br>
		<button class="card-btn" onclick="open_depositPopup()">Deposit</button>
	</div>
	

	<div class="balance-card"><img src="images/moneyBag_logo.png" alt="" class="payment-logo">
		<h4 class="card-info">Check Balance</h4><br>
		<button class="card-btn" onclick="open_balancePopup()">Check</button>
	</div>
	<div class="pay-card"><img src="images/Online_Payment.png" alt="" class="payment-logo">
		<h4 class="card-info">Online Payment</h4><br>
		<button class="card-btn">Pay</button>
	</div>
	<div class="trans-his"><h4 id="th"><i>Transaction History</i></h4></div>
	<button class="view-transaction" onclick="open_transactionPopup()" >View All</button>
   <!--Dynamic Horizontal Aqua Boxes
    <input  type="text" id="boxData" placeholder="Enter box text" />
    <button id="btn1"  onclick="addBox()">Add Box</button>-->
    <div class="box-container" id="boxContainer">
    <%TransactionDAO tdao=new TransactionDAOImpl();
		List<Transaction> transactions=tdao.getTransaction(c.getAccno()); 
	    Iterator<Transaction> it=transactions.iterator(); 
	    while(it.hasNext()){
	    	Transaction t1=it.next();%>
	    	<div class="box">
	    	<%String color="";
	    	String a="";
	    	if(t1.getTransaction().equals("CREDITED"))
	    		{
	    		color="green";
	    		a="+";
	    		}
	    	     else{
	    	    	 color="red";
	    	    	 a="-";
	    		}
	    		%>
	    	<h5 style="display:inline;position: relative;top:8%;left:5%;"><%=t1.getTransaction() %></h5>
	    	<h3 style="display:inline;position: relative;top:6%;left:46%;color:<%=color%>;font-size:large;"><%=a%><%=t1.getAmount() %></h3>
	    	<h5 style="position: relative;top:25%;left:3%;"><%=t1.getDate() %></h5>
	    	<h5 style="position: relative;top:30%;left:3%;">Transaction ID : <%=t1.getTransactionId()%></h5>
	    	</div>
	   <%} %>
	    </div>

</div>
<div class="trans-popup" id="trans-popup">
	<h1 id="trans-h1">Transfer Amount</h1>
	<h3 style="margin: 3% 2% 2% 2%; text-align: center;">success</h3>
	<form action="transfer-amount" method="post">
	<label id="label1">Account Number</label><br>
	<input type="text" class="trans-input" name="acc_no"><br>
	<label id="label1">Amount</label><br>
	<input type="text" class="trans-input" name="amount"><br>
	<label id="label1">Password</label><br>
	<input type="password" class="trans-input" name="password"><br>
	<button id="trans-btn">Transfer</button><br>
	</form>
	<button id="trans-cancel" onclick="close_transPopup()">cancel</button>
</div>
<%String success1=(String)request.getAttribute("successful"); 
            if(success1!=null){%>
			<div class="notice" id="notice">
	<img src="images/correct.png" alt="" class="transimg">
	<h1 style="color: black;margin-top: 25%;">Transaction successful</h1>
	<h1 style="color: black;margin-top: 5%;">Amount</h1>
	<button id="transcancel-btn" onclick="transSuccessClose()">X</button>
         </div>
			<%} %>
		 <%String failed2=(String)request.getAttribute("failed2"); 
            if(failed2!=null){%>
			<div class="notice" id="notice">
	<h1 style="color: red;margin-top: 25%;">Transaction Failed</h1>
	<button id="transcancel-btn" onclick="transSuccessClose()">X</button>
           </div>
			<%} %>
<div class="deposit-popup" id="deposit-popup">
	<h1 id="trans-h1">Deposit Amount</h1>
	<h3 style="margin: 3% 2% 2% 2%; text-align: center;">success</h3>
	<form action="deposit" method="post">
	<label id="label1">Amount</label><br>
	<input type="text" class="trans-input" name="amount"><br>
	<label id="label1">Password</label><br>
	<input type="password" class="trans-input"><br>
	<button id="trans-btn" style="cursor: pointer;">Deposit</button><br>
	</form>
	<button id="trans-cancel" onclick="close_depositPopup()">cancel</button>
</div>
<%String success2=(String)request.getAttribute("successfully"); 
            if(success2!=null){%>
			<div class="notice" id="notice">
	<img src="images/correct.png" alt="" class="transimg">
	<h1 style="color: black;margin-top: 25%;">Deposit successful</h1>
	<button id="transcancel-btn" onclick="transSuccessClose()">X</button>
         </div>
			<%} %>
		 <%String failed3=(String)request.getAttribute("failed3"); 
            if(failed3!=null){%>
			<div class="notice" id="notice">
	<h1 style="color: red;margin-top: 25%;">Deposit Failed</h1>
	<button id="transcancel-btn" onclick="transSuccessClose()">X</button>
           </div>
			<%} %>
<div class="balance-popup" id="balance-popup">
	<h1 id="trans-h1">Balance</h1>
    <img src="images/rupeeLogo.png" alt="" class="balanceLogo"><br>
	<h3 id="balance"><%=c.getBal() %></h3>
	<button id="trans-btn" style="cursor: pointer;" onclick="close_balancePopup()">close</button><br>
</div>
<div class="transaction-table" id="transaction-table">
	<h1 style="color: black;">Transaction Details</h1>
	<div class="table-box">
	<table>
		<tr>
			<th>TRAN_ID</th>
			<th>USER_ACC</th>
			<th>REC_ACC </th>
			<th>TRAN_DATE</th>
			<th>TRAN_TYPE</th>
			<th>AMOUNT</th>
		</tr>
	    <%
	    TransactionDAO tdao1=new TransactionDAOImpl();
		List<Transaction> transactions1=tdao1.getTransaction(c.getAccno()); 
	    Iterator<Transaction> it1=transactions.iterator();
	    while(it1.hasNext()) 
	    { 
	     Transaction t1=it1.next(); %> 
		<tr>
			<td><%=t1.getTransactionId() %></td>
			<td><%=t1.getUser() %></td>
			<td><%=t1.getRec_acc() %></td>
			<td><%=t1.getDate() %></td>
			<td><%=t1.getTransaction() %></td>
			<td><%=t1.getAmount() %></td>
		</tr>
		<%}%>
	</table>
	</div>
	<button class="tranDetails-close" onclick="close_transactionPopup()">Close</button>
</div>



 <div class="update-box" id="upd-box">
	<h1>Update Account</h1>
	<form action="updateAcc" method="POST" id="updateForm">
	<h4 id="responseMessage" style="display:none;color:green;"></h4>
	 <%String success=(String)session.getAttribute("success"); 
            if(success!=null){%>
			<h4 class="success"><%=success%></h4>
			<%} %>
			 <%String failed1=(String)session.getAttribute("failed"); 
            if(failed1!=null){%>
			<h4 class="failed"><%=failed1%></h4>
			<%} %>
	<input id="i1" type="text" name="name" placeholder="Enter your Name" value="<%=c.getName()%>"><br>
	<input id="i1" type="text" name="mail" placeholder="Enter your Email" value="<%=c.getMail()%>"><br>
	<input id="i1" type="number" name="phone" placeholder="Enter your Phone No" value="<%=c.getPhone()%>"><br>
	<input id="submit" type="submit" style="text-align: center; margin-top:3%; margin-left: 35%;" value="Update Password">
	</form>
</div>
<div class="resetPin-box" id="res-box">
	<h1>Reset Pin</h1>
	<form action="resetPin" method="POST">
	 <%String success3=(String)session.getAttribute("success"); 
            if(success3!=null){%>
			<h4 class="success"><%=success3%></h4>
			<%} %>
			 <%String failed4=(String)session.getAttribute("failed"); 
            if(failed4!=null){%>
			<h4 class="failed"><%=failed4%></h4>
			<%} %>
	<input id="i1" type="text" name="phone" value="<%=c.getPhone()%>" readonly><br>
	<input id="i1" type="text" name="mail" value="<%=c.getMail()%>" readonly><br>
	<input id="i1" type="Password" name="password" placeholder="Enter New Password"><br>
	<input id="i1" type="Password" name="confirm_password" placeholder="Confirm your Password"><br>
	<input id="submit" type="submit" style="text-align: center; margin-top:2%; background-color: aqua;padding: 5px;border: none;color: white;" value="Update Password">
	</form>
</div>
</div>
<script>
	var w=document.getElementById("home-box")
	var x=document.getElementById("upd-box")
	var y=document.getElementById("res-box")
	var z=document.getElementById("btn")
	function home(){
		w.style.left="15%";
		x.style.left="110%";
		y.style.left="115%"
		z.style.left="23%";
		w.style.transition=".5s"
		y.style.transition="none";
		x.style.transition=".5s";
	}
	function update(){
		w.style.left="-110%"
		x.style.left="35%";
		y.style.left="110%"
		z.style.left="43%";
		w.style.transition=".5s"
		y.style.transition=".5s";
		x.style.transition=".5s";
	}
	function reset(){
		w.style.left="-110%";
		x.style.left="-105%";
		y.style.left="35%";
		z.style.left="63%";
		w.style.transition=".5s"
		y.style.transition=".5s";
		x.style.transition=".5s";

	}
	function logout(){
		z.style.left="83%";
	}

		let popup=document.getElementById("trans-popup")
		let blur1=document.getElementById("home-box");
		let blur2=document.getElementById("nav-bar");
		function open_transPopup(){
			blur1.style.filter="blur(10px)";
			blur2.style.filter="blur(10px)";
			popup.style.visibility="visible";
			popup.style.top="50%";
			popup.style.left="50%";
			popup.style.filter="none";
			popup.style.transform="translate(-50%,-50%) scale(1)";
			popup.style.transition=".5s";
		}
		function close_transPopup(){
			popup.style.visibility="hidden";
			popup.style.top="45%";
			popup.style.left="25%";
			popup.style.transform="translate(-50%,-50%) scale(0.1)";
			blur1.style.filter="none";
			blur2.style.filter="none";
			popup.style.transition=".1s";
		}
		let depositPopup=document.getElementById("deposit-popup")
		function open_depositPopup(){
			blur1.style.filter="blur(10px)";
			blur2.style.filter="blur(10px)";
			depositPopup.style.visibility="visible";
			depositPopup.style.top="50%";
			depositPopup.style.left="50%";
			depositPopup.style.filter="none";
			depositPopup.style.transform="translate(-50%,-50%) scale(1)";
			depositPopup.style.transition=".5s";
		}
		function close_depositPopup(){
			depositPopup.style.visibility="hidden";
			depositPopup.style.top="42.4%";
			depositPopup.style.left="41.8%";
			depositPopup.style.transform="translate(-50%,-50%) scale(0.1)";
			blur1.style.filter="none";
			blur2.style.filter="none";
			depositPopup.style.transition=".1s";
		}
		let balancePopup=document.getElementById("balance-popup")
		function open_balancePopup(){
			blur1.style.filter="blur(10px)";
			blur2.style.filter="blur(10px)";
			balancePopup.style.visibility="visible";
			balancePopup.style.top="50%";
			balancePopup.style.left="50%";
			balancePopup.style.filter="none";
			balancePopup.style.transform="translate(-50%,-50%) scale(1)";
			balancePopup.style.transition=".5s";
		}
		function close_balancePopup(){
			balancePopup.style.visibility="hidden";
			balancePopup.style.top="44%";
			balancePopup.style.left="58.5%";
			balancePopup.style.transform="translate(-50%,-50%) scale(0.1)";
			blur1.style.filter="none";
			blur2.style.filter="none";
			balancePopup.style.transition=".1s";
		}
		let transactionPopup=document.getElementById("transaction-table")
		function open_transactionPopup(){
			blur1.style.filter="blur(10px)";
			blur2.style.filter="blur(10px)";
			transactionPopup.style.visibility="visible";
			transactionPopup.style.top="50%";
			transactionPopup.style.left="50%";
			transactionPopup.style.filter="none";
			transactionPopup.style.transform="translate(-50%,-50%) scale(1)";
			transactionPopup.style.transition=".5s";
		}
		function close_transactionPopup(){
			transactionPopup.style.visibility="hidden";
			transactionPopup.style.top="70%";
			transactionPopup.style.left="80%";
			transactionPopup.style.transform="translate(-50%,-50%) scale(0.1)";
			blur1.style.filter="none";
			blur2.style.filter="none";
			transactionPopup.style.transition="none";
		}
		var transPopClose=document.getElementById("notice")
		function transSuccessClose(){
			transPopClose.style.transform="scale(0.1)";
			transPopClose.style.left="10%";
			transPopClose.style.visibility="hidden";
		}
		
		
</script>       
</body>
</html>