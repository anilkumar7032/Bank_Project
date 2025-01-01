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
@WebServlet("/updateAcc")
public class UpdateAccount extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String name=req.getParameter("name");
		 String phone1=req.getParameter("phone");
		 String mail=req.getParameter("mail");
		 long phone=Long.parseLong(phone1);
		 HttpSession session=req.getSession(false);
		 CustomerDAO cdao=new CustomerDAOImp1();
		 Customer c=(Customer)session.getAttribute("customer");
		
		 if(c!=null) {
			 c.setName(name);
			 c.setPhone(phone);
			 c.setMail(mail);
			 boolean result=cdao.updateCustomer(c);
			 if(result) {
				 session.setAttribute("success","Data updated succussfully");
				 RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp?upd-box");
				 rd.forward(req, resp);
			 }
			 else {
				 session.setAttribute("failed","The Data failed to update ");
				 RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp?upd-box");
				 rd.forward(req, resp);
			 }
		 }
		 else {
			 session.setAttribute("failed","The Data failed to update ");
			 RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			 rd.forward(req, resp);
		 }
	}

}
