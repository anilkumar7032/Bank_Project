<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dao.CustomerDAOImp1"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@page import="com.bank.dto.Customer"%>
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
        .customer-box{
            display: inline-block;
			width: 72%;
			height: 450px;
			position: absolute;
			top: 21%;
			left: 15%;
			border: 2px solid hsl(0, 7%, 97%);
			border-radius: 20px;
			backdrop-filter:blur(4px);
			background-color: rgba(0, 0, 0, 0.1);	
        } 
        .table-box{
            display: inline-block;
            position: relative;
            top: 4%;
            left: 4%;
            width: 90%;
            height: 80%;
            overflow-y: scroll;
			scrollbar-width: none;
        }
        table, th, td {
            border: 2px solid #f3efef;
          border-collapse: collapse;
		  padding: 3px;
		  text-align: center;  
		}
		.table-box::-webkit-scrollbar {
           display: none; /* Hides scrollbar for Chrome, Edge, Safari */
        }
        td{ 
            width: 18.6%;
			height: 5%;
			color: white;
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
            margin: 2% 0% 2% 6%;
        }
		#btn1{
			margin: 2%;
			color: white;
			border: none;
			width: 50%;
			background-color: rgb(27, 253, 27);
			cursor: pointer;
		}
        #btn2{
			margin: 2%;
			width: 50%;
			color: white;
			border: none;
			background-color: rgb(252, 48, 48);
			cursor: pointer;
		}
		#back-btn{
			position: absolute;
            top: 30%;
            left: 86%;
            width: 10%;
            height: 100%;
            padding: 3px;
            outline: none;
            border-radius: 25px;
            background-color: white;
            cursor:pointer;
		}
		
	</style>
</head>
<body>
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png"></header>
		<img src="images/profile-icon.jpg" alt="" class="profile-icon">
		<%Customer c=(Customer)session.getAttribute("customer"); %>
		<h2 class="welcome">Welcome Admin : <%=c.getName() %></h2>
        <div class="customer-box">
            <div class="nav-heading">
                <h2 style="margin: 1% 0% 1% 2%; color: white;">Account Requests</h2>
                <a href="AdminDashBoard.jsp"><button id="back-btn">Back</button></a>
            </div>
            <div class="table-box">
            <table>
            <% CustomerDAO cdao=new CustomerDAOImp1();
            List<Customer> customers=cdao.getAccountRequest();   
    	    Iterator<Customer> it=customers.iterator(); 
    	    while(it.hasNext()) 
    	    { 
    	     Customer c1=it.next();%>
                <tr>
                   <td ><%=c1.getName() %></td>
                    <td ><%=c1.getMail() %></td>
                    <td ><%=c1.getPhone() %></td>
                    <td>
						<form action="accept" method="POST"><button id="btn1" name="accept" value="<%=c1.getPhone()%>">Accept</button></form>
						<form action="decline" method="POST"><button id="btn2" name="decline" value="<%=c1.getPhone()%>">Decline</button></form>
					</td>
                <%}%>
                </tr>
            </table>
        </div>
    </div>
 
</body>
</html>