package com.tap.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImp.UserDAOImp;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		
		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));
		
		User user = new User(userName, email, hashpw, address, role);
		
		UserDAOImp userDAOImp = new UserDAOImp();
		int i = userDAOImp.addUser(user);
		
		if(i == 1) {
			resp.sendRedirect("login.jsp");
		}else {
			resp.sendRedirect("register.jsp");
		}
		
	}

}
