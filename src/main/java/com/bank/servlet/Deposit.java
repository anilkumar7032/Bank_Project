package com.bank.servlet;

import java.io.IOException;
import java.util.Scanner;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp1;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deposit")
public class Deposit extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String money=req.getParameter("amount");
		double amount=Double.parseDouble(money);
		CustomerDAO cdao=new CustomerDAOImp1(); 
		  TransactionDAO tdao=new TransactionDAOImpl(); 
		  HttpSession session=req.getSession(false);
		  Customer c=(Customer)session.getAttribute("customer");
		  c.setBal(c.getBal()+amount); 
		  boolean res=cdao.updateCustomer(c); 
		  if(res) 
		  { 
		   Transaction t=new Transaction(); 
		   t.setTransactionId(TransactionID.generateTransactionId()); 
		   t.setUser(c.getAccno()); 
		   t.setRec_acc(c.getAccno()); 
		   t.setTransaction("CREDITED"); 
		   t.setAmount(amount); 
		   t.setBalance(c.getBal());   
		   boolean res1=tdao.insertTransaction(t); 
		   if(res) 
		   { 
			   req.setAttribute("successfully", "deposit successfully");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp);
		   } 
		else 
		   { 
			 req.setAttribute("failed3", "deposit Failure");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp); 
		   } 
		  } 
	}

}
