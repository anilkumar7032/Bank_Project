<%@page import="java.util.List"%>
<%@page import="com.bank.dao.CustomerDAOImp1"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@page import="com.bank.dto.Customer"%>
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
            left: 4%;
            width: 90%;
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
        td{  position: relative;
            width: 16%;
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
		.del-info{
			position: absolute;
            top: 3%;
            left: 70%;
            width: 18%;
            height: 4%;
            padding: 3px;
            outline: none;
            background-color: transparent;
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
			<div class="dash-items" id="Dash-board"><a id="dash-a" href="" style="color: white;">Customers Profile</a></div>
			<div class="dash-items"><a id="dash-a" href="CustomersProfile.jsp">Customer Tranasction</a></div>
			<div class="dash-items"><a id="dash-a" href="AllTransactions.jsp">All Transcationś</a></div>
			<form action="Logout" method="post"><div class="dash-items"><button id="logout-btn"  name="logout" value="Logout">Logout</button></div></form>
		</div>
        <div class="customer-box"><h2 style="margin: 1% 0% 1% 3%;">Customers profile</h2>
        <%String success=(String)session.getAttribute("success"); 
            if(success!=null){%>
			<h3 class="del-info" style="color:green;"><%=success%></h3>
			<%} %>
			 <%String failed1=(String)session.getAttribute("failed"); 
            if(failed1!=null){%>
			<h3 class="del-info" style="color:red;"><%=failed1%></h3>
			<%} %>
			<hr>
            <div class="nav-heading">
                <label>ACCOUNT NO</label>
                <label >NAME</label>
                <label>MAIL ID</label>
                <label>PHONE NO</label>
                <label>BALANCE</label>
                <label>DELETE ACC</label>
               
            </div>
            <div class="table-box">
            <table>
            <%CustomerDAO cdao=new CustomerDAOImp1();
            List<Customer> customers=cdao.getCustomer();   
    	    Iterator<Customer> it=customers.iterator(); 
    	    while(it.hasNext()) 
    	    { 
    	     Customer c1=it.next(); %>
				<form action="delete" method="POST">
                <tr>
                   <td ><%=c1.getAccno() %></td>
                    <td><%=c1.getName() %></td>
                    <td ><%=c1.getMail()%></td>
                    <td ><%=c1.getPhone() %></td>
                    <td ><%=c1.getBal() %></td>
                    <td><button value="<%=c1.getAccno()%>" name="delete" style="background-color: rgb(255, 43, 43);color: white;">Delete</button></td>
                </tr>
			</form>
			<%}%>
            </table>
        </div>
    </div>
 
</body>
</html>