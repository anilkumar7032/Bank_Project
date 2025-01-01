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
			background-image: url("images/Bank_background_pic.jpeg");
			height: 100%;
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
		.form-box{
			border: 2px solid gray;
			display: inline-block;
			width: 30%;
			height: 450px;
			position: absolute;
			top: 18%;
			left: 35%; 
			border-radius: 0px 25px 0px 25px;
			backdrop-filter:blur(4px);
			background-color: rgba(0, 0, 0, 0.1);
			overflow: hidden;
		}
		h1{
			margin-left: 15%;
			margin-top: 5%;
			color: white;
		}
		input{
			margin-left: 25%;
			border-style: solid;
			border-color: white;
			position: absolute;
			top: 15%;
			left: 5%;
			background-color: transparent;
		}
		button{
			margin: 7% 0% 0% 40%;
		    border: none;
			
		}
		#input-block{
			display: inline-block;
			background-color: rgba(160, 160, 160, 0.3);
			position: absolute;
			top: 12%;
			left: 25%;
			width: 55%;
			height: 12%;
			border: 1px solid black;
			border-radius: 25px;
			over-flow:hidden;

		}
		#al{
			height: 30px;
			width: 30px;
			margin-top: 15%;
			
		}
		#al1{
			height: 30px;
			width: 30px;
			margin-top: 10%;
			
		}
		#bal{
			display: inline-block;
			height: 15%;
			width: 12%;
			background-color: white;
			position: absolute;
			top: 33px;
			left: 25%;
			border-radius: 50%;
		}
		#input-block2{
			display: inline-block;
			background-color: rgba(160, 160, 160, 0.3);
			position: absolute;
			top: 32%;
			left: 25%;
			width: 55%;
			height: 12%;
			border: 1px solid black;
			border-radius: 25px;
			over-flow:hidden;

		}
		#bal1{
			display: inline;
			height: 15%;
			width: 12%;
			background-color: white;
			position: absolute;
			top: 68px;
			left: 29%;
			border-radius: 50%;
			border: none;
			cursor: pointer;
		}
		#input{
			background-color: transparent;
			position: absolute;
			top: 40px;
			left: 14%;
			width: 45%;
			height: 10%;
			border: none;
			outline:none;
			color: white;
				}
		#input2{
			background-color: transparent;
			position: absolute;
			top: 104px;
			left: 13px;
			width: 45%;
			height: 10%;
			border: none;
			outline: none;
			color: white;
		}
		#input::placeholder{
			color: white;
		}
		#input2::placeholder{
			color: white;
		}
	
		#submit{
			display: inline-block;
			background-color: white;
			position: absolute;
			top: 55%;
			left: 0%;
			width: 55%;
			height: 12%;
			border: 1px solid black;
			border-radius: 25px;
			cursor: pointer;

		}
		
		.failed{ 
			color: red;
			position: absolute;
			top: 10px;
			left: 30%;
		}
		#forg-pin{
			position: absolute;
			top: 47%;
			left: 48%;
			color: white;
		    text-decoration: none;
		}
        .button-box{
            display: flex;
            width: 210px;
            height: 8%;
            position: absolute;
            left: 110px;
            top: 15%;
            border-radius: 30px; 
        }
        .toggle-btn1{
            padding: 7px 10px;
            cursor: pointer;
            background: transparent;
            outline: none;
            position: absolute;
            top: -50%;
            left: -40%;
            width: 110px;
            border-radius: 30px ;
            font-family: serif;
            font-size: large;
            color: white;
        }
        .toggle-btn2{
            padding: 7px 10px;
            cursor: pointer;
            background: transparent;
            outline: none;
            position: absolute;
            top: -50%;
            left: 11%;
            width: 50%;
            border-radius: 30px ;
            font-family: serif;
            font-size: large;
            color: white;
        }
        #btn{
            top :-5%;
            left: 0%;
            position: absolute;
            width: 110px;
            height: 100%;
            background-color: aqua;
            border-radius: 30px;
            transition: .5s;

        }
        .login-box{
            position: absolute;
            width: 100%;
            height: 70%;
           top: 28%;
		   transition: .5s;
        }
		#i1{
			padding: 10px;
			width: 55%;
			border-radius: 25px;
			outline-color: aqua;
			background-color: rgba(160, 160, 160, 0.3);
			border-color: black;
		}
		#i1::placeholder{
			color: white;
		}
		.signup-box{
			display: inline-block;
			width: 100%;
			height: 340px;
			position: absolute;
			top: 23%;
		    left: 105%;
			transition: .5s;
		}
		.name{
			position: absolute;
			top: 10%;
			left: -3%;
		}
		.phone{
			position: absolute;
			top: 25%;
			left: -3%;
		}
		.mail{
			position: absolute;
			top: 40%;
			left: -3%;
		}
		.pass{
			position: absolute;
			top: 55%;
			left: -3%;
		}
		.success{
		text-align:center;
		color:green;
		}
		.cpass{
			position: absolute;
			top: 70%;
			left: -3%;
		}
		#submit1{
			position: absolute;
			color: black;
			background-color: white;
			font-family: sans-serif;
			border: none;
			top: 85%;
			left: 16%;
			padding: 5px;
			width: 20%;
			border-radius: 20px;
			cursor: pointer;
		}
		
	</style>
	
