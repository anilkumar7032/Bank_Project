package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp1;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/signup")
public class Signup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImp1();
		//HttpSession session=req.getSession();
		String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		String email=req.getParameter("mail");
		String password=req.getParameter("password");
		String confirmpassword=req.getParameter("confirm_password");
		long phone=Long.parseLong(phonenumber);
		int pass=Integer.parseInt(password);
		if(password.equals(confirmpassword)) {
			c.setName(name);
			c.setMail(email);
			c.setPhone(phone);
			c.setPin(pass);
			boolean result=cdao.insertRequests(c);
			if(result) {
				req.setAttribute("success", "Signup successfully");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("failed1", "signup failed");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp#signup-box");
				rd.forward(req, resp);
			}
			}
			else {
				req.setAttribute("failed1", "password mismatch");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp#signup-box");
				rd.forward(req, resp);
			}
	}
}


