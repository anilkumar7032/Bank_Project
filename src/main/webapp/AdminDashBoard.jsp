<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dao.CustomerDAOImp1"%>
<%@page import="com.bank.dao.CustomerDAO"%>
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
		.welcome{
			display: inline-block;
			color: white;
			position: absolute;
			top: 8%;
			left: 72%;
			font-family: sans-serif;
			font-size: x-large;
		}
		.profile-icon{
			position: absolute;
			top: 6%;
			left: 67%;
			height: 50px;
			width: 50px;
		}
		.dash-board{
			display: inline-block;
			position: absolute;
			top: 18.3%;
			left: 0%;
			height: 81.7%;
			width: 13%;
			background-color: white;
		}
		.dash-items{
			display: inline-block;
			height: 15%;
			width: 100%;
		}
		#dash-a{
			position: relative;
			top: 40%;
			left: 10%;
			text-decoration: none;
			cursor: pointer;
			color: black;
		}
		#Dash-board{
			background-color:#000f89;
           text-decoration-color: white;
			
		}
        .nav-dash{
            display: inline-block;
			position: absolute;
			top: 18.3%;
			left: 14%;
			height: 20%;
			width: 85%;
        }
        .nav-cards{
            display: inline-block; 
			position: absolute;
            height: 100px;
            width: 20%;          /* Set height for the container */
            border: 1px solid black;
            margin: 8px; 
            border-radius: 15px;
            box-shadow: 0px 10px 10px 0px rgba(0, 0, 0, 0.3);
            transition: .5s;
        }
		#nav-card1{
			left: 0%;
		}
		#nav-card2{
			left: 31%;
		}
		#nav-card3{
			left: 53%;
			cursor: pointer;
		}
		#nav-card4{
			left: 75%;
		}
        .nav-cards:hover{
            transform: scale(1.1);

        }
        .new-customer{
            display: inline-block;
			width: 72%;
			height: 330px;
			position: absolute;
			top: 40%;
			left: 23%;
			border: 2px solid black;
			border-radius: 20px;
			backdrop-filter:blur(5px);
			background-color: rgba(255, 255, 255, 0.9);
			/*overflow-y: scroll;*/
			scrollbar-width: none;
			overflow: hidden;
			
        } 
		
        table, th, td {
          border-collapse: collapse;
		  padding: 3px;
		  text-align: center;
          margin-left: 2%;  
		}
		
		th,td{
			width: 18%;
		}
		tr{
		margin-top:20%;
		}
		th{
			color:green;
		}
		.new-custpmer::-webkit-scrollbar {
           display: none; /* Hides scrollbar for Chrome, Edge, Safari */
        }
		.card-name{
			position: relative;
			top: 20%;
			left: 15%;
			color: white;
		}
		#card-name1{
			position: relative;
			top: 10%;
			left: 15%;
			color: white;
		}
		.card-img{
			position: absolute;
			top: 20%;
			left: 60%;
			height: 50%;
			width: 30%;
			filter: invert(40%) sepia(100%) saturate(500%) hue-rotate(180deg);

		}
		#logout-btn{
			border: none;
			background-color: white;
		    margin: 8%;
			font-family: sans-serif;
		}
		
	</style>
</head>
<body>
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png"></header>
		<img src="images/profile-icon.jpg" alt="" class="profile-icon">
		<%Customer c=(Customer)session.getAttribute("customer"); %>
		<h2 class="welcome">Welcome Admin :<%=c.getName() %></h2>
		<hr style="width: 230%;">
		<div class="dash-board">
			<div class="dash-items" id="Dash-board"><a id="dash-a" href="AdminDashBoard.jsp" style="color: white;">Dash Board</a></div>
			<div class="dash-items"><a id="dash-a" href="CustomersProfile.jsp">Customer Profile's</a></div>
			<div class="dash-items"><a id="dash-a" href="CustomerTransaction.jsp">Customer Tranasction</a></div>
			<div class="dash-items"><a id="dash-a" href="AllTransactions.jsp">All Transcation</a></div>
			<form action="Logout" method="post"><div class="dash-items"><button id="logout-btn"  name="logout" value="Logout">Logout</button></div></form>
		</div>
        <div class="nav-dash">
            <a href="AccountRequests.jsp"><div id="nav-card1" class="nav-cards" style="margin-left: 10%;background-color:#061169;"><h2 class="card-name">Account</h2>
				<h2 class="card-name">Requests</h2>
			    <img src="images/accountRequLogo.png" alt="" class="card-img"></div></a>
            <a href="DeleteAccounts.jsp"><div id="nav-card2" class="nav-cards" style="background-color: #000f89;"><h2 class="card-name">Deleted</h2>
				<h2 class="card-name">Accounts</h2>
				<img src="images/Delete-Logo.png" alt="" class="card-img"></div></a>
            <div id="nav-card3" class="nav-cards" style="background-color: #061169;" onclick="change()">
            <!-- bank balance -->
            <%CustomerDAO cdao=new CustomerDAOImp1(); 
            Customer c1=cdao.getBankBalance();%>
            <h2 class="card-name" id="bank-balance1">Bank</h2>
				<h2 class="card-name" id="bank-balance2">Balance</h2>
				<img src="images/bank-bal.png" alt="" class="card-img"></div>
            <a href="Dashboard.jsp"><div id="nav-card4" class="nav-cards" style="background-color: #000f89;"><h2 id="card-name1" >Access</h2>
				<h2 id="card-name1" >Your</h2>
				<h2 id="card-name1">Account</h2>
				<img src="images/access-icon.png" alt="your account" class="card-img"></div></a>
        </div>
        <div class="new-customer"><h2 style="margin: 1% 0% 1% 2%;">New Customers</h2><hr>
            <table>
                <tr>
                    <th>ACC_NO</th>
                    <th>NAME </th>
                    <th>PHONE</th>
                    <th>MAIL</th>
                    <th>BALANCE</th>
                </tr>
                <%List<Customer>customers=cdao.getNewCustomers();   
        	    Iterator<Customer> it=customers.iterator(); 
        	    int count=0;
        	    String color="transparent";
        	    while(it.hasNext() && count<=9) 
        	    { 
        	     Customer cstr=it.next();
        	     if(color.equals("transparent")){%>
        	    	 <tr style="background-color:<%=color%>;">
        	     <% color="#D9D9D9";
        	     }else{%>
        	    	 <tr style="background-color:<%=color%>;">
        	    	 <% color="transparent";
        	     }%>
        	    
                   <td><%=cstr.getAccno() %></td>
                    <td><%=cstr.getName() %></td>
                    <td><%=cstr.getPhone() %></td>
                    <td><%=cstr.getMail() %></td>
                    <td><%=cstr.getBal() %></td>
                </tr>
                <%count++;
                } %>
            </table></div>
			<script>
				var balance1=document.getElementById("bank-balance1")
				var balance2=document.getElementById("bank-balance2")
				var a=1
				function change(){
					if(a==1){
						balance1.textContent=<%=c1.getBal()%>;
						balance1.style.top="35%";
						balance2.style.visibility="hidden";
						a=0
					}
					else{
						balance1.textContent="Bank";
						balance1.style.top="20%";
						balance2.style.visibility="visible";
						a=1
					}
				}
			</script>
 
</body>
</html>