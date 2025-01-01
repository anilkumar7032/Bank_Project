<%@page import="com.bank.dto.Customer"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.Iterator"%>
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
        .customer-box{
            display: inline-block;
			width: 72%;
			height: 450px;
			position: absolute;
			top: 21%;
			left: 20%;
			border: 2px solid black;
			border-radius: 20px;
			backdrop-filter:blur(5px);
			background-color: rgba(255, 255, 255, 0.9);	
        } 
        .table-box{
            display: inline-block;
            position: relative;
            left: 1%;
            width: 95%;
            height: 80%;
            overflow-y: scroll;
			scrollbar-width: none;
        }
        table, th, td {
            border: 2px solid black;
          border-collapse: collapse;
		  padding: 3px;
		  text-align: center;  
		}
		.table-box::-webkit-scrollbar {
           display: none; /* Hides scrollbar for Chrome, Edge, Safari */
        }
        td{ position: relative; 
            width: 15%;
        }
        .nav-heading{
            display: inline-block;
            position: relative;
            top: 1%;
            height: 6%;
            width: 100%;
        }
        label{
            color: green;
            font-size: large;
            margin: 2% 0% 2% 4.5%;
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
			<div class="dash-items"><a id="dash-a" href="AdminDashBoard.jsp">Dash Board</a></div>
			<div class="dash-items" ><a id="dash-a" href="CustomersProfile.jsp" >Customer Profile's</a></div>
			<div class="dash-items"><a id="dash-a" href="CustomerTransaction.jsp">Customer Tranasction</a></div>
			<div class="dash-items" id="Dash-board"><a id="dash-a" href="" style="color: white;">All Transcationś</a></div>
			<form action="Logout" method="post"><div class="dash-items"><button id="logout-btn"  name="logout" value="Logout">Logout</button></div></form>
		</div>
        <div class="customer-box"><h2 style="margin: 1% 0% 1% 2%;">All Tranasctions</h2><hr>
            <div class="nav-heading">
                <label>TRAN_ID</label>
                <label >USER_ACC</label>
                <label>REC_ACC</label>
                <label>TRAN_DATE </label>
				<label>TRAN_TYPE</label>
				<label>AMOUNT</label>
                <label style="margin: 2% 0% 2% 2.8%;">BALANCE</label>
               
            </div>
            <div class="table-box">
            <table>
            <% 
            TransactionDAO tdao=new TransactionDAOImpl();
            List<Transaction> transactions=tdao.getAllTransaction(); 
    	    Iterator<Transaction> it=transactions.iterator(); 
    	    while(it.hasNext()) 
    	    { 
    	     Transaction t1=it.next(); %>
                <tr>
                   <td ><%=t1.getTransactionId() %></td>
                    <td ><%=t1.getUser() %></td>
                    <td ><%=t1.getRec_acc() %></td>
                    <td ><%=t1.getDate() %></td>
                    <td ><%=t1.getTransaction() %></td>
                    <td><%=t1.getAmount() %></td>
					<td><%=t1.getBalance() %></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
 
</body>
</html>