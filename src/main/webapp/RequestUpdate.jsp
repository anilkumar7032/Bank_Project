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
			background-color: blue;
			
		}
        .notice{
            color: white;
            position: relative;
            top: 15%;
            left: 80%;
            font-size: xx-large;
        }
        .notice2{
            color: white;
            position: relative;
            top: 15%;
            left: 95%;
        }
        .back-btn{
            color: white;
            position: relative;
            top: 15%;
            left: 97%;
            background-color: transparent;
            width: 30%;
            height: 6%;
            padding: 5px;
            margin: 3%;
            border: 2px solid white;
            outline: none;
            cursor: pointer;
            border-radius: 25px;
            font-family: sans-serif;

        }
		
	</style>
</head>
<body>
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png"></header>
		<%String pending=(String)request.getAttribute("pending");
		if(pending!=null){%>
		<h1 class="notice"> Your account is currently review</h1>
        <h3 class="notice2">Please wait for admin approval</h3>
        <%} %>
        <%String decline=(String)request.getAttribute("decline");
		if(decline!=null){%>
		<h1 class="notice"> Your account registration request</h1>
        <h3 class="notice2" style="left:104%">has been <b style="color:red;">rejected</b></h3>
        <%} %>
        <a href="Login.jsp"><button class="back-btn">Back to Login Page</button></a>
</body>
</html>