</head>
<body>
	<header><img  id="logo" src="images/Bank_logo.png">
		<img  id="logo1" src="images/Citibank_logo1.png"></header>
		<div class="form-box">
			<h1>Welcome to citibank</h1>
            <div class="button-box">
                <div id="btn"></div>
                <button class="toggle-btn1" onclick="login()">Login</button>
                <button class="toggle-btn2" onclick="signup()">Signup</button>
            </div>
			<div  class="login-box" id="login">
			<%Customer c=(Customer)session.getAttribute("customer"); %>
            <form action="login" method="POST">
            <%String failed=(String)request.getAttribute("failed"); 
            if(failed!=null){%>
			<h4 class="failed"><%=failed%></h4>
			<%} %>
			<div id="input-block"></div>
			<input id="input" type="text" name="mail" placeholder="Enter Account Number" autocomplete="on">
            <div id="input-block2"></div>
            <input id="input2" type="Password" name="password" placeholder="Enter Password">
			<a id="forg-pin" href="ForgotPin.jsp">Forgot Password</a>
			<input id="submit" type="submit" style="text-align: center; margin-top:2%;" value="Login">
			
			</form>
            <div id="bal"><center><img id="al"src="images\account_logo.png"></center></div>
			<button id="bal1" onclick="change()" ><center><img id="al1"src="images/lock_logo1.jpeg"></center></button>
		 </div>
		 <div class="signup-box" id="signup">
		 <%String success=(String)request.getAttribute("success"); 
            if(success!=null){%>
			<h4 class="success"><%=success%></h4>
			<%} %>
		 <%String failed1=(String)request.getAttribute("failed1"); 
            if(failed1!=null){%>
			<h4 class="failed"><%=failed1%></h4>
			<%} %>
			<form action="signup" method="POST">
			<input class="name" id="i1" type="text" name="name" placeholder="Enter your name">
			<input class="phone" id="i1" type="text" name="phone" placeholder="Enter your phone number">
			<input class="mail" id="i1" type="text" name="mail" placeholder="Enter your Email">
           <input class="pass"  id="i1" type="Password" name="password" placeholder="Enter Password">
			<input class="cpass" id="i1" type="Password" name="confirm_password" placeholder="Confirm your Password">
			<input id="submit1" type="submit" style="text-align: center; margin-top:2%;" href="bank_dashboard.html" value="submit">
		    </form>
		</div>
    </div>
		<script>
        let input=document.getElementById("input2")
		let lockbtn=document.getElementById("al1")
        let pass=1
            function change(){
                if(pass==1){
                input.setAttribute("type","text")
				lockbtn.setAttribute("src","images/lock_logo2.png")
                pass=0
            }
            else{
                input.setAttribute("type","password")
				lockbtn.setAttribute("src","images/lock_logo1.jpeg")
                pass=1
            }
        }
		var x=document.getElementById("login")
		var y=document.getElementById("signup")
		var z=document.getElementById("btn")
		function login(){
			x.style.left="0%";
			y.style.left="110%";
			z.style.left="0%";
		}
		function signup(){
			x.style.left="-110%";
			y.style.left="0%";
			z.style.left="50%";
		}
		
		window.onload=function(){
			const divId='<%=request.getAttribute("success")%>';
			if(divId){
				const targetDiv=document.getElementById(divId);
				if(targetDiv){
					targetDiv.scrollIntoView({
						behavior:"smooth"
					});
				}
			}
		};
    </script>
</body>
</html>