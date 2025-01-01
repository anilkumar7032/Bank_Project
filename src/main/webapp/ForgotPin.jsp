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
		#i1{
			padding: 10px;
			margin: 2% 2% 2% 20%;
			width: 55%;
			border-radius: 25px;
			outline-color: aqua;
			background-color: rgba(160, 160, 160, 0.3);
			border-color: black;
		}
		#i1::placeholder{
			color: white;
		}
		.div-box{
			border: 2px solid white;
			display: inline-block;
			width: 30%;
			height: 400px;
			position: absolute;
			top: 20%;
			left: 35%; 
			border-radius: 0px 25px 0px 25px;
			backdrop-filter:blur(4px);
			background-color: rgba(0, 0, 0, 0.1);

		}
		h1{
			margin: 5% 0% 1% 0%;
			text-align: center;
			color: white;
		}
		.failed{
			text-align: center;
			color:red;
		}
		.success{
		text-align: center;
		color:green;
		}
		#submit{
			margin-left: 22%;
			padding: 3px;
			width: 30%;
			border-radius: 20px;
			cursor: pointer;
		}
		a{
			margin-left: 15%;
			color: white;
			text-decoration: none;
		}
	</style>
</head>
<body>
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png"></header>
 
        <div class="div-box">
			<h1>Forgot Password</h1>
            <form action="forgot" method="POST">
             <%String success=(String)request.getAttribute("success"); 
            if(success!=null){%>
			<h4 class="success"><%=success%></h4>
			<%} %>
			 <%String failed1=(String)request.getAttribute("failed"); 
            if(failed1!=null){%>
			<h4 class="failed"><%=failed1%></h4>
			<%} %>
			<input id="i1" type="text" name="phone" placeholder="Enter your Phone Number"><br>
			<input id="i1" type="text" name="mail" placeholder="Enter your Email"><br>
            <input id="i1" type="Password" name="password" placeholder="Enter New Password"><br>
			<input id="i1" type="Password" name="confirm_password" placeholder="Confirm your Password"><br>
			<input id="submit" type="submit" style="text-align: center; margin-top:2%;" value="Update Password">
			<a href="Login.jsp">Back</a>
            </form>
		</div>
</body>
</html>