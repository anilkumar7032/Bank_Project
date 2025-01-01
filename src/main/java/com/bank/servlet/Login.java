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


@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mail=req.getParameter("mail");
		String pass=req.getParameter("password");;
		int password=Integer.parseInt(pass);
		CustomerDAO cdao=new CustomerDAOImp1();
		Customer c=cdao.getCustomer(mail,password);
		Customer c1=cdao.getAccountRequest(mail,password);
		Customer c2=cdao.getdeleteRequest(mail,password);
		HttpSession session=req.getSession();
		if(c!=null) {
			if(c.getAccno()==1100110011) {
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("AdminDashBoard.jsp");
				rd.forward(req, resp);
			}
			else {
			session.setAttribute("customer", c);
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
			}
		}else if(c1!=null) {
			req.setAttribute("pending", "pending");
			RequestDispatcher rd=req.getRequestDispatcher("RequestUpdate.jsp");
			rd.forward(req, resp);
		}else if(c2!=null) {
			req.setAttribute("decline", "decline");
			RequestDispatcher rd=req.getRequestDispatcher("RequestUpdate.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("failed", "Invalid Acc_no or Password");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
	}

}
