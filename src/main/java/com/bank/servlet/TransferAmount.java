package com.bank.servlet;

import java.io.IOException;

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
@WebServlet("/transfer-amount")
public class TransferAmount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 CustomerDAO cdao=new CustomerDAOImp1(); 
		  Transaction t1=null; //sender transaction details 
		  Transaction t2=null; //receiver transaction details 
		  TransactionDAO tdao=new TransactionDAOImpl();
		String acc_no=req.getParameter("acc_no");
		String money=req.getParameter("amount");
		String password=req.getParameter("password");
		long receiver_accno=Long.parseLong(acc_no);
		double amount=Double.parseDouble(money);
		int pass=Integer.parseInt(password);
		HttpSession session=req.getSession(false);
		Customer c=(Customer)session.getAttribute("customer");
		Customer receiver=cdao.getCustomer(receiver_accno); 
		 if(c.getAccno()!=receiver.getAccno()&&c.getBal()>0&&c.getBal()>=amount&&amount>0) 
		  { 
		   int pin=pass; 
		   if(pin==c.getPin()) 
		   { 
		    c.setBal(c.getBal()-amount); 
		    boolean c_res=cdao.updateCustomer(c); 
		//updateCustomer() already overridden in deposit module inside CustomerDAOImpl 
		    if(c_res) 
		    { 
		     t1=new Transaction(); 
		     t1.setTransactionId(TransactionID.generateTransactionId()); 
		     t1.setUser(c.getAccno());     
		     t1.setRec_acc(receiver.getAccno());     
		     t1.setTransaction("DEBITED");    
		     t1.setAmount(amount);    
		     t1.setBalance(c.getBal()); 
		     boolean res1=tdao.insertTransaction(t1); 
		    } 
		 //insertTransaction() already overridden in deposit module inside TransactionDAOImpl 
		    //amount is getting debited from sender account    
		    receiver.setBal(receiver.getBal()+amount); 
		    boolean receiver_res=cdao.updateCustomer(receiver); 
		    if(receiver_res) 
		    { 
		     { 
		      t2=new Transaction(); 
		      t2.setTransactionId(t1.getTransactionId());     
		      t2.setUser(receiver.getAccno());      
		      t2.setRec_acc(c.getAccno());      
		      t2.setTransaction("CREDITED");    
		      t2.setAmount(amount);      
		      t2.setBalance(receiver.getBal()); 
		      boolean res1=tdao.insertTransaction(t2); 
		     } 
		    } 
		    //amount is getting credited to receiver account 
		    if(c_res&&receiver_res) 
		    { 
		    	req.setAttribute("successful", "Transaction successfully");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp); 
		    } 
		    else 
		    { 
		    	req.setAttribute("failed2", "Transaction Failure");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp);
		    } 
		   } 
		  } 
		  else 
		  { 
			  req.setAttribute("failed2", "Transaction Failure");
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp);
		  } 
		}

}
